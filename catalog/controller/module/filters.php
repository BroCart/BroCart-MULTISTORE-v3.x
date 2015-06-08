<?php

class ControllerModuleFilters extends Controller {

    protected function index($setting) {
        $this->language->load('module/filters');
        $categoryId = 0;
        if (isset($this->request->get['path'])) {
            $parts = explode('_', $this->request->get['path']);
            $size = sizeof($parts);
            $categoryId = $parts[--$size];
            $this->data['categoryId'] = $categoryId;
        }

        if (isset($this->request->get['filters'])) {
            $temp = htmlspecialchars_decode($this->request->get['filters']);
            $filters = json_decode($temp, true);
            $this->data['filters'] = $filters;
        }
        $this->load->model('filters/filters');

        //Manufacturers
		if ($this->config->get('filter_man') === '1') {
			$resultSet = $this->model_filters_filters->getManufacturersInACategory($categoryId);
			$this->data['manufacturers'] = $resultSet;
			unset($resultSet);
		} else {
			$this->data['manufacturers'] = false;
		}
        if ($this->config->get('filter_attr') === '1') {
			$resultAttr = $this->model_filters_filters->getAttributes($categoryId);

			$this->data['productAttributes'] = $resultAttr;
		} else {
			$this->data['productAttributes'] = false;
		}
       	if ($this->config->get('filter_opt') === '1') {
			$resultArray = $this->model_filters_filters->getProductOptionsInACategory($categoryId);		
			$this->data['productOptions'] = $resultArray;
		} else {
			$this->data['productOptions'] = false;
		}	
		
        //Product option filters
        
        //Price filter
        $priceRangeArray = $this->model_filters_filters->getPriceRange($categoryId);
        $this->data['priceRangeArray'] = $priceRangeArray;
		
		$this->load->library('currency');
        $currency_code = $this->currency->getCode();
        $default_currency_code = $this->config->get('config_currency');
		
		
		
		$min = floor($priceRangeArray['min'] * $this->currency->getValue());
		$max = ceil($priceRangeArray['max'] * $this->currency->getValue());
		
		
		$sl = $this->currency->getSymbolLeft();
		$sr = $this->currency->getSymbolRight();

		if(!empty($sl)) {
			$this->data['symbol'] = $sl;
		} elseif(!empty($sr)) {
			$this->data['symbol'] = $sr;
		} else {
			$this->data['symbol'] = false;
		}
		
		$this->data['pricemin'] = $min;
		$this->data['pricemax'] = $max;
				
		//Not actual, because Diablo 3 relise
        //Setting text from language file
        $this->data['text_manufacturer_select_option'] = html_entity_decode($this->language->get('text_manufacturer_select_option'));
        $this->data['text_product_options_select_option'] = html_entity_decode($this->language->get('text_product_options_select_option'));
        $this->data['text_price_filter'] = html_entity_decode($this->language->get('text_price_filter'));
        //$this->data['currency'] = html_entity_decode($this->language->get('text_currency'));
        $this->data['text_sale_items'] = html_entity_decode($this->language->get('text_sale_items'));
        $this->data['text_in_stock_products'] = html_entity_decode($this->language->get('text_in_stock_products'));
		
        $this->data['heading_title'] = html_entity_decode($this->language->get('heading_title'), ENT_QUOTES, 'UTF-8');
		
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/filters.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/filters.tpl';
        } else {
            $this->template = 'default/template/module/filters.tpl';
        }

        $this->render();
    }

    public function filter() {
        $filters = null;
        $this->language->load('module/filters');
        $this->load->model('filters/filters');

        if (isset($this->request->post['filters'])) {
            $filters = $this->request->post['filters'];
        }
        $this->model_filters_filters->filterProducts($filters);
    }

    public function applyFilter() {

        $this->language->load('product/category');

        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');
		
		$this->load->library('currency');
		
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
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
            'separator' => false
        );

        if (isset($this->request->get['path'])) {
            $path = '';

            $parts = explode('_', (string) $this->request->get['path']);

            foreach ($parts as $path_id) {
                if (!$path) {
                    $path = $path_id;
                } else {
                    $path .= '_' . $path_id;
                }

                $category_info = $this->model_catalog_category->getCategory($path_id);

                if ($category_info) {
                    $this->data['breadcrumbs'][] = array(
                        'text' => $category_info['name'],
                        'href' => $this->url->link('product/category', 'path=' . $path),
                        'separator' => $this->language->get('text_separator')
                    );
                }
            }

            $category_id = array_pop($parts);
        } else {
            $category_id = 0;
        }
		
        if ($category_info) {
			$page_w = $this->language->get('page_w');
		
	  		if (isset($category_info['u_title']) && !empty($category_info['u_title'] ) ) { 
				if ($page > 1) {
				$this->document->setTitle(trim($category_info['u_title']. $page_w .$page) );
				} else {
				$this->document->setTitle(trim($category_info['u_title']) );
				}
			} else {
				$this->document->setTitle($category_info['name']);
			}

			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);
			
			if (isset($category_info['u_h1']) && !empty($category_info['u_h1'] ) ) { 
				$this->data['heading_title'] = $category_info['u_h1'];
			}
			else {
				$this->data['heading_title'] = $category_info['name'];
			}
			if (isset($category_info['u_h2']) && !empty($category_info['u_h2'] ) ) { 
				$this->data['useo_heading_title2'] = $category_info['u_h2'];
			}

            $this->data['text_refine'] = $this->language->get('text_refine');
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
			
			// Set the last category breadcrumb		
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
				'text'      => $category_info['name'],
				'href'      => $this->url->link('product/category', 'path=' . $this->request->get['path']),
				'separator' => $this->language->get('text_separator')
			);
			
			if ($category_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
			} else {
				$this->data['thumb'] = '';
			}
			$this->data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['compare'] = $this->url->link('product/compare');
            
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

            $this->data['categories'] = array();

            $this->data['products'] = array();

            $data = array(
                'filter_category_id' => $category_id,
                'sort' => $sort,
                'order' => $order,
                'start' => ($page - 1) * $limit,
                'limit' => ''
			 );  
            $filters = array();
            if (isset($this->request->post['filters'])) {
                $filters = $this->request->post['filters'];

            }
        
            $manufacturerId = 0;
            $productOption = null;
			$productAttribute = null;
            $saleItems = null;
            $inStock = null;
            $minPrice = null;
            $maxPrice = null;
            ksort($filters);
            $localPriceArray = array();
	
            foreach ($filters as $filter) {
			
                if (strtolower($filter['param']) == 'product-option') {
                    if (!$productOption) {
                        $productOption = $filter['val'];
                    } else {
                        $productOption = $productOption . ',' . $filter['val'];
                    }
                } else if (strtolower($filter['param']) == 'manufacturer') {
				//if(isset($this->request->post['filters'])){
                    if (!$manufacturerId) {
                        $manufacturerId = $filter['val'];
                    } else {
                        $manufacturerId = $manufacturerId . ',' . $filter['val'];
                    }
				//}
				 } else if (strtolower($filter['param']) == 'product-attribute') {
                    if (!$productAttribute) {
                        $productAttribute = $filter['val'];
                    } else {
                        $productAttribute = $productAttribute . ',' . $filter['val'];
                    }	
                } else if (strtolower($filter['param']) == 'sale_items' && strtolower($filter['val']) == 'on') {
                    $saleItems = true;
                } else if (strtolower($filter['param']) == 'in_stock' && strtolower($filter['val']) == 'on') {
                    $inStock = true;
                } else if (strtolower($filter['param']) == 'price') {
                    list($minPrice, $maxPrice) = explode("-", $filter['val']);
                    array_push($localPriceArray,$minPrice);
                    array_push($localPriceArray,$maxPrice);
                }
            }

		$currency_code = $this->currency->getCode();
		
        $default_currency_code = $this->config->get('config_currency');
		
			if(sizeof($localPriceArray) > 1){
			
			//if ($currency_code == $default_currency_code) {
					//$minPrice = min($localPriceArray);
					//$maxPrice = max($localPriceArray);
				//} else {
					$minp = min($localPriceArray);
					$maxp = max($localPriceArray);				
					$minPrice = floor($minp / $this->currency->getValue());
					$maxPrice = ceil($maxp / $this->currency->getValue());
				//}
            }
            
            $filterCond = array(
                'productOption' => $productOption,
				'productAttribute' => $productAttribute,
                'manufacturerId' => $manufacturerId,
                'saleItems' => $saleItems,
                'inStock' => $inStock,
                'minPrice' => $minPrice,
                'maxPrice' => $maxPrice
            );

            $data = array_merge($data, $filterCond);
			
            $product_total = $this->model_catalog_product->getTotalProducts($data);
			
            $this->load->model('filters/filters');
			
            $results = $this->model_filters_filters->getProducts($data);

            $product_ids = array();
            foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));;
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

                //$product_ids = array();
				$this->data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 220) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $result['rating'],
					'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id']),
				    'weight' 	  => $this->weight->format($result['weight'], $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'))
				);
                $product_ids[]= $result['product_id'];
			}

            $product_ids= implode(",",$product_ids);

            //получаем атрибуты по товарам
            $attributes = $this->model_filters_filters->getAttributesByProductIds($product_ids);

			$manufacturers = $this->model_filters_filters->getManufByProductIds($product_ids);
			
			$options = $this->model_filters_filters->getOptionsByProductIds($product_ids);
			
            $url = '';

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            $this->data['sorts'] = array();

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
            );

            if ($this->config->get('config_review_status')) {
                $this->data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_desc'),
                    'value' => 'rating-DESC',
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
                );

                $this->data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_asc'),
                    'value' => 'rating-ASC',
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
                );
            }

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_model_asc'),
                'value' => 'p.model-ASC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
            );

            $this->data['sorts'][] = array(
                'text' => $this->language->get('text_model_desc'),
                'value' => 'p.model-DESC',
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
            );

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

			
			
            $this->data['limits'] = array();

            $this->data['limits'][] = array(
                'text' => $this->config->get('config_catalog_limit'),
                'value' => $this->config->get('config_catalog_limit'),
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $this->config->get('config_catalog_limit'))
            );

            $this->data['limits'][] = array(
                'text' => 25,
                'value' => 25,
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=25')
            );

            $this->data['limits'][] = array(
                'text' => 50,
                'value' => 50,
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=50')
            );

            $this->data['limits'][] = array(
                'text' => 75,
                'value' => 75,
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=75')
            );

            $this->data['limits'][] = array(
                'text' => 100,
                'value' => 100,
                'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=100')
            );

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
            $pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

            $this->data['pagination'] = $pagination->render();

            $this->data['sort'] = $sort;
            $this->data['order'] = $order;
            $this->data['limit'] = $limit;

            $this->data['continue'] = $this->url->link('common/home');

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/filtered_category.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/module/filtered_category.tpl';
            } else {
                $this->template = 'default/template/module/filtered_category.tpl';
            }

            //отправляем товар и их ид (чтобы не делать новый запрос на получение товаров)
            //потом по ид получим атрибуты и обновим фильтр атрибутов
            $result = array(
                'html_output'=>$this->render(),
                'attributes'=>$attributes,
				'opt' => $options,
				'manufes'=>$manufacturers
            );
            $this->response->setOutput(json_encode($result));
        } else {
            $url = '';

            if (isset($this->request->get['path'])) {
                $url .= '&path=' . $this->request->get['path'];
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
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('product/category', $url),
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

            $this->response->setOutput($this->render());
        }
    }

	private function getProductOptions($product_id,$tax_class_id,$price=0){
	
		$options = array();
			
		foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) { 
			if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') { 
				$option_value_data = array();
				
				foreach ($option['option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if($option['type'] == 'select'){
								$option_price = $price;
								if ($option_value['price_prefix'] == '+') {
									$option_price += $option_value['price'];
								} elseif ($option_value['price_prefix'] == '-') {
									$option_price -= $option_value['price'];
								}
						
						
							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
								'price'                   =>  $this->currency->format($this->tax->calculate($option_price, $tax_class_id, $this->config->get('config_tax'))),
							);
						}else{	
							$option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
								'price'                   => (float)$option_value['price'] ? $this->currency->format($this->tax->calculate($option_value['price'], $tax_class_id, $this->config->get('config_tax'))) : false,
								'price_prefix'            => $option_value['price_prefix']
							);
						}
					
					}
				}
				
				$options[] = array(
					'product_option_id' => $option['product_option_id'],
					'option_id'         => $option['option_id'],
					'name'              => $option['name'],
					'type'              => $option['type'],
					'option_value'      => $option_value_data,
					'required'          => $option['required']
				);					
			} 

			elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
				$this->data['options'][] = array(
					'product_option_id' => $option['product_option_id'],
					'option_id'         => $option['option_id'],
					'name'              => $option['name'],
					'type'              => $option['type'],
					'option_value'      => $option['option_value'],
					'required'          => $option['required']
				);						
			}
		}
		
		return $options;
	}
}

?>
