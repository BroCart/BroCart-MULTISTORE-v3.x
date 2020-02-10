<?php
class SlaSeoPro {
	private $cache_data = null;
	private $ajax = false;
	private $use_cache = true;
	private $language_code = array();
	private $language_id = array();

	private $use_lang_prefix = 1;
	private $lang_prefix = array();

	public function getLangeInfo(){
		return array(
			'language_code' => $this->language_code,
			'language_id' => $this->language_id,
			'use_lang_prefix' => $this->use_lang_prefix,
			'lang_prefix' => $this->lang_prefix,
			
		);
	}

	public function __get($name) {
		return $this->registry->get($name);
	}

	public function __construct($registry) {
		$this->registry = $registry;
		
		if ($this->config->get('config_seo_url') && $this->config->get('module_sla_seo_pro_status')) {

			$this->use_lang_prefix = $this->config->get('module_sla_seo_pro_use_lang_prefix');
			
			$this->ajax = (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');
			$query = $this->db->query("SELECT language_id, code FROM " . DB_PREFIX . "language WHERE status = '1'");
			$sla_seo_pro_lang_prefix = is_array($this->config->get('module_sla_seo_pro_lang_prefix'))?$this->config->get('module_sla_seo_pro_lang_prefix'):array();
			
			foreach ($query->rows as $result) {
				$this->language_id[$result['code']] = $result['language_id']?$result['language_id']:$this->config->get('config_language_id');
				$this->language_code[$result['language_id']] = $result['code'];
				if ($this->use_lang_prefix) {
					if (isset($sla_seo_pro_lang_prefix[$result['language_id']])) {
						$this->lang_prefix[$result['language_id']] = $sla_seo_pro_lang_prefix[$result['language_id']];
					} else {
						$this->lang_prefix[$result['language_id']] = $result['code'];
					}
				}
			}
			if ($this->use_cache) {
				$cache_key = 'seo_pro.'. $this->config->get('config_store_id');
				$this->cache_data = $this->cache->get($cache_key);
				if (!$this->cache_data) {
					$sql_language = '';
					if ($this->use_lang_prefix) {
						$sql_language = ' AND language_id = ' . (int)$this->config->get('module_sla_seo_pro_use_lang_prefix_main');
					}
					$query = $this->db->query("SELECT `keyword`, `query`, `seopath`, `language_id` FROM " . DB_PREFIX . "seo_url WHERE store_id = '" . $this->config->get('config_store_id') . "'" . $sql_language);
					$this->cache_data = array();
					foreach ($query->rows as $row) {

						$language_id = $row['language_id']?$row['language_id']:$this->config->get('config_language_id');
	
						if (isset($this->cache_data['keywords'][$language_id][$row['keyword']])){
							continue;
						}
/*
						$this->cache_data['keywords'][$row['keyword']] = array(
							'language_id' => $language_id,
							'query'       => $row['query'],
						);

*/
						$this->cache_data['queries'][$language_id][$row['query']] = $row['keyword'];

						if ($row['seopath'])
							$this->cache_data['seopath'][$row['query']] = $row['seopath'];
					}
					$this->cache->set($cache_key, $this->cache_data);
				}
			}
		}
	}

	public function prepareRoute() {

		if (!$this->config->get('config_seo_url') && !$this->config->get('module_sla_seo_pro_status')) return;

		$prefix = '';
		
		$old_get = $this->request->get;
		if (!isset($this->request->get['_route_'])) {
			$this->validate();
		} else {
		
			$sla_seo_pro_postfix = trim($this->config->get('module_sla_seo_pro_postfix'));
			if ($sla_seo_pro_postfix) {
				$this->request->get['_route_'] = str_replace('.' . $sla_seo_pro_postfix , '', $this->request->get['_route_']);
			}
			$route_ = $route = $this->request->get['_route_'];

			$parts = explode('/', trim($route, '/'));



			$rows = array();

			if ($this->use_lang_prefix && in_array($parts[0],$this->lang_prefix)) {
				$this->lang_prefix_detect = array_shift($parts);
			} else {
				$this->lang_prefix_detect = false;
			}

			if ($this->config->get('module_sla_seo_pro_prefix_product')) {
				$sla_seo_pro_prefix_product = trim($this->config->get('module_sla_seo_pro_prefix_product'));
				if (isset($parts[0]) && $parts[0] == $sla_seo_pro_prefix_product) {
					array_shift($parts);
					$prefix = 'product/product';
				}
			}

			if ($this->config->get('module_sla_seo_pro_prefix_category') && !$prefix) {
				$sla_seo_pro_prefix_category = trim($this->config->get('module_sla_seo_pro_prefix_category'));
				if (isset($parts[0]) && $parts[0] == $sla_seo_pro_prefix_category) {
					array_shift($parts);
					$prefix = 'product/category';
				}
			}

			if ($this->config->get('module_sla_seo_pro_prefix_brand') && !$prefix) {
				$sla_seo_pro_prefix_brand = trim($this->config->get('module_sla_seo_pro_prefix_brand'));
				if (isset($parts[0]) && $parts[0] == $sla_seo_pro_prefix_brand) {
					array_shift($parts);
					$prefix = 'product/manufacturer/info';
				}
			}

			if ($this->config->get('module_sla_seo_pro_seo_page')) {
				$may_be_page = end($parts);
				if (strpos($may_be_page,'page-') !==false) {
					$pages = explode('-',$may_be_page);
					if (!empty($pages[1])) {
						if ((int)$pages[1] > 0) {
							$this->request->get['page'] = (int)$pages[1];
							array_pop($parts);
						}
					}
				}
			}

			foreach ($parts as $keyword) {
				$result = $this->getQuery($keyword);
				
				if ($result) {
					$rows[] = array(
						'keyword' => $keyword,
						'query' => $result['query']
					);
				}
			}



			if (count($rows) == sizeof($parts)) {

				$language_id = $this->language_id[$this->session->data['language']];
				$lang_code = $old_lang_code = $this->session->data['language'];
				
				$queries = array();
				$i=0;
				foreach ($rows as $row) {
if (isset($row['query']) && $row['query']) {
					if ($i == 0) {
						$lang_code = $this->language_code[$row['query']['language_id']];
						$language_id = $this->language_id[$lang_code];
					}
					if ($lang_code == $this->language_code[$row['query']['language_id']]) {
						$queries[$row['keyword']] = $row['query']['query'];
					} else {
						$this->request->get['route'] = 'error/not_found';
						break;
					};
					$i++;
}
				}

				if ($lang_code != $old_lang_code || $this->lang_prefix_detect) {
//					if ($this->lang_prefix_detect) {
						$language_id = array_search($this->lang_prefix_detect, $this->lang_prefix);
						$lang_code = $this->language_code[$language_id];
//					}
					
					$this->initLanguage($lang_code,  $language_id);
				}

				reset($parts);

				foreach ($parts as $part) {
					if(!isset($queries[$part])) return $parts;
					$url = explode('=', $queries[$part], 2);
					
					if ($url[0] == 'xl_article_id') {
						if (!isset($this->request->get['article'])) {
						$this->request->get['article'] = $url[1];
					} else {
						$this->request->get['article'] .= '_' . $url[1];
					         }
					}

					if (!preg_match("/article/i", $route_)) {

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
				}

				if (isset($this->request->get['product_id'])) {
					$this->request->get['route'] = 'product/product';
					if (!isset($this->request->get['path'])) {
						$path = $this->getPathByProduct($this->request->get['product_id']);
						if ($path) $this->request->get['path'] = $path;
					}
				} elseif (isset($this->request->get['path'])) {
					if ($this->config->get('module_sla_seo_pro_short_url')) {
						$category = explode('_', $this->request->get['path']);
						$category = end($category);
						$this->request->get['path'] = $this->getPathByCategory($category);
					}
					$this->request->get['route'] = 'product/category';
				} elseif (isset($this->request->get['manufacturer_id'])) {
					$this->request->get['route'] = 'product/manufacturer/info';
				} elseif (isset($this->request->get['information_id'])) {
					$this->request->get['route'] = 'information/information';

			} elseif (isset($this->request->get['article'])) {
				$this->request->get['route'] = 'information/article';
			
				} elseif (isset($this->request->get['article_id'])) {
					$this->request->get['route'] = 'blog/article';
				} else {
					if (isset($parts[0]) && isset($queries[$parts[0]]) && !strpos($queries[$parts[0]],'=')) {
						$this->request->get['route'] = $queries[$parts[0]];
					} else {
						if ($prefix) {
							$this->request->get['route'] = 'error/not_found';
						}
					}
				}
			}

			if (isset($this->request->get['route'])) {
				$this->validate();
				return array();
			}
			$this->request->get = $old_get;
			return $parts;
		}
	}

	public function rewrite(&$data) {
		if (!$this->config->get('config_seo_url') && !$this->config->get('module_sla_seo_pro_status')) return;
		$prefix = '';
		$seo_url = '';
		$is_product = false;
		$route = $data['route'];
		switch ($route) {
			case 'product/product':
				if (isset($data['product_id'])) {
					$is_product = true;
					$tmp = $data;
					$data = array();
					if ($this->config->get('module_sla_seo_pro_include_path')) {
						$data['path'] = $this->getPathByProduct($tmp['product_id']);
						if (!$data['path']) unset($data['path']);
					} else {
						unset ($data['path']);
					}
					$data['product_id'] = $tmp['product_id'];
					$sla_seo_pro_utm = preg_split("/[\s,]+/",$this->config->get('module_sla_seo_pro_utm'));
					foreach ($sla_seo_pro_utm as $utm) {
						if (isset($tmp[$utm])) {
							$data[$utm] = $tmp[$utm];
						}
					}
					
					$prefix = trim($this->config->get('module_sla_seo_pro_prefix_product'));
				}
				break;

			case 'product/manufacturer/info':
				$prefix = $this->config->get('module_sla_seo_pro_prefix_brand');
				break;


			case 'information/article':
				if (isset($data['article'])) {
					$article = explode('_', $data['article']);
					$article = end($article);
					$data['article'] = $this->getPathArticle($article);
					if (!$data['article']) return $url;
				}
				break;
			
			case 'product/category':
				if (isset($data['path'])) {
					$category = explode('_', $data['path']);
					$category = end($category);
					$data['path'] = $this->getPathByCategory($category);
					
					if (!$data['path']) {unset($data['path']) ;return; }

					if ($this->config->get('module_sla_seo_pro_short_url')) {	
						$dpath = explode('_',$data['path']);
						$data['path'] = end($dpath);
					}
					$prefix = $this->config->get('module_sla_seo_pro_prefix_category');
				}
				break;

			default:
				break;
		}


		$queries = array();
//if(!in_array($route, array('product/search'))) {
		foreach($data as $key => $value) {
			switch($key) {
				case 'product_id':
					if ($is_product) {
						$queries[] = $key . '=' . $value;
						unset($data[$key]);
						$postfix = 1;
					}
					break;
				case 'information_id':
					if ($route == 'information/information') {
						$queries[] = $key . '=' . $value;
						unset($data[$key]);
						$postfix = 1;
					}
					break;
				case 'manufacturer_id':
				case 'article_id':
//				case 'category_id':
					$queries[] = $key . '=' . $value;
					unset($data[$key]);
					$postfix = 1;
					break;


				case 'xl_article_id':			
					unset($data[$key]);
				break;
		
				case 'article':
					$articles = explode('_', $value);
					$current = end($articles);
					$query = $this->db->query("SELECT a.article_id FROM " . DB_PREFIX . "xl_article a LEFT JOIN " . DB_PREFIX . "xl_article_to_store a2s ON (a.article_id = a2s.article_id) WHERE parent_id = '" . (int)$current . "' AND a2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND a.status = '1' LIMIT 1");
					if (!$query->rows) {
						$postfix = 1;
					}

					if ($this->config->get('article_show_path') == '1') {
						foreach ($articles as $article) {
							$queries[] = 'xl_article_id=' . $article;
						}
					} elseif ($this->config->get('article_show_path') == '2') {
						$articles = array_slice($articles, -2);
						foreach ($articles as $article) {
							$queries[] = 'xl_article_id=' . $article;
						}
					} elseif ($this->config->get('article_show_path') == '3' || $this->config->get('article_show_path') == '4') {
						$queries[] = 'xl_article_id=' . end($articles);
					} else {
						foreach ($articles as $article) {
							$queries[] = 'xl_article_id=' . $article;
						}
					}

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
		}
//}
		if(empty($queries)) {
			$queries[] = $route;
		}

		$rows = array();

		foreach($queries as $query) {
			$result = $this->getKeyword($query);

			if ($result) {
				$rows[] = array('query' => $query, 'keyword' => $result['keyword']);
				if (!array_key_exists('aridius_news_id',$data)) { unset($data['route']);}
			}
		}


		if(count($rows) == count($queries)) {
			$aliases = array();
			foreach($rows as $row) {
				$aliases[$row['query']] = $row['keyword'];
			}
			

		if (isset($articles) && $this->config->get('module_article_show_root') == '1') {
				$seo_url .= '/' . $this->config->get('module_article_alias');
		}
			
			foreach($queries as $query) {
				$seo_url .= '/' . rawurlencode($aliases[$query]);
			}
		}

		unset($data['_route_']);
		if ($seo_url == '') return $seo_url;

		$seo_url = trim($prefix, '/') . $seo_url;
		$seo_url = trim($seo_url, '/');

		if (isset($postfix)) {
			$sla_seo_pro_postfix = trim($this->config->get('module_sla_seo_pro_postfix'));
			if ($sla_seo_pro_postfix) {
				$seo_url .= '.' . $sla_seo_pro_postfix;
			} else {
				if 	($this->config->get('module_sla_seo_pro_postfix_slash_product')) {
					$seo_url .= '/';
				}
			}
		} else {
			if 	($this->config->get('module_sla_seo_pro_postfix_slash')) {
				$seo_url .= $seo_url?'/':'';
			}
		}
		
		//return  '/' . self::getLangPrefix()  . $seo_url;
		return  '/' . $seo_url;
	}

	public function getLink($link) {
		$url_info = parse_url(str_replace('&amp;', '&', $link));
		//$lang_prefix = trim(self::getLangPrefix(),'/');
		//if ($lang_prefix) $lang_prefix = '/' . $lang_prefix;
		return 		$url_info['scheme'] . '://'
				. 	$url_info['host']
				. 	(isset($url_info['port']) ? ':' . $url_info['port'] : '')
	//			. 	$lang_prefix
				.	$url_info['path']
				.   (isset($url_info['query'])? '?' . $url_info['query'] : '');

	}
	
	private function getLangPrefix() {
		$lang_prefix = '';
		if ($this->use_lang_prefix) {
			$this->lang_prefix_detect = $this->lang_prefix[$this->config->get('config_language_id')];
			if ($this->lang_prefix_detect) {
				$lang_prefix = $this->lang_prefix_detect . '/';
			}
		}
		return $lang_prefix;
	}

	public function getPage($url, &$data) {
/*
		if ($this->config->get('module_sla_seo_pro_seo_page')) {
			if (isset($data['page'])) {
				if ($data['page'] && $data['page'] != '{page}' && (int)$data['page'] != 1  ) {

					$url = rtrim($url,'/') . '/page-' . $data['page'];
				}
				unset($data['page']);
			}
		}
*/	
		return $url;
	}

	private function getPathByProduct($product_id) {
		$product_id = (int)$product_id;

		if ($product_id < 1) return false;
		
		$query_ = 'product_id=' . $product_id;

		if (isset($this->cache_data['seopath'][$query_]) && $this->cache_data['seopath'][$query_])
			return $this->cache_data['seopath'][$query_];

		$query = $this->db->query("	SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "' ORDER BY main_category DESC LIMIT 1");
		if ($query->num_rows) {
			$path_product_id = $this->getPathByCategory($query->row['category_id']);
		} else {
			return false;
		}

		if ($path_product_id) {
			$query = $this->db->query("UPDATE " . DB_PREFIX . "seo_url SET seopath = '" . $this->db->escape($path_product_id) . "'	WHERE query = 'product_id=" .(int)$product_id . "'");
		}

		$this->cache_data['seopath'][$query_] = $path_product_id;

		return $path_product_id;
	}


	private function getPathArticle($article_id) {
		$article_id = (int)$article_id;
		if ($article_id < 1) return false;

		static $path = null;
		if (!is_array($path)) {
			$path = $this->cache->get('article.seopath');
			if (!is_array($path)) $path = array();
		}

		if (!isset($path[$article_id])) {
			$max_level = 10;

			$sql = "SELECT CONCAT_WS('_'";
			for ($i = $max_level-1; $i >= 0; --$i) {
				$sql .= ",t$i.article_id";
			}
			$sql .= ") AS path FROM " . DB_PREFIX . "xl_article t0";
			for ($i = 1; $i < $max_level; ++$i) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "xl_article t$i ON (t$i.article_id = t" . ($i-1) . ".parent_id)";
			}
			$sql .= " WHERE t0.article_id = '" . $article_id . "'";

			$query = $this->db->query($sql);

			$path[$article_id] = $query->num_rows ? $query->row['path'] : false;

			$this->cache->set('article.seopath', $path);
		}

		return $path[$article_id];
	}
			
	private function getPathByCategory($category_id) {
		$category_id = (int)$category_id;

		if ($category_id < 1) return false;

		$query_ = 'category_id=' . $category_id;
		if (isset($this->cache_data['seopath'][$query_]) && $this->cache_data['seopath'][$query_])
			return $this->cache_data['seopath'][$query_];
		$sql = "SELECT GROUP_CONCAT(c1.category_id ORDER BY level SEPARATOR '_') path
		FROM " . DB_PREFIX . "category_path cp
		LEFT JOIN " . DB_PREFIX . "category c1 ON (cp.path_id = c1.category_id)
		WHERE cp.category_id = " . (int)$category_id . "
		GROUP BY cp.category_id";
		$query = $this->db->query($sql);

		$path_category_id = (isset($query->row['path']) && $query->row['path']) ? $query->row['path'] : false;
		if ($path_category_id) {
			$query = $this->db->query("
			UPDATE " . DB_PREFIX . "seo_url
			SET seopath = '" . $this->db->escape($path_category_id) . "'
			WHERE query = 'category_id=" . (int)$category_id . "'");
		}
		$this->cache_data['seopath'][$query_] = $path_category_id;
		
		return $path_category_id;
	}

	public function validate() {
		$this->checkGetParam();
		if ($this->ajax) {
			return;
		}
		if (php_sapi_name() == 'cli') {
			return;
		}

		if (isset($this->request->get['information_id']) && (isset($this->request->get['path']) || isset($this->request->get['manufacturer_id']) ) ) {
			$this->request->get['route'] = 'error/not_found';
			return;
		}

		if (isset($this->request->get['route']) && $this->request->get['route'] == 'error/not_found') {
			return;
		}

		if (isset($this->request->get['route']) && strpos($this->request->get['route'],'api/')  !== false) {
			return;
		}
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			return;
		}
		if (ltrim($this->request->server['REQUEST_URI'], '/') == 'sitemap.xml') {
			$this->request->get['route'] = 'extension/feed/google_sitemap_fast';
			return;
		}

		if (empty($this->request->get['route'])) {
			$this->request->get['route'] = 'common/home';
		}

		if ($this->request->get['route'] == 'product/search' && isset($this->request->get['search'])) {
//			return;
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$config_url = substr($this->config->get('config_ssl'), 0, $this->strpos_offset('/', $this->config->get('config_ssl'), 3) + 1);
		} else {
			$config_url = substr($this->config->get('config_url'), 0, $this->strpos_offset('/', $this->config->get('config_url'), 3) + 1);
		}

		$REQUEST_URI  = str_replace('&','&amp;',str_replace('&amp;','&',preg_replace('/(?<!^[http:]|[https:])[\/]{2,}/', '/', trim($_SERVER['REQUEST_URI']))));
		if ($REQUEST_URI != $this->request->server['REQUEST_URI']) {
			$this->response->redirect($config_url . ltrim($_SERVER['REQUEST_URI'],'/'),302);
		}
		
		$url = str_replace('&amp;', '&', $config_url . ltrim($this->request->server['REQUEST_URI'], '/'));
		$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route','_route_')), false));


		if (rawurldecode($url) != rawurldecode($seo)) {
//		var_dump(rawurldecode($url), rawurldecode($seo));
//		exit;
		
			$this->response->redirect($seo,301);
		}
	}

	private function strpos_offset($needle, $haystack, $occurrence) {
		// explode the haystack
		$arr = explode($needle, $haystack);
		// check the needle is not out of bounds
		switch($occurrence) {
			case $occurrence == 0:
				return false;
			case $occurrence > max(array_keys($arr)):
				return false;
			default:
				return strlen(implode($needle, array_slice($arr, 0, $occurrence)));
		}
	}

	private function getQueryString($exclude = array()) {
		if (!is_array($exclude)) {
			$exclude = array();
		}
		$need_get = array_diff_key($this->request->get, array_flip($exclude));

		foreach ($need_get as $key=>$value) {
			$need_get[$key] = urlencode(html_entity_decode($value, ENT_QUOTES, 'UTF-8'));
		}
		return html_entity_decode(urldecode(http_build_query($need_get)));
	}

	private function getQuery($keyword) {
			$sql = "SELECT * FROM " . DB_PREFIX . "seo_url WHERE keyword = '" . $this->db->escape($keyword) . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'";
			$result = $this->db->query($sql);
			if ($result->num_rows) {
				return	array(
					'keyword' => $keyword, 
					'query'   => array(
						'query'=>$result->row['query'],
						'language_id'=>$result->row['language_id']
					)
				);
			}
		return false;
	}

	private function initLanguage($lang_code, $language_id) {
		$this->session->data['language'] = $lang_code;
		$this->config->set('config_language_id', $language_id);
	
		$language = new Language($lang_code);
		$language->load($lang_code);
		$this->registry->set('language', $language);
	}

	private function getKeyword($query) {
		if ($this->use_lang_prefix) {
			$language_id = $this->config->get('module_sla_seo_pro_use_lang_prefix_main');
		} else {
			$language_id = $this->language_id[$this->session->data['language']];
		}
		
		
		if (isset($this->cache_data['queries'][$language_id][$query])) {
			return array('query' => $query, 'keyword' => $this->cache_data['queries'][$language_id][$query]);
		} else {
			$sql = "SELECT * FROM " . DB_PREFIX . "seo_url WHERE query = '" . $this->db->escape($query) . "'
			AND language_id = '" . (int)$language_id . "'
			AND store_id = '" . (int)$this->config->get('config_store_id') . "'";
			$result = $this->db->query($sql);
			if ($result->num_rows) {
				$res = array('query' => $query, 'keyword'=>$result->row['keyword']);
				$this->cache_data['queries'][$language_id][$query] = $result->row['keyword'];
				$this->cache_data['seopath'][$query] = $result->row['seopath'];
				return $res;
			}
		}
		return false;
	}

	private function checkGetParam() {
		$get_id = array(
			'product_id' => array(
				'type' => 'int',
				'check' => 0
			),
			'manufacturer_id' => array(
				'type' => 'int',
				'check' => 0
			),
			'information_id' =>  array(
				'type' => 'int',
				'check' => 0
			),
			'limit' => array(
				'type' => 'int',
				'check' => 0,
				'min' => 1,
				'max' => 100
				
			),
			'page' => array(
				'type' => 'int',
				'check' => 1
			),
			'path' =>  array(
				'type' => 'path',
				'check' => 0
			),
			
		);
		foreach ($this->request->get as $get_key => $value) {
			if (array_key_exists($get_key,$get_id)) {
				if ($get_id[$get_key]['type'] == 'int') {
					if (ctype_digit((string)$value)) {
						if ((int)$value > $get_id[$get_key]['check']) {
							$this->request->get[$get_key] = (int)$value;
							if (isset($get_id[$get_key]['min']) && $this->request->get[$get_key] < $get_id[$get_key]['min']) {
								unset($this->request->get[$get_key]);
							}
							if (isset($get_id[$get_key]['max']) && isset($this->request->get[$get_key]) && $this->request->get[$get_key] > $get_id[$get_key]['max']) {
								unset($this->request->get[$get_key]);
							}
						} else {
							unset($this->request->get[$get_key]);
						}
					} else {
						unset($this->request->get[$get_key]);
					}					
				} elseif ($get_id[$get_key]['type'] == 'path') {
					$pathes = explode('_',$value);
					$path = array();
					foreach ($pathes as $value) {
						if (ctype_digit((string)$value)) {
							if ((int)$value > $get_id[$get_key]['check']) {
								$path[] = (int)$value;
							} else {
								unset($this->request->get[$get_key]);
								break;
							}
						} else {
							unset($this->request->get[$get_key]);
							break;
						}
					}
					if (isset($this->request->get[$get_key])) $this->request->get[$get_key] = implode('_',$path);
				}
			}
		}
	}

}