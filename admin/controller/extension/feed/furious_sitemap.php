<?php
class ControllerExtensionFeedFuriousSitemap extends Controller {
	private $error = array();
	private $cats = array();	
	private $cat_data = array();
	private $post_data = array();
	private $langs = array();
	private $conf_lang = null;
	private $syfix = '';
	private $path_on = 0;
	private $postfix = '';
	private $prefix = false;
	private $prefix_hide = false;
	
	public function __construct($registry) {
		$registry->set('murl', new Url(HTTP_CATALOG, HTTPS_CATALOG));
		parent::__construct($registry);
		if ($this->config->get('config_language')) {
			$this->conf_lang = $this->config->get('config_language');
		}
		$this->load->model('setting/setting');
		$this->post_data = $this->model_setting_setting->getSetting('feed_furious_sitemap');
		if ($this->config->get('config_seo_url_postfix')) {
			$this->syfix = trim($this->config->get('config_seo_url_postfix'));
		}
		if ($this->config->get('config_seo_url_include_path')) {
			$this->path_on = trim($this->config->get('config_seo_url_include_path'));
		}
		if ($this->config->get('config_seo_url_syfix')) {
			$this->postfix = trim($this->config->get('config_seo_url_syfix'));
		}
		if ($this->config->get('config_seo_url_prefix')) {
			$this->prefix = trim($this->config->get('config_seo_url_prefix'));
		}
		if ($this->config->get('config_seo_url_prefix_def')) {
			$this->prefix_hide = trim($this->config->get('config_seo_url_prefix_def'));
		}
		$this->load->model('extension/feed/furious_sitemap');
		$results  = $this->model_extension_feed_furious_sitemap->getCatsByParentId(0);
		foreach ($results as $row) {
			$category_data[$row['parent_id']][$row['category_id']] = $row;
		}
		$this->cats = $category_data;
		$this->rebuilder();
		unset($this->cats);
		$this->langs = $this->cache->get('catalog.seolang');
		if (!$this->langs) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "language WHERE status = '1' ORDER BY sort_order, name");
			foreach ($query->rows as $result) {
				$this->langs[$result['code']] = array(
					'language_id' => $result['language_id'],
					'code'        => $result['code'],
					'prefix'   	  => $result['prefix'],
					'name' 		  => $result['name']
				);
			}
			$this->cache->set('catalog.seolang', $this->langs);
		}		
	}
	
	public function index() {
		$this->load->language('extension/feed/furious_sitemap');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {			
			$post_data = $this->request->post;
			$this->model_setting_setting->editSetting('feed_furious_sitemap', $this->request->post);
			$mix = $this->letsGoBro($post_data);			
			$this->session->data['success'] = $this->language->get('text_success'). ' (' . $mix . ' sec.)';	
			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=feed', true));		
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=feed', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/feed/furious_sitemap', 'user_token=' . $this->session->data['user_token'], true)
		);
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['heading_title'] = $this->language->get('heading_title');
		$data['entry_home_status'] = $this->language->get('entry_home_status');
		$data['entry_home_priority'] = $this->language->get('entry_home_priority');
		$data['entry_home_frequency'] = $this->language->get('entry_home_frequency');
		$data['entry_category_status'] = $this->language->get('entry_category_status');
		$data['entry_category_priority'] = $this->language->get('entry_category_priority');
		$data['entry_category_frequency'] = $this->language->get('entry_category_frequency');
		$data['entry_manufacturer_status'] = $this->language->get('entry_manufacturer_status');
		$data['entry_manufacturer_priority'] = $this->language->get('entry_manufacturer_priority');
		$data['entry_manufacturer_frequency'] = $this->language->get('entry_manufacturer_frequency');
		$data['entry_product_status'] = $this->language->get('entry_product_status');
		$data['entry_product_priority'] = $this->language->get('entry_product_priority');
		$data['entry_product_frequency'] = $this->language->get('entry_product_frequency');
		$data['entry_information_status'] = $this->language->get('entry_information_status');
		$data['entry_information_priority'] = $this->language->get('entry_information_priority');
		$data['entry_information_frequency'] = $this->language->get('entry_information_frequency');
		$data['entry_furious_status'] = $this->language->get('entry_furious_status');
		$data['entry_data_feed'] = $this->language->get('entry_data_feed');
		$data['text_form'] = $this->language->get('text_form');
		$data['entry_syfix'] = $this->language->get('entry_syfix');
		$data['save'] = $this->url->link('extension/feed/furious_sitemap', 'user_token=' . $this->session->data['user_token'], true);
		$data['action'] = $this->url->link('extension/feed/furious_sitemap', 'user_token=' . $this->session->data['user_token'], true);
		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=feed', true);

		$data['feed_furious_sitemap_sitemap_url'] = HTTP_CATALOG . 'sitemap.xml';

		$vars = array(
			'feed_furious_sitemap_status',
			'feed_furious_sitemap_home_status',
			'feed_furious_sitemap_home_priority',
			'feed_furious_sitemap_home_frequency',
			'feed_furious_sitemap_category_status',
			'feed_furious_sitemap_category_priority',
			'feed_furious_sitemap_category_frequency',
			'feed_furious_sitemap_manufacturer_status',
			'feed_furious_sitemap_manufacturer_frequency',
			'feed_furious_sitemap_manufacturer_priority',
			'feed_furious_sitemap_product_status',
			'feed_furious_sitemap_product_frequency',
			'feed_furious_sitemap_product_priority',
			'feed_furious_sitemap_information_status',
			'feed_furious_sitemap_information_frequency',
			'feed_furious_sitemap_information_priority'
		);
		
		foreach($vars as $var){
			if (isset($this->request->post[$var])) {
				$data[$var] = $this->request->post[$var];
			} else {
				$data[$var] = $this->config->get($var);
			}
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/feed/furious_sitemap', $data));
	}
	
	public function letsGoBro($post_data = array()) {
		$timer_start = microtime(true);
		if (!$post_data) {
			$post_data = $this->post_data;
		}
			$blitz = $this->prepareSitemaps($post_data);
			$output = '<?xml version="1.0" encoding="UTF-8"?>';
			$output .= '<?xml-stylesheet type="text/xsl" href="' . HTTPS_CATALOG . 'sitemap/stylesheet.min.xsl"?>';
			$output .= '<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
			$output .= '<sitemap>';
			$output .= '	<loc>' . HTTPS_CATALOG . 'sitemap/index.xml</loc>';
			$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP') . '</lastmod>';
			$output .= '</sitemap>';
			if ($post_data['feed_furious_sitemap_category_status']) {
				$output .= '<sitemap>';		
				$output .= '	<loc>' . HTTPS_CATALOG . 'sitemap/category.xml</loc>';
				$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP') . '</lastmod>';
				$output .= '</sitemap>';
			}
			if ($post_data['feed_furious_sitemap_manufacturer_status']) {
				$output .= '<sitemap>';		
				$output .= '	<loc>' . HTTPS_CATALOG . 'sitemap/brand.xml</loc>';
				$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP') . '</lastmod>';
				$output .= '</sitemap>';
			}
			if ($post_data['feed_furious_sitemap_information_status']) {
				$output .= '<sitemap>';		
				$output .= '	<loc>' . HTTPS_CATALOG . 'sitemap/article.xml</loc>';
				$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP') . '</lastmod>';
				$output .= '</sitemap>';
			}
			if ($post_data['feed_furious_sitemap_product_status']) {
				$output .= '<sitemap>';		
				$output .= '	<loc>' . HTTPS_CATALOG . 'sitemap/product.xml</loc>';
				$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP') . '</lastmod>';
				$output .= '</sitemap>';
			}
			$output .= '</sitemapindex>';
			
			$file = '../sitemap.xml';
			$handle = fopen($file, 'w');
			flock($handle, LOCK_EX);
			fwrite($handle, $output);
			flock($handle, LOCK_UN);
			fclose($handle);
		$this->log->write('[INFO] Sitemap generated by (' . number_format(microtime(true) - ($timer_start + $blitz), 4).' sec.)');
		return number_format(microtime(true) - ($timer_start + $blitz), 4);	
	}
	
	private function prepareSitemaps($post_data = array()) {
		$timer_start = microtime(true);	
		if ($post_data) {
			$out_head = '<?xml version="1.0" encoding="UTF-8"?>'. "\n";
			$out_head .= '<?xml-stylesheet type="text/xsl" href="' . HTTPS_CATALOG . 'sitemap/stylesheet.min.xsl"?>'. "\n";
			$out_head .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'. "\n";
			$products = array();
			$output = $out_head;
			if ($this->prefix) {
				foreach ($this->langs as $curr_code => $lang_id) {				
				if ($this->prefix_hide && ($curr_code == $this->conf_lang)) {
					$prefix = '';
				} else {
					$prefix = $lang_id['prefix'].'/';
				}				
				$output .= '	<url>'. "\n";			
				$output .= '	<loc>' . HTTPS_CATALOG . $prefix . '</loc>'. "\n";			
				$output .= '	<changefreq>' . trim($post_data['feed_furious_sitemap_home_frequency']) . '</changefreq>'. "\n";
				$output .= '	<priority>' . trim($post_data['feed_furious_sitemap_home_priority']) . '</priority>'. "\n";
				$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP') . '</lastmod>'. "\n";
				$output .= '	</url>'. "\n";
				}
			} else {
				$output .= '	<url>'. "\n";			
				$output .= '	<loc>' . HTTPS_CATALOG . '</loc>'. "\n";			
				$output .= '	<changefreq>' . trim($post_data['feed_furious_sitemap_home_frequency']) . '</changefreq>'. "\n";
				$output .= '	<priority>' . trim($post_data['feed_furious_sitemap_home_priority']) . '</priority>'. "\n";
				$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP') . '</lastmod>'. "\n";
				$output .= '	</url>'. "\n";
			}
			$output .= '</urlset>'. "\n";
			$file = DIR_SITEMAP . 'index.xml';
			$handle = fopen($file, 'w');
			flock($handle, LOCK_EX);
			fwrite($handle, $output);
			flock($handle, LOCK_UN);
			fclose($handle);
			//Categories
			if ($post_data['feed_furious_sitemap_category_status']) {			
				$output = '';				
				$output .= $out_head;
				foreach ($this->langs as $curr_code => $lang_id) {
					if ($this->prefix) {
						if ($this->prefix_hide && ($curr_code == $this->conf_lang)) {
							$prefix = '';
						} else {
							$prefix = $lang_id['prefix'];
						}
					} else {
						$prefix = '';
					}
					foreach ($this->cat_data as $category) {
						if ($this->model_extension_feed_furious_sitemap->getTotalProByCat($category['path'], true)) {
						$output .= '<url>';
						$output .= '	<loc>' . $this->getUrl('path', $category['path'], $lang_id['language_id'], $prefix) . '</loc>';
						$output .= '	<changefreq>' . trim($post_data['feed_furious_sitemap_category_frequency']) . '</changefreq>';
						$output .= '	<priority>' . trim($post_data['feed_furious_sitemap_category_priority']) . '</priority>';
						$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP', strtotime($category['date_modified'])) . '</lastmod>';
						$output .= '</url>';
						}
					}					
				}
				$output.= '</urlset>';
				$file = DIR_SITEMAP . 'category.xml';
				$handle = fopen($file, 'w');
				flock($handle, LOCK_EX);
				fwrite($handle, $output);
				flock($handle, LOCK_UN);
				fclose($handle);			
			}
			//Brands
			if ($post_data['feed_furious_sitemap_manufacturer_status']) {
				$manufacturers = $this->model_extension_feed_furious_sitemap->getMan();
				$output = '';				
				$output .= $out_head;
				foreach ($this->langs as $curr_code => $lang_id) {
					if ($this->prefix) {
						if ($this->prefix_hide && ($curr_code == $this->conf_lang)) {
							$prefix = '';
						} else {
							$prefix = $lang_id['prefix'];
						}
					} else {
						$prefix = '';
					}
					foreach($manufacturers as $manufacturer) {
						$output .= '<url>';
						$output .= '	<loc>' . $this->getUrl('manufacturer_id', $manufacturer['manufacturer_id'], $lang_id['language_id'], $prefix) . '</loc>';
						$output .= '	<changefreq>' . trim($post_data['feed_furious_sitemap_manufacturer_frequency']) . '</changefreq>';
						$output .= '	<priority>' . trim($post_data['feed_furious_sitemap_manufacturer_priority']) . '</priority>';
						$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP') . '</lastmod>';
						$output .= '</url>';
					}
				}
				$output.= '</urlset>';
				$file = DIR_SITEMAP . 'brand.xml';
				$handle = fopen($file, 'w');
				flock($handle, LOCK_EX);
				fwrite($handle, $output);
				flock($handle, LOCK_UN);
				fclose($handle);			
			}
			if ($post_data['feed_furious_sitemap_information_status']) {
				$info = $this->model_extension_feed_furious_sitemap->getInformations();
				$output = '';				
				$output .= $out_head;
				foreach ($this->langs as $curr_code => $lang_id) {
					if ($this->prefix) {
						if ($this->prefix_hide && ($curr_code == $this->conf_lang)) {
							$prefix = '';
						} else {
							$prefix = $lang_id['prefix'];
						}
					} else {
						$prefix = '';
					}
					foreach($info as $information) {
						$output .= '<url>';
						$output .= '	<loc>' . $this->getUrl('information_id', $information['information_id'], $lang_id['language_id'], $prefix) . '</loc>';
						$output .= '	<changefreq>' . trim($post_data['feed_furious_sitemap_information_frequency']) . '</changefreq>';
						$output .= '	<priority>' . trim($post_data['feed_furious_sitemap_information_priority']) . '</priority>';
						$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP') . '</lastmod>';
						$output .= '</url>';
					}
				}
				$output .= '</urlset>';
				$file = DIR_SITEMAP . 'article.xml';
				$handle = fopen($file, 'w');
				flock($handle, LOCK_EX);
				fwrite($handle, $output);
				flock($handle, LOCK_UN);
				fclose($handle);
			}
			
			if ($post_data['feed_furious_sitemap_product_status']) {
				$total = $this->model_extension_feed_furious_sitemap->getTotal();	
				$this->load->model('tool/image');				
				if ($total <= 50000) {
					$output = '';
					$output .= '<?xml version="1.0" encoding="UTF-8"?>';
					$output .= '<?xml-stylesheet type="text/xsl" href="' . HTTPS_CATALOG . 'sitemap/sitemap.xsl"?>';	
					$output .= '<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
					foreach ($this->langs as $curr_code => $lang_id) {
					if ($this->prefix) {
						if ($this->prefix_hide && ($curr_code == $this->conf_lang)) {
							$prefix = '';
						} else {
							$prefix = $lang_id['prefix'];
						}
					} else {
						$prefix = '';
					}
					$products = $this->model_extension_feed_furious_sitemap->getProducts(0, 0, $lang_id['language_id']);
					foreach ($products as $product) {						
							$output .= '<url>'. "\n";
							$output .= '	<loc>' . $this->getUrl('product_id', $product['product_id'], $lang_id['language_id'], $prefix) . '</loc>'. "\n";					
							$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP', strtotime($product['date_modified'])) . '</lastmod>'. "\n";
							$output .= '	<changefreq>' . trim($post_data['feed_furious_sitemap_product_frequency']) . '</changefreq>'. "\n";
							$output .= '	<priority>' . trim($post_data['feed_furious_sitemap_product_priority']) . '</priority>'. "\n";
						if ($product['image']) {
							$output .= '	<image:image>'. "\n";
							$output .= '		<image:loc>' . $this->model_tool_image->resize($product['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height')) . '</image:loc>'. "\n";
							$output .= '		<image:title>' . trim(htmlspecialchars($product['name'], ENT_QUOTES, 'UTF-8')) . '</image:title>'. "\n";
							$output .= '		<image:caption>' . trim(htmlspecialchars($product['name'], ENT_QUOTES, 'UTF-8')) . '</image:caption>'. "\n";					
							$output .= '	</image:image>'. "\n";
						}
							$output .= '</url>'. "\n";				
					}
					}
					$output.= '</urlset>'. "\n";
					$file = DIR_SITEMAP . 'product.xml';
					$handle = fopen($file, 'w');
					flock($handle, LOCK_EX);
					fwrite($handle, $output);
					flock($handle, LOCK_UN);
					fclose($handle);
				} else {
					for($chast = 0; $chast <= 50000; $chast++) {
						$offset = 50000 * $chast;						
						$output = '';
						$output .= '<?xml version="1.0" encoding="UTF-8"?>';
						$output .= '<?xml-stylesheet type="text/xsl" href="' . HTTPS_CATALOG . 'sitemap/sitemap.xsl"?>';			
						$output .= '<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';	
						foreach ($this->langs as $curr_code => $lang_id) {
						if ($this->prefix) {
							if ($this->prefix_hide && ($curr_code == $this->conf_lang)) {
								$prefix = '';
							} else {
								$prefix = $lang_id['prefix'];
							}
						} else {
							$prefix = '';
						}
						$products = $this->model_extension_feed_furious_sitemap->getProducts($offset, 50000, $lang_id['language_id']);
						foreach ($products as $product) {				
								$output .= '<url>';
								$output .= '	<loc>' . $this->getUrl('product_id', $product['product_id'], $lang_id['language_id'], $prefix) . '</loc>';					
								$output .= '	<lastmod>' . date('Y-m-d\TH:i:sP', strtotime($product['date_modified'])) . '</lastmod>';
								$output .= '	<changefreq>' . trim($post_data['feed_furious_sitemap_product_frequency']) . '</changefreq>';
								$output .= '	<priority>' . trim($post_data['feed_furious_sitemap_product_priority']) . '</priority>';
							if ($product['image']) {
								$output .= '	<image:image>';
								$output .= '		<image:loc>' . $this->model_tool_image->resize($product['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height')) . '</image:loc>';
								$output .= '		<image:title>' . trim(htmlspecialchars($product['name'], ENT_QUOTES, 'UTF-8')) . '</image:title>';
								$output .= '		<image:caption>' . trim(htmlspecialchars($product['name'], ENT_QUOTES, 'UTF-8')) . '</image:caption>';			
								$output .= '	</image:image>';
							}
								$output .= '</url>';				
						}
						}
						$output .= '</urlset>';
						$file = DIR_SITEMAP . 'product'. $chast .'.xml';
						$handle = fopen($file, 'w');
						flock($handle, LOCK_EX);
						fwrite($handle, $output);
						flock($handle, LOCK_UN);
						fclose($handle);
					}
				}
			}
		}
		return number_format(microtime(true) - $timer_start, 4);		
	}
	
	private function rebuilder($parent_id = 0, $current_path = null) {		
		$new_path = '';	 
		if (array_key_exists($parent_id, $this->cats)) {
			$results = $this->cats[$parent_id];
			foreach ($results as $result) {
				if (!isset($current_path)) {
					$new_path = $result['category_id'];
				} else {
					$new_path = $current_path . '_' . $result['category_id'];
				}			
				if (array_key_exists($result['category_id'], $this->cats)) {
					$children = $this->rebuilder($result['category_id'], $new_path);
				}				
				$result['path'] = $new_path;				
				$this->cat_data[$result['category_id']] = $result;					
			}
    	}
	}

	private function getUrl($arg = '', $value = 0, $language_id = 0, $prefix = '') {
		$murl = '';
		if (!empty($prefix)) {
			$prefix = $prefix . '/';
		}		
		if (isset($arg)) {
			switch($arg) {
				case 'product_id':
					$pro_url = $this->model_extension_feed_furious_sitemap->getProPath($value, $this->postfix, $language_id, $this->path_on);
					if ($pro_url) {
						$murl .= HTTPS_CATALOG . $prefix . $pro_url . $this->syfix;
					} else {
						$murl .= $this->murl->link('product/product', $arg . '=' . $value, true, $prefix);
					}					
				break;
				case 'article_id':
				case 'manufacturer_id':
					$man_url = $this->model_extension_feed_furious_sitemap->getKyew($arg, $value, $language_id);
					if ($man_url) {
						$murl .= HTTPS_CATALOG . $prefix . $man_url . $this->postfix;
					} else {
						$murl .= $this->murl->link('product/manufacturer/info', $arg . '=' . $value, true, $prefix);
					}					
				break;
				case 'category_id':
					
						$cat_url = $this->model_extension_feed_furious_sitemap->getCatPath($value, $this->postfix, $language_id, $this->path_on);
						if ($cat_url) {
							$murl .= HTTPS_CATALOG . $prefix . $cat_url;
						} else {
							$murl .= $this->murl->link('product/category', 'path=' . $value, true, $prefix);
						}
					
				break;
				case 'information_id':
					$info_url = $this->model_extension_feed_furious_sitemap->getKyew($arg, $value, $language_id);
					if ($info_url) {
						$murl .= HTTPS_CATALOG . $prefix . $info_url . $this->syfix;
					} else {
						$murl .= $this->murl->link('information/information', 'information_id=' . $value, true, $prefix);
					}					
				break;
				case 'order_id':
				case 'path':
					$category = explode('_', $value);					
					$path_url = $this->model_extension_feed_furious_sitemap->getCatPath(end($category), $this->postfix, $language_id, $this->path_on);
						if ($path_url) {
							$murl .= HTTPS_CATALOG . $prefix . $path_url;
						} else {
							$murl .= $this->murl->link('product/category', 'path=' . $value, true, $prefix);
						}
					
				break;
				default:
				break;
			}
		}
		return strtolower($murl);
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/feed/furious_sitemap')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}	
}

?>
