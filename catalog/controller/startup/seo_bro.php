<?php
/**
 * @package		BroCart v.3.3.3
 * @author		Artur Larin
 * @copyright	Copyright (c) 22019, BroCart & FIA Ltd. (https://www.brocart.net/)
 * @license		https://opensource.org/licenses/GPL-3.0
 * @link		https://forum.brocart.net
*/

class ControllerStartupSeoBro extends Controller {
	
	private $cache_stack = null;
	protected static $cookies = null;
	protected static $languages = array();
	protected static $prefix = array();
	protected static $config_language;
	protected static $config_prifix_lang;
	protected static $config_prifix_hide;
	protected static $config_url_postfix;
	protected static $config_url_syfix;
	protected static $incl_path = 'full';
	protected static $the_one = false;
	protected static $is_config = false;
	protected static $curr_code = false;	
	
	use seoHelper {
		seoHelper::__construct as private __rocketLayer;
	}
	
	public function __construct($registry) {
		$this->__rocketLayer();
		parent::__construct($registry);
		self::$config_language = $this->config->get('config_language');		
		self::$config_prifix_lang = $this->config->get('config_seo_url_prefix');
		self::$config_prifix_hide = $this->config->get('config_seo_url_prefix_def');
		self::$the_one = $this->config->get('config_seo_url_one');
		self::$incl_path = $this->config->get('config_seo_url_include_path');
		self::$config_url_postfix = $this->config->get('config_seo_url_postfix');
		self::$config_url_syfix = $this->config->get('config_seo_url_syfix');		
		self::$languages = $this->getLanguagesStack();
		self::$cookies = $this->cleaner($_COOKIE);			
		foreach (self::$languages as $longer) {
			self::$prefix[$longer['prefix']] = $longer['code'];
		}
		$this->setLanguageByRoute();		
	}
	
	private function setLanguageByRoute() {
		$language_id = 0;
		$keyword_data = array();
		$code = false;	
		if (isset($this->request->get['_route_'])) {
			$chunks = $this->getChunksFromUrl($this->request->get['_route_']);
			if (is_array($chunks)) {
				//Проверка на единый урл, если е единый, то...
				if (!self::$the_one) {
					//Проверка на включеные префиксы языков
					if (self::$config_prifix_lang) {
						//Прятать ли язык по умолчанию ?
						if (self::$config_prifix_hide) {
							//Если есть какой то код, взятый из префикса
							if (self::$curr_code) {
								//Тогда проставляем переменную $code - префиксом, взятым из 0-го чанка
								$code = self::$curr_code;
							} else {
								//Если нет - то проставляем переменную $code - языком по умолчанию
								$code = self::$config_language;		
							}
						//Если не прятать язык, то...
						} else {
							//Если есть какой то код, взятый из префикса
							if (self::$curr_code) {
								//Тогда проставляем переменную $code - префиксом, взятым из 0-го чанка
								$code = self::$curr_code;
							}
						}
					//Если префиксы языков не включены то...
					} else {
						if (utf8_strlen($chunks[0]) > 2) {					
							foreach ($chunks as $keywords) {
								$keyword_data[] = $this->getLanguageByKeyword($keywords);
							}
							$exclusive = array_unique($keyword_data, SORT_REGULAR);
							if (count($exclusive == 1)) {
								if (self::$languages) {			
									foreach (self::$languages as $longer) {
										if ($longer['language_id'] == $exclusive[0]) {
											$code = $longer['code'];
										}				
									}
								}
							}					
						} elseif (isset(self::$curr_code)) {
							$code = self::$curr_code;
						}					
					}
				} else {
					$code = self::$curr_code;
					
				}
			}
		} elseif (isset($this->request->post['code'])) {
			if (isset($this->request->get['route']) && $this->request->get['route'] == 'common/language/language') {
				$code = $this->request->post['code'];
			}
		} else {
			if (isset($this->session->data['language'])) {
				$code = $this->session->data['language'];
			} elseif (self::$curr_code) {
				$code = self::$curr_code;
			} else {
				$code = self::$config_language;
			}
			
		}
		if (self::$the_one && !self::$curr_code) {
			$code = self::$config_language;
		}
		if (!$code) {
			if (isset(self::$cookies['language'])) {
				$code = self::$cookies['language'];	
			}		
		}
		if (self::$is_config) {
			$code = self::$config_language;
		}
		if (!isset($this->request->cookie['language']) || $this->request->cookie['language'] != $code) {
			setcookie('language', $code, time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
		}
		
		if (!isset($this->session->data['language']) || $this->session->data['language'] != $code) {
			$this->session->data['language'] = $code;
			$language = new Language($code);
			$language->load($code);			
			$this->registry->set('language', $language);
			$this->config->set('config_language_id', self::$languages[$code]['language_id']);	
		}
	}
	
	private function getChunksFromUrl($murl = '') {
		if (utf8_strlen($murl) > 0) {
			$chunks = explode('/', trim(utf8_strtolower($murl), '/'));
			if (utf8_strlen(end($chunks)) == 0) {
				array_pop($chunks);
			} else {
				$last_chunk = explode('.', array_pop($chunks));
				array_push($chunks, $last_chunk[0]); 
			}
			if (is_array($chunks)) {

				if (utf8_strlen($chunks[0]) > 2) {
					if (self::$config_prifix_lang) {
						if (self::$config_prifix_hide) {
							self::$curr_code = self::$config_language;
							self::$is_config = true;
						}
					}
				} elseif (isset($chunks[0]) && (utf8_strlen($chunks[0]) == 2) && isset(self::$prefix[$chunks[0]]) && array_key_exists(self::$prefix[$chunks[0]], self::$languages)) {
					$language_prefix = array_shift($chunks);					
					self::$curr_code = self::$prefix[$language_prefix];
					self::$is_config = false;
				}
				return $chunks;
			}
		}
		return false;
	}
	
	public function index() {
		if ($this->config->get('config_seo_url')) {
			$seo_rewrite_config = array(
				'config_language_id'			=> $this->config->get('config_language_id'),
				'config_language'				=> self::$config_language,
				'current_language_code'			=> (self::$curr_code ? self::$curr_code : self::$config_language),
				'config_seo_url_prefix'			=> self::$config_prifix_lang,
				'config_seo_url_prefix_def'		=> self::$config_prifix_hide,
				'config_seo_url_include_path'	=> self::$incl_path,
				'config_seo_url_postfix'		=> self::$config_url_postfix,
				'config_seo_url_syfix'			=> self::$config_url_syfix,
				'config_seo_url_one'			=> self::$the_one,
				'config_seo_url'				=> $this->config->get('config_seo_url'),
				'config_seo_url_type'			=> $this->config->get('config_seo_url_type')
			);			
			$this->url->addRewrite($seo_rewrite_config);	
		} else {
			return;
		}
		if (self::$the_one) {
			$language_by_config = self::$languages[self::$config_language]['language_id'];
		} else {
			$language_by_config = $this->config->get('config_language_id');
		}		
		$this->cache_stack = $this->getSeoDataByLangId($language_by_config);		
		if (isset($this->request->get['_route_'])) {			
			$route = $this->request->get['_route_'];			
			unset($this->request->get['_route_']);
			$chunks = $this->getChunksFromUrl($route);
			if (self::$curr_code) {
				$route = utf8_substr($route, utf8_strlen(self::$languages[self::$curr_code]['prefix']) + 1);
			}
			if (!isset($chunks[0])) {
				unset($chunks);
			}
			if (isset($chunks)) {
				$parts = array();
				foreach ($chunks as $keyword) {
					if (isset($this->cache_stack['keywords'][$keyword])) {
						$parts[] = array('keyword' => $keyword, 'query' => $this->cache_stack['keywords'][$keyword]);
					}
				}			
				if (isset($this->cache_stack['keywords'][$route])) {
					$keyword = $route;
					$chunks = array($keyword);
					$parts = array(array('keyword' => $keyword, 'query' => $this->cache_stack['keywords'][$keyword]));
				}	
				if (count($parts) == count($chunks)) {
					$queries = array();
					foreach ($parts as $row) {
						$queries[utf8_strtolower($row['keyword'])] = $row['query'];
					}
					reset($chunks);
					foreach ($chunks as $part) {
						if (!isset($queries[$part])) {
							return false;
						}
						$url = explode('=', $queries[$part], 2);
						if ($url[0] == 'category_id') {
							if (!isset($this->request->get['path'])) {
								$this->request->get['path'] = $url[1];
							} else {
								$this->request->get['path'] .= '_' . $url[1];
							}
						} elseif (count($url) > 1) {
							$this->request->get[$url[0]] = $url[1];
						}
					}
				} else {
					$this->request->get['route'] = 'error/not_found';
				}
				if (isset($this->request->get['product_id'])) {
					$this->request->get['route'] = 'product/product';
					if (!isset($this->request->get['path'])) {						
						$path = $this->getProPath($this->request->get['product_id'], self::$incl_path);
						if ($path) {
							$this->request->get['path'] = $path;
						}
					}			
				} elseif (isset($this->request->get['path'])) {
					$this->request->get['route'] = 'product/category';
				} elseif (isset($this->request->get['manufacturer_id'])) {
					$this->request->get['route'] = 'product/manufacturer/info';
				} elseif (isset($this->request->get['information_id'])) {
					$this->request->get['route'] = 'information/information';
				} elseif (isset($this->cache_stack['queries'][$route])) {
					header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');
					$this->response->redirect($this->cache_stack['queries'][$route], 301);
				} else {					
					if (isset($queries[$chunks[0]])) {
						$this->request->get['route'] = $queries[$chunks[0]];
					}
				}
			}
		} 
		$this->protector();
	}
	
	private function protector($url = '') {
		if (empty($this->request->get['route'])) {
			$this->request->get['route'] = 'common/home';
		}
		if (isset($this->request->get['route']) && $this->request->get['route'] == 'error/not_found') {
			return;
		}		
		if (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
			return;
		}
		if (isset($this->request->post['code'])) {			
			return;
		}
		if (((isset($_SERVER['HTTPS']) && (strtolower($_SERVER['HTTPS']) == 'on' || $_SERVER['HTTPS'] == '1')) || (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && (strtolower($_SERVER['HTTP_X_FORWARDED_PROTO']) == 'https') || (!empty($_SERVER['HTTP_X_FORWARDED_SSL']) && strtolower($_SERVER['HTTP_X_FORWARDED_SSL']) == 'on')))) {
		 	$server_way = rtrim(HTTP_SERVER, '/');
		} else {
			$server_way = rtrim(HTTPS_SERVER, '/');
		}
		$blitz = $this->url->link($this->request->get['route'], urldecode(http_build_query(array_diff_key($this->request->get, array_flip(array('route'))))));
		$url = $server_way . $this->request->server['REQUEST_URI'];
		if (rawurldecode($url) != rawurldecode($blitz)) {
			header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');
			$this->response->redirect($blitz, 301);
		}
	}
}

?>
