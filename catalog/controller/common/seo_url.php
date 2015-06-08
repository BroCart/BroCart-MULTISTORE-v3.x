<?php
class ControllerCommonSeoUrl extends Controller {
	private $cache_data = null;
	private $cachesql = null;
	private $setvar = array();
	private $languages = array();
	private $config_language;

	public function __construct($registry) {
		parent::__construct($registry);
		$this->cache_data = $this->cache->get('seo_bro');
		if (!$this->cache_data) {
			$query = $this->db->query("SELECT LOWER(`keyword`) as 'keyword', `query` FROM " . DB_PREFIX . "url_alias");
			$this->cache_data = array();
			foreach ($query->rows as $row) {
				$this->cache_data['keywords'][$row['keyword']] = $row['query'];
				$this->cache_data['queries'][$row['query']] = $row['keyword'];
			}
			$this->cache->set('seo_bro', $this->cache_data);
		}
		$query = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_language'");
		$this->config_language = $query->row['value'];

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "language WHERE status = '1'");

		foreach ($query->rows as $result) {
			$this->languages[$result['code']] = $result;
		}
	}
	
	private function queryCacher($sql) {
		if ($this->config->get('config_seo_query')) {
				if (!$this->cachesql) {
					require_once(DIR_SYSTEM . 'config/cachesql.php');
					$this->cachesql = new CACHEsql(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
				}
			return $this->cachesql->seoquery($sql);
		} else {
			return $this->db->query($sql);
		}
	}

	public function index() {
        if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_page')))){
			$this->setvar['page'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_page')));
		}else{
			$this->setvar['page']='page-';
		}
  		if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_show')))){
			$this->setvar['show'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_show')));
		}else{
			$this->setvar['show']='show-';
		}
  		if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_default')))){
			$this->setvar['default'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_default')));
		}else{
			$this->setvar['default']='default';
		}
  		if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_priceasc')))){
			$this->setvar['price_asc'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_priceasc')));
		}else{
			$this->setvar['price_asc']='price-asc';
		}
  		if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_pricedesc')))){
			$this->setvar['price_desc'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_pricedesc')));
		}else{
			$this->setvar['price_desc']='price-desc';
		}
  		if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_nameasc')))){
			$this->setvar['name_asc'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_nameasc')));
		}else{
			$this->setvar['name_asc']='name-asc';
		}
  		if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_namedesc')))){
			$this->setvar['name_desc'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_namedesc')));
		}else{
			$this->setvar['name_desc']='name-desc';
		}
  		if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_modelasc')))){
			$this->setvar['model_asc'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_modelasc')));
		}else{
			$this->setvar['model_asc']='model-asc';
		}
  		if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_modeldesc')))){
			$this->setvar['model_desc'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_modeldesc')));
		}else{
			$this->setvar['model_desc']='model-desc';
		}
  		if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_ratingasc')))){
			$this->setvar['rating_asc'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_ratingasc')));
		}else{
			$this->setvar['rating_asc']='rating-asc';
		}
  		if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_ratingdesc')))){
			$this->setvar['rating_desc'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_ratingdesc')));
		}else{
			$this->setvar['rating_desc']='rating-desc';
		}
       	if(preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_special')))){
			$this->setvar['special'] = preg_replace('/\s+/','', utf8_strtolower($this->config->get('config_seo_special')));
		}else{
			$this->setvar['special']='specials';
		}

		//code_prefix
		$code = $this->config_language;
		
		if(isset($this->request->get['route'])) {
			$routes=explode('/',$this->request->get['route']);	
		}

		if(isset($this->request->get['_route_'])) {

			$route_ = $this->request->get['_route_'];

			$tokens = explode('/', $this->request->get['_route_']);
//		if ($this->config->get('config_seo_url')) { 	
			if(array_key_exists($tokens[0], $this->languages)) {
				$code = $tokens[0];
				$this->request->get['_route_'] = substr($this->request->get['_route_'], strlen($code) + 1);
			}
//		}
			if(trim($this->request->get['_route_']) == '' || trim($this->request->get['_route_']) == 'index.php') {
				unset($this->request->get['_route_']);
			}
		}

		if ($code == $this->config_language && 
					isset($this->request->cookie['language']) &&
						$this->request->cookie['language'] != $code &&
							isset($this->request->server['HTTP_X_REQUESTED_WITH']) && 
								strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
				$code = $this->request->cookie['language'];
		}
		
		if (isset($this->request->cookie['language']) &&
					$this->request->cookie['language'] != $code &&
						isset($routes) &&
							trim($routes[0]=='module')) {
			$code = $this->request->cookie['language'];
		}

		if(!isset($this->session->data['language']) || $this->session->data['language'] != $code) {
			$this->session->data['language'] = $code;
		}

	
        $xhttprequested = isset($this->request->server['HTTP_X_REQUESTED_WITH']) && $this->request->server['HTTP_X_REQUESTED_WITH'] == 'xmlhttprequest';

        $captcha = isset($this->request->get['route']) && $this->request->get['route']=='product/product/captcha';

        if(!$xhttprequested && !$captcha) {
            setcookie('language', $code, time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
        }


		$this->config->set('config_language_id', $this->languages[$code]['language_id']);
		$this->config->set('config_language', $this->languages[$code]['code']);

		$language = new Language($this->languages[$code]['directory']);
		$language->load($this->languages[$code]['filename']);
		$this->registry->set('language', $language);
		
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		} else {
			return;
		}

		// Decode URL
		if (!isset($this->request->get['_route_'])) {
			$this->validate();

		} else {
			$route = $this->request->get['_route_'];
			unset($this->request->get['_route_']);
			$parts = explode('/', trim(utf8_strtolower($route), '/'));
			
			list($last_part) = explode('.', array_pop($parts));
			array_push($parts, $last_part);
			$rows = array();

			foreach ($parts as $keyword) {

				if (isset($this->cache_data['keywords'][$keyword])) {
					$rows[] = array('keyword' => $keyword, 'query' => $this->cache_data['keywords'][$keyword]);
				}
                if (strncmp($keyword,$this->setvar['page'],strlen($this->setvar['page']))==0)  { 
					   $rows[] = array('keyword' => 'page', 'query' => '');
				}
                if (strncmp($keyword,$this->setvar['show'],strlen($this->setvar['show']))==0) { 
					  $rows[] = array('keyword' => 'limit', 'query' => '');
				}
                if (strncmp($keyword,$this->setvar['name_asc'],strlen($this->setvar['name_asc']))==0) { 
 					  $rows[] = array('keyword' => $this->setvar['name_asc'], 'query' => '');
				}
                if (strncmp($keyword,$this->setvar['name_desc'],strlen($this->setvar['name_desc']))==0) { 
 					  $rows[] = array('keyword' => $this->setvar['name_desc'], 'query' => '');
				}
			    if (strncmp($keyword,$this->setvar['default'],strlen($this->setvar['default']))==0) { 
 					  $rows[] = array('keyword' => $this->setvar['default'], 'query' => '');
				}
				if (strncmp($keyword,$this->setvar['model_desc'],strlen($this->setvar['model_desc']))==0) { 
 					  $rows[] = array('keyword' => $this->setvar['model_desc'], 'query' => '');
				}
				if (strncmp($keyword,$this->setvar['model_asc'],strlen($this->setvar['model_asc']))==0) { 
 					  $rows[] = array('keyword' => $this->setvar['model_asc'], 'query' => '');
				}
				if (strncmp($keyword,$this->setvar['rating_desc'],strlen($this->setvar['rating_desc']))==0) { 
 					  $rows[] = array('keyword' => $this->setvar['rating_desc'], 'query' => '');
				}
				if (strncmp($keyword,$this->setvar['rating_asc'],strlen($this->setvar['rating_asc']))==0) { 
 					  $rows[] = array('keyword' => $this->setvar['rating_asc'], 'query' => '');
				}
				if (strncmp($keyword,$this->setvar['price_desc'],strlen($this->setvar['price_desc']))==0) { 
 					  $rows[] = array('keyword' => $this->setvar['price_desc'], 'query' => '');
				}
				if (strncmp($keyword,$this->setvar['price_asc'],strlen($this->setvar['price_asc']))==0) { 
 					  $rows[] = array('keyword' => $this->setvar['price_asc'], 'query' => '');
				}

			}
			
			if($parts[0] =='search') {
				$this->request->get['route'] = 'product/search';
				if(isset($parts[1])) {
					$rows[] = array('keyword' => $parts[1], 'query' => '');
					$this->request->get['search'] = $parts[1];
					$this->request->get['filter_description'] = TRUE; 
				} 	
			} elseif($parts[0] =='tag') {
				$this->request->get['route'] = 'product/search';
				if(isset($parts[1])) {
					$rows[] = array('keyword' => $parts[1], 'query' => '');
					$this->request->get['tag'] = $parts[1];
				}			
			}
			
			if (count($rows) == sizeof($parts)) {
				$queries = array();
				foreach ($rows as $row) {
					$queries[utf8_strtolower($row['keyword'])] = $row['query'];
			}

			reset($parts);

			foreach ($parts as $part) {

                if (strncmp($part,$this->setvar['page'],strlen($this->setvar['page']))==0) { 
					$pageVal = explode($this->setvar['page'] , $part);
				 		if(isset($pageVal[1]) && !empty($pageVal[1]) && is_numeric($pageVal[1])){
							$this->request->get['page'] = $pageVal[1];
						}
                }elseif (strncmp($part,$this->setvar['show'],strlen($this->setvar['show']))==0) { 
					$limitVal = explode($this->setvar['show'] , $part);
				 		if(isset($limitVal[1]) && !empty($limitVal[1]) && is_numeric($limitVal[1])){
							$this->request->get['limit'] = $limitVal[1];
						}

                }elseif (strncmp($part,$this->setvar['name_asc'],strlen($this->setvar['name_asc']))==0) { 
					   $this->request->get['sort'] = 'pd.name';
					   $this->request->get['order'] = 'ASC';

                }elseif (strncmp($part,$this->setvar['name_desc'],strlen($this->setvar['name_desc']))==0) { 
					   $this->request->get['sort'] = 'pd.name';
					   $this->request->get['order'] = 'DESC';

			 	}elseif (strncmp($part,$this->setvar['default'],strlen($this->setvar['default']))==0) { 
					   $this->request->get['sort'] = 'p.sort_order';
					   $this->request->get['order'] = 'ASC';

				}elseif (strncmp($part,$this->setvar['model_desc'],strlen($this->setvar['model_desc']))==0) { 
					   $this->request->get['sort'] = 'p.model';
					   $this->request->get['order'] = 'DESC';

				}elseif (strncmp($part,$this->setvar['model_asc'],strlen($this->setvar['model_asc']))==0) { 
					   $this->request->get['sort'] = 'p.model';
					   $this->request->get['order'] = 'ASC';

				}elseif (strncmp($part,$this->setvar['rating_asc'],strlen($this->setvar['rating_asc']))==0) { 
					   $this->request->get['sort'] = 'rating';
					   $this->request->get['order'] = 'ASC';

				}elseif (strncmp($part,$this->setvar['rating_desc'],strlen($this->setvar['rating_desc']))==0) { 
					   $this->request->get['sort'] = 'rating';
					   $this->request->get['order'] = 'DESC';

				}elseif (strncmp($part,$this->setvar['price_asc'],strlen($this->setvar['price_asc']))==0) { 
                        if (in_array($this->setvar['special'],explode('/', $route))){
                            $this->request->get['sort'] = 'ps.price';
                        }else{
							$this->request->get['sort'] = 'p.price';
						}
					$this->request->get['order'] = 'ASC';

				}elseif (strncmp($part,$this->setvar['price_desc'],strlen($this->setvar['price_desc']))==0) { 
                        if (in_array($this->setvar['special'],explode('/', $route))){
                            $this->request->get['sort'] = 'ps.price';
                        }else{
							$this->request->get['sort'] = 'p.price';
						}
					$this->request->get['order'] = 'DESC';
                }else{
     				$url = explode('=', $queries[$part], 2);
					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					} elseif ($url[0] == 'gallery_id') {
						if (!isset($this->request->get['album'])) {
							$this->request->get['album'] = $url[1];
						} else {
							$this->request->get['album'] .= '_' . $url[1];
						}
					} elseif (count($url) > 1) {
						$this->request->get[$url[0]] = $url[1];
					}
				
				}
			}		
			
          	} else {
				$this->request->get['route'] = 'error/not_found';
			}
	
			if (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
				if (!isset($this->request->get['path'])) {
					$path = $this->getPathByProduct($this->request->get['product_id']);
					if ($path) $this->request->get['path'] = $path;
				}
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/info';
			} elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			} elseif (isset($this->request->get['album'])) {
				$this->request->get['route'] = 'information/gallery';
			} elseif (isset($this->request->get['search'])) {
				$this->request->get['route'] = 'product/search'; 
			 } elseif (isset($this->request->get['tag'])) {
				$this->request->get['route'] = 'product/search';
			} else {
				if (isset($queries[$parts[0]])) {
					$this->request->get['route'] = $queries[$parts[0]];
				}
			}			
			$this->validate();
			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			}
		}
	}

	public function rewrite($link, $code = '') {
		
		if (!$this->config->get('config_seo_url')) { 
			return $link; 
		}
		
		if(!$code) {
			$code = $this->session->data['language'];
		}
		
		$seo_url = '';
		$p_url='';
        $l_url = ''; 
        $o_url = ''; 
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
					if ($this->config->get('config_seo_url_include_path')) {
						$data['path'] = $this->getPathByProduct($tmp['product_id']);
						if (!$data['path']) return $link;
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
					$data['path'] = $this->getPathByCategory($category);
					if (!$data['path']) return $link;
				}
				break;
			case 'information/gallery':
				if (isset($data['album'])) {
					$album = explode('_', $data['album']);
					$album = end($album);
					$data['album'] = $this->getPathByAlbum($album);
					if (!$data['album']) return $link;
				}
				break;
			case 'product/product/review':			
			case 'product/search':
				if (isset($data['search'])) {
 
				} 
				break;
			case 'information/information/info':
				return $link;
				break;
			default:
				break;
		}

		if ($component['scheme'] == 'https') {
			$link = $this->config->get('config_ssl');
		} else {
			$link = $this->config->get('config_url');
		}

		if ($code != $this->config_language){
			$link .= $code . '/index.php?route=' . $route;
		} else{
			$link .= 'index.php?route=' . $route;
		}

		if (count($data)) {
			$link .= '&amp;' . urldecode(http_build_query($data, '', '&amp;'));
          		$link = str_replace("{page}", "1", $link);

		}

		$queries = array();
		foreach ($data as $key => $value) {
			switch ($key) {
				case 'product_id':
				case 'gallery_id':
				case 'manufacturer_id':				
				case 'category_id':
				case 'information_id':
					$queries[] = $key . '=' . $value;
					unset($data[$key]);
					$postfix = 1;
					break;
				case 'album':
					$albums = explode('_', $value);
					foreach ($albums as $album) {
					//$album = end($albums);
						$queries[] = 'gallery_id=' . $album;
					}
					unset($data[$key]);
					break;
				case 'tag':
					$queries[] = 'tag=' . $value;
					unset($data[$key]);
					break; 				
				case 'search':
					$queries[] = 'search=' . $value;
					unset($data[$key]);
					break;
				case 'path':
					$categories = explode('_', $value);
					foreach ($categories as $category) {
						$queries[] = 'category_id=' . $category;
					}
					unset($data[$key]);
					break;

				default:
					break;
			}
		}

		if(empty($queries)) {
			$queries[] = $route;
		}
				
		$rows = array();
		foreach($queries as $query) {
			if(isset($this->cache_data['queries'][$query])) {
				$rows[] = array('query' => $query, 'keyword' => $this->cache_data['queries'][$query]);
			} else {
				$query_s = explode('=', $query);

				if ($query_s[0] == 'search') {
					$rows[] = array('query' => $query_s[0], 'keyword' => $query_s[1]);
				} elseif ($query_s[0] == 'tag') {
					$rows[] = array('query' => $query_s[0], 'keyword' => $query_s[1]);
				}
			}
		}

		if(count($rows) == count($queries)) {
			$aliases = array();
			foreach($rows as $row) {
				$aliases[$row['query']] = $row['keyword'];
			}
			foreach($queries as $query) {
				$query_s = explode('=', $query);
				if ($query_s[0] == 'search') {
					$seo_url .= '/search/' . rawurlencode($aliases[$query_s[0]]);
				} elseif ($query_s[0] == 'tag') {
					$seo_url .= '/tag/' . rawurlencode($aliases[$query_s[0]]);
				}
				else {
					$seo_url .= '/' . rawurlencode($aliases[$query]);
				}
			}
		}

		if ($seo_url == '') return $link;

		if($code != $this->config_language) {
			$seo_url = $code . '/' . trim($seo_url, '/');
		} else {
			$seo_url = trim($seo_url, '/');
		}

		if ($component['scheme'] == 'https') {
			$seo_url = $this->config->get('config_ssl') . $seo_url;
		} else {
			$seo_url = $this->config->get('config_url') . $seo_url;
		}
		
		if (($route == 'product/product' || $route == 'information/information') && (isset($postfix))) {
			//$seo_url .= trim($this->config->get('config_seo_url_postfix'));
			$seo_url .= '.html';
		} else {
			$seo_url .= '';
		}  

		if(substr($seo_url, -2) == '//') {
			$seo_url = substr($seo_url, 0, -1);
		}

		if (count($data)) {
  		  foreach ($data as $key => $value) {
                if ($key == 'sort') {
                    if ($value === 'pd.name'){  
                        $o_url .= 'name' ; 
                    } elseif ($value === 'p.price'){
                        $o_url .= 'price'; 
                    } elseif ($value === 'ps.price'){
                        $o_url .= 'price'; 
                    } elseif ($value === 'rating'){
                        $o_url .= 'rating'; 
                    } elseif ($value === 'p.model'){
                        $o_url .= 'model'; 
                    } elseif ($value === 'p.sort_order'){
                        $o_url .= 'default' ;
                    }
					unset($data[$key]);

				} elseif ($key == 'order') {
                    if ($value === 'ASC'){  
                        $o_url .= '-asc'; 
                    } elseif ($value == 'DESC'){
                        $o_url .= '-desc'; 
                    }
                    unset($data[$key]);
                                          
                    if ($o_url === 'default-asc'){
                        $o_url = '/' . $this->setvar['default'];
                    }elseif ($o_url === 'price-asc'){
                        $o_url =  '/' . $this->setvar['price_asc'];
                    }elseif ($o_url === 'price-desc'){
                        $o_url =  '/' . $this->setvar['price_desc'];
                    }elseif ($o_url === 'name-asc'){
                        $o_url =  '/' . $this->setvar['name_asc'];
                    }elseif ($o_url === 'name-desc'){
                        $o_url =  '/' . $this->setvar['name_desc'];
                    }elseif ($o_url === 'rating-asc'){
                        $o_url =  '/' . $this->setvar['rating_asc'];
                    }elseif ($o_url === 'rating-desc'){
                        $o_url =  '/' . $this->setvar['rating_desc'];
                    }elseif ($o_url === 'model-asc'){
                        $o_url =  '/' . $this->setvar['model_asc'];
                    }elseif ($o_url === 'model-desc'){
                        $o_url =  '/' . $this->setvar['model_desc'];
                    }

                } elseif ($key === 'limit') {
				    $l_url .=  '/' . $this->setvar['show'] . $value ;    
                         unset($data[$key]);
		        } elseif ($key === 'page') {
 				    $p_url = '/'. $this->setvar['page'] . $value;    
                         unset($data[$key]);
				} elseif ($key === 'remove') {
					$seo_url .= '/?remove=' . $value;
					unset($data[$key]);
				}
			}
		    $seo_url .=  $o_url . $l_url .  $p_url;
		}
		
	    return $seo_url;
	}       

	private function getPathByProduct($product_id) {
		$product_id = (int)$product_id;
		if ($product_id < 1) return false;

		static $path = null;
		if (!is_array($path)) {
			$path = $this->cache->get('product.seopath');
			if (!is_array($path)) $path = array();
		}

		if (!isset($path[$product_id])) {
			$query = $this->queryCacher("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . $product_id . "' ORDER BY main_category DESC LIMIT 1");

			$path[$product_id] = $this->getPathByCategory($query->num_rows ? (int)$query->row['category_id'] : 0);

			$this->cache->set('product.seopath', $path);
		}

		return $path[$product_id];
	}

	private function getPathByCategory($category_id) {
		$category_id = (int)$category_id;
		if ($category_id < 1) return false;

		static $path = null;
		if (!is_array($path)) {
			$path = $this->cache->get('category.seopath');
			if (!is_array($path)) $path = array();
		}

		if (!isset($path[$category_id])) {
			$max_level = 10;

			$sql = "SELECT CONCAT_WS('_'";
			for ($i = $max_level-1; $i >= 0; --$i) {
				$sql .= ",t$i.category_id";
			}
			$sql .= ") AS path FROM " . DB_PREFIX . "category t0";
			for ($i = 1; $i < $max_level; ++$i) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "category t$i ON (t$i.category_id = t" . ($i-1) . ".parent_id)";
			}
			$sql .= " WHERE t0.category_id = '" . $category_id . "'";

			$query = $this->queryCacher($sql);

			$path[$category_id] = $query->num_rows ? $query->row['path'] : false;

			$this->cache->set('category.seopath', $path);
		}

		return $path[$category_id];
	}
	
	private function getPathByAlbum($album_id) {
		$album_id = (int)$album_id;
		if ($album_id < 1) return false;

		static $album = null;
		if (!is_array($album)) {
			$album = $this->cache->get('gallery.seopath');
			if (!is_array($album)) $album = array();
		}

		if (!isset($album[$album_id])) {
			$max_level = 10;

			$sql = "SELECT CONCAT_WS('_'";
			for ($i = $max_level-1; $i >= 0; --$i) {
				$sql .= ",t$i.gallery_id";
			}
			$sql .= ") AS path FROM " . DB_PREFIX . "gallery t0";
			for ($i = 1; $i < $max_level; ++$i) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "gallery t$i ON (t$i.gallery_id = t" . ($i-1) . ".album_id)";
			}
			$sql .= " WHERE t0.gallery_id = '" . $album_id . "'";

			$query = $this->queryCacher($sql);

			$album[$album_id] = $query->num_rows ? $query->row['path'] : false;

			$this->cache->set('gallery.seopath', $album);
		}

		return $album[$album_id];
	}

	private function validate() {
		if (isset($this->request->get['route']) && $this->request->get['route'] == 'error/not_found') {
			return;
		}
		if (ltrim($this->request->server['REQUEST_URI'], '/') =='sitemap.xml') {
			$this->request->get['route'] = 'feed/google_sitemap';
			return;
		}

		if(empty($this->request->get['route'])) {
			$this->request->get['route'] = 'common/home';
		}

		if (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
			return;
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$config_ssl = substr($this->config->get('config_ssl'), 0, $this->strpos_offset('/', $this->config->get('config_ssl'), 3) + 1);
			$url = str_replace('&amp;', '&', $config_ssl . ltrim($this->request->server['REQUEST_URI'], '/'));
			$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route')), 'SSL'));
		} else {
			$config_url = substr($this->config->get('config_url'), 0, $this->strpos_offset('/', $this->config->get('config_url'), 3) + 1);
			$url = str_replace('&amp;', '&', $config_url . ltrim($this->request->server['REQUEST_URI'], '/'));
			$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route')), 'NONSSL'));
		}

		if (rawurldecode($url) != rawurldecode($seo)) {
			header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');

			$this->response->redirect($seo);
		}
	}

	private function strpos_offset($needle, $haystack, $occurrence) {
		
		$arr = explode($needle, $haystack);
		
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

		return urldecode(http_build_query(array_diff_key($this->request->get, array_flip($exclude))));
		}
	}
?>