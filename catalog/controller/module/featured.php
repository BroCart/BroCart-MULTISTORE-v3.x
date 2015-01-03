<?php
class ControllerModuleFeatured extends Controller {
	
	private function searchSubArray(Array $array, $key, $value) {   
					foreach ($array as $subarray){  
						if (isset($subarray[$key]) && $subarray[$key] == $value)
							return $subarray;       
					} 
				}
	
	protected function index($setting) {
		$this->language->load('module/featured'); 

      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->data['button_cart_already'] = $this->language->get('button_cart_already');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');
		
		$products_in_cart =  $this->cart->getProducts();
		
		$this->data['products'] = array();

		$products = explode(',', $this->config->get('featured_product'));		

		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		$products = array_slice($products, 0, (int)$setting['limit']);
						
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
				
				$product_lable = $this->model_catalog_product->getLabels($product_id);
				
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
				$product_in_cart = $this->searchSubArray($products_in_cart,'product_id',$product_info['product_id']);
				if (isset($product_in_cart['key'])) $key = $product_in_cart['key'];
						
				$this->data['products'][] = array(
					'key'		=> $key,
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $product_info['name'],
					'minimum'     => $product_info['minimum'] ? $product_info['minimum'] : 1 ,
					'label'     => $tumbler ? $lables_all : false ,
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/featured.tpl';
		} else {
			$this->template = 'default/template/module/featured.tpl';
		}

		$this->render();
	}
}
?>