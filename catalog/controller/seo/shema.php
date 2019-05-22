<?php
class ControllerSeoShema extends Controller {
	
	private static $status = false;
	protected static $settings = array();
	protected static $configs = array();
	
	use microData {
        microData::__construct as private __microLoader;
    }
	
	public function __construct($registry) {
		$this->__microLoader();
		parent::__construct($registry);
		if ($this->config->get('microdata_microstatus')) {
			self::$status = $this->config->get('microdata_microstatus');
			self::$settings = $this->getSettings('microdata');
			self::$configs = $this->getSettings('config');
		}	
	}
		
	public function index() {
		if (self::$status) {
			$data['microdata'] = array();
			
			if (isset($this->request->get['route'])) {
				$route = (string)$this->request->get['route'];
			} else {
				$route = 'home';
			}
			
			if ($route == 'product/product' && isset($this->request->get['product_id'])) {
				$pro_id = (int)$this->request->get['product_id'];
				$pro_info = $this->getProduct($pro_id, $this->config->get('config_language_id'));
				$data['microdata'] = array(
					'href'				=> $this->url->link('product/product', 'product_id=' . $pro_id),
					'category'			=> $pro_info['category'],
					'image'				=> HTTP_SERVER . 'image/' . $pro_info['image'],
					'manufacturer'		=> $pro_info['manufacturer'],
					'brand'				=> $pro_info['manufacturer'],
					'model'				=> $pro_info['model'],
					'sku'				=> ($pro_info['sku'] ? $pro_info['sku'] : $pro_info['model']),
					'ratingval'			=> $pro_info['rating'],
					'reviews'			=> $pro_info['reviews'],
					'totalreviews'		=> $this->getBestReviewsByProId($pro_id),
					'description'		=> $pro_info['description'],
					'name'				=> $pro_info['name'],
					'stock'				=> $pro_info['quantity'] ? 'InStock' : 'OutOfStock',
					'price'				=> round($pro_info['price'], 2),
					'pricevaliduntil'	=> date('Y-m-d', strtotime(date('Y-m-d', strtotime($pro_info['date_modified'])) . ' + 1 year')), 
					'pricecurrency'		=> $this->config->get('config_currency')
					
				);
			}
			
			return $this->load->view('seo/products', $data);
		} else {
			return;
		}		
	}
	
	public function getOrganization() {
		if (self::$status) {
			$data = array();
			$microdata = self::$settings;
			$monday = explode("-", $microdata['microdata_monday']);
			$tuesday = explode("-", $microdata['microdata_tuesday']);
			$wednesday = explode("-", $microdata['microdata_wednesday']);
			$thursday = explode("-", $microdata['microdata_thursday']);
			$friday = explode("-", $microdata['microdata_friday']);
			$saturday = explode("-", $microdata['microdata_saturday']);
			$sunday = explode("-", $microdata['microdata_sunday']);
			$data = array(
				'name' => $this->config->get('config_name'),
				'href' 		=> $this->url->link('common/home'),
				'search' => $this->url->link('product/search'),
				'image' => HTTPS_SERVER . 'image/' . $this->config->get('config_image'),
				'telephone' => $this->config->get('config_telephone'),
				'email' => $this->config->get('config_email'),
				'pricerange' => $microdata['microdata_price_range'].$this->config->get('config_currency'),
				'address_locality' => $microdata['microdata_address_locality'],
				'postal_code' => $microdata['microdata_postal_code'],
				'street_address' => $microdata['microdata_street_address'],
				'latitude' => $microdata['microdata_latitude'],
				'longitude' => $microdata['microdata_longitude'],			
				'monday_o' => trim($monday[0]),
				'monday_c' => trim($monday[1]),			
				'tuesday_o' => trim($tuesday[0]),
				'tuesday_c' => trim($tuesday[1]),			
				'wednesday_o' => trim($wednesday[0]),
				'wednesday_c' => trim($wednesday[1]),			
				'thursday_o' => trim($thursday[0]),
				'thursday_c' => trim($thursday[1]),			
				'friday_o' => trim($friday[0]),
				'friday_c' => trim($friday[1]),			
				'saturday_o' => trim($saturday[0]),
				'saturday_c' => trim($saturday[1]),			
				'sunday_o' => trim($sunday[0]),
				'sunday_c' => trim($sunday[1])			
			);
			
			return $this->load->view('seo/organization', $data);
		} else {
			return;
		}
	}
	
	public function getBreadcrumbs() {
		if (self::$status) {
			$language_id = $this->config->get('config_language_id');
			$data['breads'] = array();
			if (isset($this->request->get['route'])) {
				$route = (string)$this->request->get['route'];
			} else {
				$route = 'common/home';
			}
			if ($route == 'common/home') return;
			$data['breads'][] = array(
				'text' => $this->language->get('text_microhome'),
				'href' => $this->url->link('common/home')
			);
			if ($route == 'product/product' && isset($this->request->get['product_id'])) {
				$pro_id = (int)$this->request->get['product_id'];
				$cats = explode('_', (string)$this->getProPath($pro_id));
				foreach ($cats as $cat_id) {
					$data['breads'][] = array(
						'text' => $this->getCatName($cat_id, $language_id),
						'href' => $this->url->link('product/category', 'path=' . $cat_id)
					);
				}
				$data['breads'][] = array(
					'text' => $this->getProName($pro_id, $language_id),
					'href' => $this->url->link('product/product', 'product_id=' . $pro_id)
				);
			}
			if ($route == 'product/category' && isset($this->request->get['path'])) {					
				$paths = explode('_', (string)$this->request->get['path']);
				$category_id = (int)array_pop($paths);			
				$categies = $this->getCatPath($category_id);
				$paths_new = explode('_', (string)$categies);
				foreach ($paths_new as $category_id) {				
					$data['breads'][] = array(
						'text' => $this->getCatName($category_id, $language_id),
						'href' => $this->url->link('product/category', 'path=' . (int)$category_id)
					);				
				}
			}
			if ($route == 'information/information' && isset($this->request->get['information_id'])) {
				$info_id = (int)$this->request->get['information_id'];
				$data['breads'][] = array(
					'text' => $this->getInfoName($info_id, $language_id),
					'href' => $this->url->link('information/information', 'information_id=' . $info_id)
				);
			}
			return $this->load->view('seo/breadcrumbs', $data);
		} else {
			return;
		}
	}	
}
