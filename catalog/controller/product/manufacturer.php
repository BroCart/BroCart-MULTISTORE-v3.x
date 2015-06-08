<?php 
class ControllerProductManufacturer extends Controller {  

	private function searchSubArray(Array $array, $key, $value) {   
					foreach ($array as $subarray){  
						if (isset($subarray[$key]) && $subarray[$key] == $value)
							return $subarray;       
					} 
				}

	public function index() { 
		$this->language->load('product/manufacturer');
		
		$this->load->model('catalog/manufacturer');
		
		$this->load->model('tool/image');		
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_index'] = $this->language->get('text_index');
		$this->data['text_empty'] = $this->language->get('text_empty');
		
		$this->data['button_continue'] = $this->language->get('button_continue');
		
		$this->data['breadcrumbs'] = array();
		
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);
		
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_brand'),
			'href'      => $this->url->link('product/manufacturer'),
			'separator' => $this->language->get('text_separator')
		);
		
		$this->data['categories'] = array();
									
		$results = $this->model_catalog_manufacturer->getManufacturers();
	
		foreach ($results as $result) {
			if (is_numeric(utf8_substr($result['name'], 0, 1))) {
				$key = '0 - 9';
			} else {
				$key = utf8_substr(utf8_strtoupper($result['name']), 0, 1);
			}
			
			if (!isset($this->data['manufacturers'][$key])) {
				$this->data['categories'][$key]['name'] = $key;
			}
			
			$this->data['categories'][$key]['manufacturer'][] = array(
				'name' => $result['name'],
				'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height')),
				'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
			);
		}
		
		$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/manufacturer_list.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/manufacturer_list.tpl';
		} else {
			$this->template = 'default/template/product/manufacturer_list.tpl';
		}			
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
				
		$this->response->setOutput($this->render());										
  	}
	
	public function info() {
    	$this->language->load('product/manufacturer');
		
		$this->load->model('catalog/manufacturer');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image'); 
		
		if (isset($this->request->get['manufacturer_id'])) {
			$manufacturer_id = (int)$this->request->get['manufacturer_id'];
		} else {
			$manufacturer_id = 0;
		} 
										
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		} 

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		} 
  		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
				
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}

		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array( 
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
      		'separator' => false
   		);
   		
		$this->data['breadcrumbs'][] = array( 
       		'text'      => $this->language->get('text_brand'),
			'href'      => $this->url->link('product/manufacturer'),
      		'separator' => $this->language->get('text_separator')
   		);
		
		$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($manufacturer_id);
	
		if ($manufacturer_info) {
		
			if (isset($manufacturer_info['u_title']) && !empty($manufacturer_info['u_title'] ) ) {
				if ($page > 1) {
					$this->document->setTitle(trim($manufacturer_info['u_title']).'|'.$this->language->get('page_w').$page);
				} else {
					$this->document->setTitle(trim($manufacturer_info['u_title']));
				}
			} else {
				if ($page > 1) {
					$this->document->setTitle($manufacturer_info['name'].'|'. $this->language->get('page_w') .$page );
				} else {
					$this->document->setTitle($manufacturer_info['name']);
				}
			}
			
			
			$this->document->addLink($this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id']), 'canonical');
			
			$this->document->setKeywords($manufacturer_info['meta_keyword']);
			if ($page > 1) {
				$this->document->setDescription($manufacturer_info['meta_description'].'&nbsp;|&nbsp;'.$this->language->get('page_w').$page);
			} else {
				$this->document->setDescription($manufacturer_info['meta_description']);
			}
			
			$this->document->setOpengraph('og:title', $manufacturer_info['name']);
			$this->document->setOpengraph('og:type', 'website');
			$this->document->setOpengraph('og:url', $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'], 'SSL'));
			
			$this->load->model('tool/image');
			
			if ($manufacturer_info['image']) {
				$this->document->setOpengraph('og:image', $this->model_tool_image->resize($manufacturer_info['image'], 100,100));
			} 
			$this->document->setOpengraph('og:description', str_replace("\"", "&quot;",utf8_substr(trim(strip_tags(html_entity_decode($manufacturer_info['description'], ENT_QUOTES, 'UTF-8')), " \t\n\r"), 0, 200) . '...'));
			
			$this->data['description'] = html_entity_decode($manufacturer_info['description'], ENT_QUOTES, 'UTF-8');
			
			if ($manufacturer_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($manufacturer_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
			} else {
				$this->data['thumb'] = false;
			}
						
			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
			
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	
	
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
					
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
		   			
			$this->data['breadcrumbs'][] = array(
       			'text'      => $manufacturer_info['name'],
				'href'      => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url),
      			'separator' => $this->language->get('text_separator')
   			);
					
			if (isset($manufacturer_info['u_h1']) && !empty($manufacturer_info['u_h1'] ) ) { 
				$this->data['heading_title'] = $manufacturer_info['u_h1'];
			}
			else {
				$this->data['heading_title'] = $manufacturer_info['name'];
			}
			if (isset($manufacturer_info['u_h2']) && !empty($manufacturer_info['u_h2'] ) ) { 
				$this->data['useo_heading_title2'] = $manufacturer_info['u_h2'];
			}else{
				$this->data['useo_heading_title2'] = false;
			}
			
			$this->data['text_empty'] = $this->language->get('text_empty');
			$this->data['text_quantity'] = $this->language->get('text_quantity');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$this->data['text_display'] = $this->language->get('text_display');
			$this->data['text_list'] = $this->language->get('text_list');
			$this->data['text_grid'] = $this->language->get('text_grid');			
			$this->data['text_sort'] = $this->language->get('text_sort');
			$this->data['text_limit'] = $this->language->get('text_limit');
			$this->data['button_cart_already'] = $this->language->get('button_cart_already');
			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_continue'] = $this->language->get('button_continue');
			
			$this->data['compare'] = $this->url->link('product/compare');
			
			$products_in_cart =  $this->cart->getProducts();
			
			$this->data['products'] = array();
			
			$data = array(
				'filter_manufacturer_id' => $manufacturer_id, 
				'sort'                   => $sort,
				'order'                  => $order,
				'start'                  => ($page - 1) * $limit,
				'limit'                  => $limit
			);
								
			$results = $this->model_catalog_product->getProducts($data);
			
			$product_total = $this->model_catalog_product->getTotalProducts($data);
					
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
				}
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}	
				
				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}				
				
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
				
				$product_lable = $this->model_catalog_product->getLabels($result['product_id']);
				
				if ($product_lable) {
				
					$lables_all = array(); 
				
					foreach ($product_lable as $lables) {
	
						if((strtotime(date('Y-m-d')) >= strtotime($lables['date_begin'])) && (strtotime(date('Y-m-d')) <= strtotime($lables['date_end'])) || (($lables['date_begin'] == '0000-00-00') && ($lables['date_end'] == '0000-00-00'))) {
							$tumbler = true;
							
							$jeronimo = $this->model_catalog_product->getStickerText($lables['label_id']);
							
								foreach ($jeronimo as $stick) {
									$lables_all[] = array(
										'pos' 		=> $stick['stick_main'],
										'image'   	=> $this->model_tool_image->resize($stick['image'], 40, 40),
										'text'		=> $stick['stick_text']
									);
								}
								
						} else {
							$tumbler = false;
						}  
					}
				} else {
					$tumbler = false;
				}
				
				$key ='';
				$product_in_cart = $this->searchSubArray($products_in_cart,'product_id',$result['product_id']);
				if (isset($product_in_cart['key'])) $key = $product_in_cart['key'];
			
				$this->data['products'][] = array(
					'key'		=> $key,
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'label'     => $tumbler ? $lables_all : false ,
					'rating'      => $result['rating'],
					'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'        => $this->url->link('product/product', '&manufacturer_id=' . $result['manufacturer_id'] . '&product_id=' . $result['product_id'] . $url)
				);
			}
					
			$url = '';
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
						
			$this->data['sorts'] = array();
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.sort_order&order=ASC' . $url)
			);
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=pd.name&order=ASC' . $url)
			); 
	
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=pd.name&order=DESC' . $url)
			);
	
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.price&order=ASC' . $url)
			); 
	
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.price&order=DESC' . $url)
			); 
			
			if ($this->config->get('config_review_status')) {
				$this->data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=rating&order=DESC' . $url)
				); 
				
				$this->data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=rating&order=ASC' . $url)
				);
			}
			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.model&order=ASC' . $url)
			); 
	
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&sort=p.model&order=DESC' . $url)
			);
	
			$url = '';
					
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	
	
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->data['limits'] = array();
	
			$limits = array_unique(array($this->config->get('config_catalog_limit'), 25, 50, 75, 100));
			
			sort($limits);
	
			foreach($limits as $limits){
				$this->data['limits'][] = array(
					'text'  => $limits,
					'value' => $limits,
					'href'  => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url . '&limit=' . $limits)
				);
			}
			
			$url = '';
							
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	
	
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
					
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('product/manufacturer/info','manufacturer_id=' . $this->request->get['manufacturer_id'] .  $url . '&page={page}');
			
			$this->data['pagination'] = $pagination->render();
			
			if ($pagination->getNext()) {
				$this->document->addLink($pagination->getNext(), 'next');
			}
			if ($pagination->getPrev()) {
				$this->document->addLink($pagination->getPrev(), 'prev');
			}
			
			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;
			
			$this->data['continue'] = $this->url->link('common/home');
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/manufacturer_info.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/manufacturer_info.tpl';
			} else {
				$this->template = 'default/template/product/manufacturer_info.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
					
			$this->response->setOutput($this->render());
		} else {
			$url = '';
			
			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}
									
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
				
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/category', $url),
				'separator' => $this->language->get('text_separator')
			);
				
			$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
					
			$this->response->setOutput($this->render());
		}
  	}
}
?>