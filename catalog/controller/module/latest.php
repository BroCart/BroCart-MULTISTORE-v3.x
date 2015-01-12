<?php
class ControllerModuleLatest extends Controller {

	private function searchSubArray(Array $array, $key, $value) {   
			foreach ($array as $subarray){  
						if (isset($subarray[$key]) && $subarray[$key] == $value)
							return $subarray;       
			} 
	}

	protected function index($setting) {
		$this->language->load('module/latest');	
		
      	$this->data['heading_title'] = $this->language->get('heading_name');
	
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->data['button_cart_already'] = $this->language->get('button_cart_already');
				
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		
		$products_in_cart =  $this->cart->getProducts();
		
		$this->data['products'] = array();
		
		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProducts($data);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
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
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
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
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'minimum'     => $result['minimum'] ? $result['minimum'] : 1 ,
				'label'     => $tumbler ? $lables_all : false ,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/latest.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/latest.tpl';
		} else {
			$this->template = 'default/template/module/latest.tpl';
		}

		$this->render();
	}
}
?>