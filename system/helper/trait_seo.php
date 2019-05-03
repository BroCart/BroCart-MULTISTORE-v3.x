<?php
/**
 * @package		BroCart v.3.3.3
 * @author		Artur Larin
 * @copyright	Copyright (c) 22019, BroCart & FIA Ltd. (https://www.brocart.net/)
 * @license		https://opensource.org/licenses/GPL-3.0
 * @link		https://forum.brocart.net
*/

trait seoBroker {	
	private static $connection;
	protected static $cached;
	protected static $cookies;
	private $cache_stack;
	protected static $cache_langs = array();
	
	public function __construct() {
		if (!defined('DB_DRIVER')) exit();
		self::$cached = new Cache('file', 3600);
		self::$cache_langs = self::$cached->get('catalog.seolang');
		self::$cookies = $this->cleaner($_COOKIE);		
    }
	
	private function initConnection() {		
        if (is_null(self::$connection)) {
            self::$connection = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE, DB_PORT);
        }
    }
	
	private function getSeoSettings() {
		$configuration = array();
		$configuration = self::$cached->get('catalog.seoconfig');
		if (!$configuration) {			
			$keys = array(
				'config_language',
				'config_seo_url_prefix',
				'config_seo_url_prefix_def',
				'config_seo_url_postfix',
				'config_seo_url_syfix',
				'config_seo_url_one',
				'config_seo_url_include_path',
				'config_seo_url',
				'config_seo_url_type'
			);
			$this->initConnection();
			foreach ($keys as $key) {
				$query = self::$connection->query("SELECT value FROM " . DB_PREFIX . "setting WHERE store_id = '0' AND `key` = '" . self::$connection->escape($key) . "'");
				if ($query->num_rows) {
					$configuration[$key] = $query->row['value'];
				} else {
					$configuration[$key] = null;	
				}
			}
			self::$cached->set('catalog.seoconfig', $configuration);
		}
		return $configuration;
    }
	
    public function rewriter($link, $config = array(), $code = false) {
		$seo_bro = true;
	//	$this->debug(__LINE__, $config);
		if (!$config) {
			$config = $this->getSeoSettings();
		}
		if (!isset($config['config_seo_url_type']) || ($config['config_seo_url_type'] != 'seo_bro')) {
			$seo_bro = false;
		}
		$lang_prefix = '';		
		if (!isset($config['config_seo_url'])) {
			return $link;
		}
		
		if (!isset($config['config_language_id'])) {
			$config['config_language_id'] = self::$cache_langs[$config['config_language']]['language_id'];
		}
		if ($config['config_seo_url_one']) {
			$config['config_language_id'] = self::$cache_langs[$config['config_language']]['language_id'];
		}
		if ($code) {
			if ($config['config_seo_url_one']) {
				$config['config_language_id'] = self::$cache_langs[$config['config_language']]['language_id'];
			} else {
				$config['config_language_id'] = self::$cache_langs[$code]['language_id'];
			}			
		}		
		if ($seo_bro && $config['config_seo_url_prefix']) {
			if ($config['current_language_code']) {		
				if ($code) {
					$lang_prefix = self::$cache_langs[$code]['prefix'];
				} else {
					$lang_prefix = self::$cache_langs[$config['current_language_code']]['prefix'];
				}				
			} else {
				if ($code) {					
					$lang_prefix = self::$cache_langs[$code]['prefix'];
				} elseif (isset(self::$cookies['language'])) {
					$lang_prefix = self::$cache_langs[self::$cookies['language']]['prefix'];
				} else {
					$lang_prefix = self::$cache_langs[$config['config_language']]['prefix'];
				}				
			}			
		}
		$seo_url = '';
		$allow_gets = array(
			'page',
			'sort',
			'order',
			'limit',
			'filter',
			'product_id',
			'category_id',
			'information_id',
			'manufacturer_id',
			'search',			
			'order_id',
			'description',
			'path',			
			'tag',			
			'sub_category'
		);
		$allow_postfix = array(			
			'information/information',
			'product/product',
			'blog/article'
		);
		$allow_syfix = array(			
			'product/category',
			'product/manufacturer/info',
			'product/manufacturer',
			'information/contact',
			'product/special',
			'product/compare'
		);
		$component = parse_url(str_replace('&amp;', '&', $link));		
		$data = array();
		parse_str($component['query'], $data);		
		$route = $data['route'];
		unset($data['route']);
		switch ($route) {
			case 'product/product':
				if (isset($data['product_id'])) {
					$tmp = $data;
					$data = array();
					if ($config['config_seo_url_include_path'] != 'none') {
						$data['path'] = $this->getProPath($tmp['product_id'], $config['config_seo_url_include_path']);
					}
					$data['product_id'] = $tmp['product_id'];
					if (isset($tmp['tracking'])) {
						$data['tracking'] = $tmp['tracking'];
					}
				}
				break;
			case 'product/category':
				if (isset($data['path'])) {
					$category = explode('_', $data['path']);
					$category = end($category);
					$data['path'] = $this->getCatPath($category, $config['config_seo_url_include_path']);					
					if (!$data['path']) {
						return $link;
					}
				}
				break;
			case 'product/product/review':
			case 'information/information/agree':
				return $link;
				break;
			default:
				break;
		}

		if ($component['scheme'] == 'https') {
			$link = HTTPS_SERVER;
		} else {
			$link = HTTP_SERVER;
		}
		
		/* if ($seo_bro && $config['config_seo_url_prefix']) {
			if ($config['config_seo_url_prefix_def']) {
				if ($lang_prefix != self::$cache_langs[$config['config_language']]['prefix']) {
					$link .= $lang_prefix . '/index.php?route=' . $route;
				} else{
					$link .= 'index.php?route=' . $route;
				}				
			} else {
				$link .= $lang_prefix . '/index.php?route=' . $route;
			}
		} else {
			$link .= 'index.php?route=' . $route;
		} */
		
		$link .= 'index.php?route=' . $route;
		
		if (count($data)) {
			$link .= '&amp;' . urldecode(http_build_query($data, '', '&amp;'));
		}		
		$queries = array();
		if(!in_array($route, array('product/search'))) {
			foreach($data as $key => $value) {
				switch($key) {
					case 'product_id':
					case 'manufacturer_id':
					case 'category_id':
					case 'information_id':
					case 'search':
					case 'tag':
					case 'order_id':
						$queries[] = $key . '=' . $value;
						unset($data[$key]);
						break;
					case 'path':
						$categories = explode('_', $value);
						foreach($categories as $category) {
							$queries[] = 'category_id=' . $category;
						}
						unset($data[$key]);
						break;
					default:
						break;
				}
				if (!in_array($key, $allow_gets)) {
					unset($data[$key]);
				}
				/* if ($key == 'page') {
					if ($value == 1) {
						unset($data[$key]);
					} else {
						if (isset($this->session->data['maxpage']) && $this->session->data['maxpage'] < $value) {					
							$data[$key] = $this->session->data['maxpage'];
						}
					}
				} */
			}
		}
		if (empty($queries)) {
			$queries[] = $route;
		}
		$this->cache_stack = $this->getSeoDataByLangId($config['config_language_id']);
		$rows = array();
		foreach($queries as $query) {
			if(isset($this->cache_stack['queries'][$query])) {
				$rows[] = array('query' => $query, 'keyword' => $this->cache_stack['queries'][$query]);
			}
		}		
		if(count($rows) == count($queries)) {
			$aliases = array();
			foreach($rows as $row) {
				$aliases[$row['query']] = $row['keyword'];				
			}
			foreach($queries as $query) {
				$seo_url .= '/' . rawurlencode($aliases[$query]);
			}
		}
		if ($seo_url == '') {
			return $link;
		}
		if ($seo_bro && $config['config_seo_url_prefix']) {
			if ($config['config_seo_url_prefix_def']) {
				if ($lang_prefix != self::$cache_langs[$config['config_language']]['prefix']) {
					$seo_url = $lang_prefix . '/' . trim($seo_url, '/');
				} else{
					$seo_url = trim($seo_url, '/');
				}
			} else {
				$seo_url = $lang_prefix . '/' . trim($seo_url, '/');
			}
		} else {
			$seo_url = trim($seo_url, '/');
		}		
		if ($component['scheme'] == 'https') {
			$seo_url = HTTPS_SERVER . $seo_url;
		} else {
			$seo_url = HTTP_SERVER . $seo_url;
		}		
		if (isset($config['config_seo_url_postfix']) && in_array($route, $allow_postfix)) {
			$seo_url .= trim($config['config_seo_url_postfix']);
		} elseif (isset($config['config_seo_url_syfix']) && in_array($route, $allow_syfix)) {
			$seo_url .= trim($config['config_seo_url_syfix']);
		} else {	
			$seo_url .= '';
		}
		
		if (utf8_substr($seo_url, -2) == '//') {
			$seo_url = utf8_substr($seo_url, 0, -1);
		}
		if (count($data)) {
			$seo_url .= '?' . urldecode(http_build_query($data, '', '&amp;'));
		}
		return $seo_url;
	}
	
	private function getProPath($product_id, $include = 'full') {
		$pro_path = self::$cached->get('catalog.path.pro');
		if (!isset($pro_path[$product_id])) {
			$this->initConnection();
			$query = self::$connection->query("SELECT `category_id` FROM `" . DB_PREFIX . "product_to_category` WHERE product_id = '" . (int)$product_id . "' AND main_category = '1' ORDER BY main_category DESC LIMIT 1");
			if ($include == 'full') {
				$pro_path[$product_id] = $this->getCatPath($query->num_rows ? (int)$query->row['category_id'] : 0, $include);
			} elseif ($include == 'last') {
				$pro_path[$product_id] = $query->num_rows ? (int)$query->row['category_id'] : 0;			
			} else {
				return false;
			}			
			self::$cached->set('catalog.path.pro', $pro_path);
		}
		return $pro_path[$product_id];
	}	
	
	private function getCatPath($category_id = false, $include = 'full') {
		if (!$category_id) return false;
		$cat_path = self::$cached->get('catalog.path.cat');		
		if (!isset($cat_path[$category_id])) {
			$this->initConnection();			
			if ($include == 'full') {	
				$query = self::$connection->query("SELECT GROUP_CONCAT(`path_id` ORDER BY `level` SEPARATOR '_') AS trix FROM `" . DB_PREFIX . "category_path` WHERE category_id = '" . (int)$category_id . "' GROUP BY category_id");
				$cat_path[$category_id] = $query->num_rows ? $query->row['trix'] : 0;
			} elseif ($include == 'last') {
				$query = self::$connection->query("SELECT `parent_id` AS trix FROM `" . DB_PREFIX . "category` WHERE category_id = '" . (int)$category_id . "' GROUP BY category_id");
				if ($query->num_rows) {
					if (!$query->row['trix']) {
						$cat_path[$category_id] = $category_id;
					} else {
						$cat_path[$category_id] = $query->row['trix'].'_'.$category_id;
					}
				}
			} else {
				$cat_path[$category_id] = $category_id;
			}			
			self::$cached->set('catalog.path.cat', $cat_path);
		}
		return $cat_path[$category_id];		
	}
	
	private function getSeoDataByLangId($lang_id) {		
		$lang_data = array();
		$lang_data = self::$cached->get('catalog.seo_bro.0.'.(int)$lang_id);
		if (!$lang_data) {
			$this->initConnection();
			$query = self::$connection->query("SELECT LOWER(`keyword`) as 'keyword', `query` FROM " . DB_PREFIX . "seo_url WHERE store_id='0' AND language_id = '".(int)$lang_id."' ORDER BY seo_url_id");
			foreach ($query->rows as $row) {
				$lang_data['keywords'][$row['keyword']] = $row['query'];
				$lang_data['queries'][$row['query']] = $row['keyword'];
			}
			self::$cached->set('catalog.seo_bro.0.'.(int)$lang_id, $lang_data);
		}		
		return $lang_data;
	}
	
	private function cleaner($data) {
		if (is_array($data)) {
			foreach ($data as $key => $value) {
				unset($data[$key]);
				$data[self::cleaner($key)] = self::cleaner($value);
			}
		} else {
			$data = htmlspecialchars($data, ENT_COMPAT, 'UTF-8');
		}
		return $data;
	}
		
	private function debug($line, $code = '') {
		$debug = fopen(DIR_LOGS . 'error.log', 'a');
		fwrite($debug, '['.date('G:i:s').'('.$line.')] ' . print_r($code, true) . "\n");
		fclose($debug);
	}
}

?>
