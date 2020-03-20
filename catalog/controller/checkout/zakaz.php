<?php

/*	Express CheckOut
*	Autor: Artur Larin [ALarik]
*	Special for CMS BroCart
*/

class ControllerCheckoutZakaz extends Controller {

    public function index() {
		
		$this->document->addStyle('catalog/view/theme/default/stylesheet/expresszakaz.css');
		
        $this->load->language('checkout/zakaz');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home'),
            'text' => $this->language->get('text_home')
        );

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('checkout/zakaz'),
            'text' => $this->language->get('heading_title')
        );

        if ($this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {            

            if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
                $data['error_warning'] = $this->language->get('error_stock');
            } elseif (isset($this->session->data['error'])) {
                $data['error_warning'] = $this->session->data['error'];

                unset($this->session->data['error']);
            } else {
                $data['error_warning'] = '';
            }

            if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
                $data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
            } else {
                $data['attention'] = '';
            }

            if (isset($this->session->data['success'])) {
                $data['success'] = $this->session->data['success'];

                unset($this->session->data['success']);
            } else {
                $data['success'] = '';
            }

            $data['action'] = $this->url->link('checkout/zakaz/edit');

            if ($this->config->get('config_cart_weight')) {
                $data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
            } else {
                $data['weight'] = '';
            }

			$data['tovarov'] = $this->cart->countProducts();
			
            $this->load->model('tool/image');
			
            $data['products'] = array();

            $products = $this->cart->getProducts();

            foreach ($products as $product) {
                $product_total = 0;

                foreach ($products as $product_2) {
                    if ($product_2['product_id'] == $product['product_id']) {
                        $product_total += $product_2['quantity'];
                    }
                }

                if ($product['minimum'] > $product_total) {
                    $data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
                }

                if ($product['image']) {
                    $image = $this->model_tool_image->resize($product['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_cart_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_cart_height'));
                } else {
                    $image = '';
                }

                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    }
                    $option_data[] = array(
                        'name' => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                    );
                }

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
					
					$price = $this->currency->format($unit_price, $this->session->data['currency']);
					$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
				} else {
					$price = false;
					$total = false;
				}

                $recurring = '';
                
                $data['products'][] = array(
                    'cart_id'   => $product['cart_id'],
                    'thumb' => $image,
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'option' => $option_data,
                    'recurring' => $recurring,
                    'quantity' => $product['quantity'],
                    'stock' => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
                    'reward' => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
                    'price' => $price,
                    'total' => $total,
                    'href' => $this->url->link('product/product', 'product_id=' . $product['product_id'])
                );
            }

            $data['vouchers'] = array();

            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $key => $voucher) {
                    $data['vouchers'][] = array(
                        'key' => $key,
                        'description' => $voucher['description'],
                        'amount' => $this->currency->format($voucher['amount'], $this->session->data['currency']),
                        'remove' => $this->url->link('checkout/cart', 'remove=' . $key)
                    );
                }
            }

            $this->load->model('setting/extension');
            $totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$sort_order = array();
				$results = $this->model_setting_extension->getExtensions('total');
				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get('total_' . $value['code'] . '_sort_order');
				}
				array_multisort($sort_order, SORT_ASC, $results);
				foreach ($results as $result) {
					if ($this->config->get('total_' . $result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}
				$sort_order = array();
				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				array_multisort($sort_order, SORT_ASC, $totals);
			}

            $data['totals'] = array();

            foreach ($totals as $total) {
				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency']),
				);
			}

            $data['customer_groups'] = array();

            if (is_array($this->config->get('config_customer_group_display'))) {
                $this->load->model('account/customer_group');

                $customer_groups = $this->model_account_customer_group->getCustomerGroups();

                foreach ($customer_groups as $customer_group) {
                    if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
                        $data['customer_groups'][] = $customer_group;
                    }
                }
            }

            if (isset($this->session->data['guest']['customer_group_id'])) {
                $data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
            } else if($this->customer->isLogged()) {
                $data['customer_group_id'] = $this->customer->getGroupId();
            } else {
                $data['customer_group_id'] = $this->config->get('config_customer_group_id');
            }
            if (isset($this->session->data['guest']['firstname'])) {
                $data['firstname'] = $this->session->data['guest']['firstname'];
            } else if($this->customer->isLogged()) {
                $data['firstname'] = $this->customer->getFirstName();
            } else {
                $data['firstname'] = '';
            }

            if (isset($this->session->data['guest']['lastname'])) {
                $data['lastname'] = $this->session->data['guest']['lastname'];
            } else if($this->customer->isLogged()) {
                $data['lastname'] = $this->customer->getLastName();
            } else {
                $data['lastname'] = '';
            }

            if (isset($this->session->data['guest']['email'])) {
                $data['email'] = $this->session->data['guest']['email'];
            } else if($this->customer->isLogged()) {
                $data['email'] = $this->customer->getEmail();
            } else {
                $data['email'] = '';
            }

            if (isset($this->session->data['guest']['telephone'])) {
                $data['telephone'] = $this->session->data['guest']['telephone'];
            } else if($this->customer->isLogged()) {
                $data['telephone'] = $this->customer->getTelephone();
            } else {
                $data['telephone'] = '';
            }
           
            $address = array();
            if($this->customer->isLogged()){
                $this->load->model('account/address');
                $address = $this->model_account_address->getAddress($this->customer->getAddressId());
            }
            
            if (isset($this->session->data['payment_address']['company'])) {
                $data['company'] = $this->session->data['payment_address']['company'];
            } else if($address) {
                $data['company'] = $address['company'];
            } else {
                $data['company'] = '';
            }

            if (isset($this->session->data['payment_address']['address_1'])) {
                $data['address_1'] = $this->session->data['payment_address']['address_1'];
            } else if($address) {
                $data['address_1'] = $address['address_1'];
            } else {
                $data['address_1'] = '';
            }

            if (isset($this->session->data['payment_address']['address_2'])) {
                $data['address_2'] = $this->session->data['payment_address']['address_2'];
            } else if($address) {
                $data['address_2'] = $address['address_2'];
            } else {
                $data['address_2'] = '';
            }

            if (isset($this->session->data['payment_address']['postcode'])) {
                $data['postcode'] = $this->session->data['payment_address']['postcode'];
            } elseif (isset($this->session->data['shipping_address']['postcode'])) {
                $data['postcode'] = $this->session->data['shipping_address']['postcode'];
            } else if($address) {
                $data['postcode'] = $address['postcode'];
            } else {
                $data['postcode'] = '';
            }

            if (isset($this->session->data['payment_address']['city'])) {
                $data['city'] = $this->session->data['payment_address']['city'];
            } else if($address) {
                $data['city'] = $address['city'];
            } else {
                $data['city'] = '';
            }

            if (isset($this->session->data['payment_address']['country_id'])) {
                $data['country_id'] = $this->session->data['payment_address']['country_id'];
            } elseif (isset($this->session->data['shipping_address']['country_id'])) {
                $data['country_id'] = $this->session->data['shipping_address']['country_id'];
            } else if($address) {
                $data['country_id'] = $address['country_id'];
            } else {
                $data['country_id'] = $this->config->get('config_country_id');
            }

            if (isset($this->session->data['payment_address']['zone_id'])) {
                $data['zone_id'] = $this->session->data['payment_address']['zone_id'];
            } elseif (isset($this->session->data['shipping_address']['zone_id'])) {
                $data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
            } else if($address) {
                $data['zone_id'] = $address['zone_id'];
            } else {
                $data['zone_id'] = $this->config->get('config_zone_id');
            }
			
			$this->load->model('localisation/zone');
		
			$data['zones'] = $this->model_localisation_zone->getZonesByCountryId($data['country_id']);	

            $this->load->model('localisation/country');

            $data['countries'] = $this->model_localisation_country->getCountries();

            // Custom Fields
            $this->load->model('account/custom_field');

            $data['custom_fields'] = $this->model_account_custom_field->getCustomFields();

            $data['guest_custom_field'] = array();
           
            $data['shipping_required'] = $this->cart->hasShipping();

            if (isset($this->session->data['guest']['shipping_address'])) {
                $data['shipping_address'] = $this->session->data['guest']['shipping_address'];
            } else {
                $data['shipping_address'] = true;
            }

            if (isset($this->session->data['comment'])) {
                $data['comment'] = $this->session->data['comment'];
            } else {
                $data['comment'] = '';
            }
            
            if ($this->cart->countProducts()) {
				$this->session->data['shipping_address']['country_id'] = $this->config->get('config_country_id');
				$this->session->data['shipping_address']['zone_id'] = $this->config->get('config_zone_id');
			} else {
				unset($this->session->data['shipping_address']);
			}
			
			if (isset($this->session->data['shipping_address'])) {
				$method_data = array();
				$this->load->model('setting/extension');
				$results = $this->model_setting_extension->getExtensions('shipping');
				foreach ($results as $result) {
					if ($this->config->get('shipping_' . $result['code'] . '_status')) {
						$this->load->model('extension/shipping/' . $result['code']);
						$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);
						if ($quote) {
							$method_data[$result['code']] = array(
								'title'      => $quote['title'],
								'quote'      => $quote['quote'],
								'sort_order' => $quote['sort_order'],
								'error'      => $quote['error']
							);
						}
					}
				}

				$sort_order = array();
				foreach ($method_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				array_multisort($sort_order, SORT_ASC, $method_data);
				$this->session->data['shipping_methods'] = $method_data;
			}

            if ($this->config->get('config_checkout_id')) {
                $this->load->model('catalog/information');

                $information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

                if ($information_info) {
                    $data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_checkout_id'), 'SSL'), $information_info['title'], $information_info['title']);
                } else {
                    $data['text_agree'] = '';
                }
            } else {
                $data['text_agree'] = '';
            }

            if (isset($this->session->data['agree'])) {
                $data['agree'] = $this->session->data['agree'];
            } else {
                $data['agree'] = '';
            }
            
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
			
			$this->response->setOutput($this->load->view('checkout/zakaz', $data));
           
        } else {
            $data['heading_title'] = $this->language->get('heading_title');

            $data['text_error'] = $this->language->get('text_empty');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            unset($this->session->data['success']);

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }
    }

    public function save() {
        $this->load->language('checkout/zakaz');        
        $json = array();		
        $products = $this->cart->getProducts();
        foreach ($products as $product) {
            $product_total = 0;

            foreach ($products as $product_2) {
                if ($product_2['product_id'] == $product['product_id']) {
                    $product_total += $product_2['quantity'];
                }
            }

            if ($product['minimum'] > $product_total) {
                $json['redirect'] = $this->url->link('checkout/zakaz');
                break;
            }
        }
		
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $json['redirect'] = $this->url->link('checkout/zakaz');
        }

        if (!$json) {
            if ((!isset($this->request->post['firstname']) || utf8_strlen(trim($this->request->post['firstname'])) < 1 || utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
                $json['error']['firstname'] = $this->language->get('error_firstname');
            }

            if ((!isset($this->request->post['lastname']) || utf8_strlen(trim($this->request->post['lastname'])) < 1 || utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
                //$json['error']['lastname'] = $this->language->get('error_lastname');
            }

            if ((!isset($this->request->post['email']) || utf8_strlen($this->request->post['email']) > 96 || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email']))) {
                $json['error']['email'] = $this->language->get('error_email');
            }

            if ((!isset($this->request->post['telephone']) || utf8_strlen($this->request->post['telephone']) < 3 || utf8_strlen($this->request->post['telephone']) > 32)) {
                //$json['error']['telephone'] = $this->language->get('error_telephone');
            }

            if ((!isset($this->request->post['address_1']) || utf8_strlen(trim($this->request->post['address_1'])) < 3 || utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
               //$json['error']['address_1'] = $this->language->get('error_address_1');
            }
            if ((!isset($this->request->post['address_2']) || utf8_strlen(trim($this->request->post['address_2'])) < 3 || utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
                //$json['error']['address_2'] = $this->language->get('error_address_2');
            }

            if ((!isset($this->request->post['city']) || utf8_strlen(trim($this->request->post['city'])) < 2 || utf8_strlen(trim($this->request->post['city'])) > 128)) {
                //$json['error']['city'] = $this->language->get('error_city');
            }

            $this->load->model('localisation/country');

            $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

            if ($country_info && $country_info['postcode_required'] && (!isset($this->request->post['postcode']) || utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
                //$json['error']['postcode'] = $this->language->get('error_postcode');
            }

            if ($this->request->post['country_id'] == '') {
                //$json['error']['country'] = $this->language->get('error_country');
            }

            if ((!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '')) {
                //$json['error']['zone'] = $this->language->get('error_zone');
            }
            if ((!isset($this->request->post['comment']) || $this->request->post['comment'] == '')) {
                //$json['error']['comment'] = $this->language->get('error_comment');
            }
            
			$customer_group_id = $this->config->get('config_customer_group_id'); 
			
            if (!isset($this->request->post['shipping_method'])) {
                $json['error']['warning'] = $this->language->get('error_shipping');
            } else {
                $shipping = explode('.', $this->request->post['shipping_method']);
                if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
                    $json['error']['warning'] = $this->language->get('error_shipping');
                }
            }

            if (!isset($this->request->post['payment_method'])) {
                $json['error']['warning'] = $this->language->get('error_payment');
            } elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
                $json['error']['warning'] = $this->language->get('error_payment');
            }
        }

        if (!$json) {
            $this->session->data['account'] = 'guest';
            $empty = '';

            $this->session->data['guest']['customer_group_id'] = $customer_group_id;
            $this->session->data['guest']['firstname'] = isset($this->request->post['firstname']) ? $this->request->post['firstname'] : '';
            $this->session->data['guest']['lastname'] = isset($this->request->post['lastname']) ? $this->request->post['lastname'] : '';
            $this->session->data['guest']['email'] = isset($this->request->post['email']) ? $this->request->post['email'] : '';
            $this->session->data['guest']['telephone'] = isset($this->request->post['telephone']) ? $this->request->post['telephone'] : '';
            $this->session->data['guest']['fax'] = isset($this->request->post['fax']) ? $this->request->post['fax'] : '';
            
            $this->session->data['guest']['custom_field'] = array();            

            $this->session->data['payment_address']['firstname'] = isset($this->request->post['firstname']) ? $this->request->post['firstname'] : '';
            $this->session->data['payment_address']['lastname'] = isset($this->request->post['lastname']) ? $this->request->post['lastname'] : '';
            $this->session->data['payment_address']['company'] = isset($this->request->post['company']) ? $this->request->post['company'] : '';
            $this->session->data['payment_address']['address_1'] = isset($this->request->post['address_1']) ? $this->request->post['address_1'] : '';
            $this->session->data['payment_address']['address_2'] = isset($this->request->post['address_2']) ? $this->request->post['address_2'] : '';
            $this->session->data['payment_address']['postcode'] = isset($this->request->post['postcode']) ? $this->request->post['postcode'] : '';
            $this->session->data['payment_address']['city'] = isset($this->request->post['city']) ? $this->request->post['city'] : '';
            $this->session->data['payment_address']['country_id'] = isset($this->request->post['country_id']) ? $this->request->post['country_id'] : '';
            $this->session->data['payment_address']['zone_id'] = isset($this->request->post['zone_id']) ? $this->request->post['zone_id'] : '';

            $this->load->model('localisation/country');

            $country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

            if ($country_info) {
                $this->session->data['payment_address']['country'] = $country_info['name'];
                $this->session->data['payment_address']['iso_code_2'] = $country_info['iso_code_2'];
                $this->session->data['payment_address']['iso_code_3'] = $country_info['iso_code_3'];
                $this->session->data['payment_address']['address_format'] = $country_info['address_format'];
            } else {
                $this->session->data['payment_address']['country'] = '';
                $this->session->data['payment_address']['iso_code_2'] = '';
                $this->session->data['payment_address']['iso_code_3'] = '';
                $this->session->data['payment_address']['address_format'] = '';
            }

            if (isset($this->request->post['custom_field']['address'])) {
                $this->session->data['payment_address']['custom_field'] = $this->request->post['custom_field']['address'];
            } else {
                $this->session->data['payment_address']['custom_field'] = array();
            }

            $this->load->model('localisation/zone');

            $zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);

            if ($zone_info) {
                $this->session->data['payment_address']['zone'] = $zone_info['name'];
                $this->session->data['payment_address']['zone_code'] = $zone_info['code'];
            } else {
                $this->session->data['payment_address']['zone'] = '';
                $this->session->data['payment_address']['zone_code'] = '';
            }

            $this->session->data['guest']['shipping_address'] = $this->session->data['payment_address'];

            // Default Payment Address
            if ($this->session->data['guest']['shipping_address']) {
                $this->session->data['shipping_address']['firstname'] = isset($this->request->post['firstname']) ? $this->request->post['firstname'] : '';
                $this->session->data['shipping_address']['lastname'] = isset($this->request->post['lastname']) ? $this->request->post['lastname'] : '';
                $this->session->data['shipping_address']['company'] = isset($this->request->post['company']) ? $this->request->post['company'] : '';
                $this->session->data['shipping_address']['address_1'] = isset($this->request->post['address_1']) ? $this->request->post['address_1'] : '';
                $this->session->data['shipping_address']['address_2'] = isset($this->request->post['address_2']) ? $this->request->post['address_2'] : '';
                $this->session->data['shipping_address']['postcode'] = isset($this->request->post['postcode']) ? $this->request->post['postcode'] : '';
                $this->session->data['shipping_address']['city'] = isset($this->request->post['city']) ? $this->request->post['city'] : '';
                $this->session->data['shipping_address']['country_id'] = isset($this->request->post['country_id']) ? $this->request->post['country_id'] : '';
                $this->session->data['shipping_address']['zone_id'] = isset($this->request->post['zone_id']) ? $this->request->post['zone_id'] : '';

                if ($country_info) {
                    $this->session->data['shipping_address']['country'] = $country_info['name'];
                    $this->session->data['shipping_address']['iso_code_2'] = $country_info['iso_code_2'];
                    $this->session->data['shipping_address']['iso_code_3'] = $country_info['iso_code_3'];
                    $this->session->data['shipping_address']['address_format'] = $country_info['address_format'];
                } else {
                    $this->session->data['shipping_address']['country'] = '';
                    $this->session->data['shipping_address']['iso_code_2'] = '';
                    $this->session->data['shipping_address']['iso_code_3'] = '';
                    $this->session->data['shipping_address']['address_format'] = '';
                }

                if ($zone_info) {
                    $this->session->data['shipping_address']['zone'] = $zone_info['name'];
                    $this->session->data['shipping_address']['zone_code'] = $zone_info['code'];
                } else {
                    $this->session->data['shipping_address']['zone'] = '';
                    $this->session->data['shipping_address']['zone_code'] = '';
                }

                if (isset($this->request->post['custom_field']['address'])) {
                    $this->session->data['shipping_address']['custom_field'] = $this->request->post['custom_field']['address'];
                } else {
                    $this->session->data['shipping_address']['custom_field'] = array();
                }
            }

            $this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
            $this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
            $this->session->data['comment']= isset($this->request->post['comment']) ? $this->request->post['comment'] : '';
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function getShipping() {
        $this->load->language('checkout/zakaz');

        if (isset($this->session->data['shipping_address'])) {
            $shipping_address = $this->session->data['shipping_address'];
        } else {
            $shipping_address = array();
            $shipping_address['country_id'] = $this->config->get('config_country_id');
            $shipping_address['zone_id'] = $this->request->get['zone_id'];
        }
        $method_data = array();
        if ($this->cart->countProducts()) {
			$this->session->data['shipping_address'] = $shipping_address;
		} else {
			unset($this->session->data['shipping_address']);
		}		
		if (isset($this->session->data['shipping_address'])) {
			$method_data = array();
			$this->load->model('setting/extension');
			$results = $this->model_setting_extension->getExtensions('shipping');			
			foreach ($results as $result) {
				if ($this->config->get('shipping_' . $result['code'] . '_status')) {					
					$this->load->model('extension/shipping/' . $result['code']);
					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);
					if ($quote) {
						$method_data[$result['code']] = array(
							'title'      => $quote['title'],
							'quote'      => $quote['quote'],
							'sort_order' => $quote['sort_order'],
							'error'      => $quote['error']
						);
					}
				}
			}
			$sort_order = array();
			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
			array_multisort($sort_order, SORT_ASC, $method_data);
			$this->session->data['shipping_methods'] = $method_data;
		}

        $data['text_shipping_method'] = $this->language->get('text_shipping_method');
        $data['text_loading'] = $this->language->get('text_loading');

        if (empty($this->session->data['shipping_methods'])) {
            $data['error_warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['shipping_methods'])) {
			foreach ($this->session->data['shipping_methods'] as $i => $shipping_method) {
                foreach ($shipping_method['quote'] as $shipping_reconstruct) {
                    $data['shipping_methods'][$i]['value'] = $shipping_reconstruct['code'];
                    $data['shipping_methods'][$i]['title'] = $shipping_reconstruct['title'];
                }
			}
        } else {
            $data['shipping_methods'] = array();
        }

        if (isset($this->session->data['shipping_method']['code'])) {
            $data['code'] = $this->session->data['shipping_method']['code'];
        } else {
            $data['code'] = '';
        }

        $this->response->setOutput($this->load->view('checkout/dostavka', $data));        
    }

    public function getPayment() {
        $this->load->language('checkout/zakaz');

        if ($this->cart->countProducts()) {
			$this->session->data['payment_address']['country_id'] = $this->config->get('config_country_id');
			$this->session->data['payment_address']['zone_id'] = $this->config->get('config_zone_id');
		} else {
			unset($this->session->data['payment_address']);
		}		

		if (isset($this->session->data['payment_address'])) {
			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);			
			$this->load->model('setting/extension');
			$sort_order = array();
			$results = $this->model_setting_extension->getExtensions('total');
			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get('total_' . $value['code'] . '_sort_order');
			}
			array_multisort($sort_order, SORT_ASC, $results);
			foreach ($results as $result) {
				if ($this->config->get('total_' . $result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}
			$method_data = array();

			$this->load->model('setting/extension');

			$results = $this->model_setting_extension->getExtensions('payment');

			$recurring = $this->cart->hasRecurringProducts();

			foreach ($results as $result) {
				if ($this->config->get('payment_' . $result['code'] . '_status')) {
					$this->load->model('extension/payment/' . $result['code']);

					$method = $this->{'model_extension_payment_' . $result['code']}->getMethod($this->session->data['payment_address'], $total);

					if ($method) {
						if ($recurring) {
							if (property_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
								$method_data[$result['code']] = $method;
							}
						} else {
							$method_data[$result['code']] = $method;
						}
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['payment_methods'] = $method_data;
		}

        $data['text_payment_method'] = $this->language->get('text_payment_method');
        $data['text_loading'] = $this->language->get('text_loading');

        $data['button_continue'] = $this->language->get('button_continue');

        if (empty($this->session->data['payment_methods'])) {
            $data['error_warning'] = sprintf($this->language->get('error_no_payment'), $this->url->link('information/contact'));
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['payment_methods'])) {
            $data['payment_methods'] = $this->session->data['payment_methods'];
        } else {
            $data['payment_methods'] = array();
        }

        if (isset($this->session->data['payment_method']['code'])) {
            $data['code'] = $this->session->data['payment_method']['code'];
        } else {
            $data['code'] = '';
        }

        $data['scripts'] = $this->document->getScripts();

        if ($this->config->get('config_checkout_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

            if ($information_info) {
                $data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_checkout_id'), 'SSL'), $information_info['title'], $information_info['title']);
            } else {
                $data['text_agree'] = '';
            }
        } else {
            $data['text_agree'] = '';
        }

        if (isset($this->session->data['agree'])) {
            $data['agree'] = $this->session->data['agree'];
        } else {
            $data['agree'] = '';
        }

        $this->response->setOutput($this->load->view('checkout/oplata', $data));        
    }

    function reConfirmed() {
        if (isset($this->session->data['payment_methods'])) {
            $this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
            if (isset($this->request->post['method'])) {
                $json = array();				
                $json['output'] = html_entity_decode($this->load->controller('extension/payment/' . $this->session->data['payment_method']['code']), ENT_QUOTES, 'UTF-8');
                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($json));
            }
        }
    }

    public function confirm() {
        $redirect = '';
		$json = array();
		if ($this->cart->hasShipping()) {
			if (!isset($this->session->data['shipping_address'])) {
				$redirect = $this->url->link('zakaz/checkout', '', true);
			}
			if (!isset($this->session->data['shipping_method'])) {
				$redirect = $this->url->link('zakaz/checkout', '', true);
			}
		} else {
			unset($this->session->data['shipping_address']);
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
		}
		if (!isset($this->session->data['payment_address'])) {
			$redirect = $this->url->link('zakaz/checkout', '', true);
		}
		if (!isset($this->session->data['payment_method'])) {
			$redirect = $this->url->link('zakaz/checkout', '', true);
		}

        if (!$redirect) {
			$order_data = array();
			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
			$this->load->model('setting/extension');
			$sort_order = array();
			$results = $this->model_setting_extension->getExtensions('total');
			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get('total_' . $value['code'] . '_sort_order');
			}
			array_multisort($sort_order, SORT_ASC, $results);
			foreach ($results as $result) {
				if ($this->config->get('total_' . $result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}
			$sort_order = array();
			foreach ($totals as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
			array_multisort($sort_order, SORT_ASC, $totals);
			
			$order_data['totals'] = $totals;
			
			$this->load->language('checkout/zakaz');
			
			$order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
			$order_data['store_id'] = $this->config->get('config_store_id');
			$order_data['store_name'] = $this->config->get('config_name');
			if ($order_data['store_id']) {
				$order_data['store_url'] = $this->config->get('config_url');
			} else {
				if ($this->request->server['HTTPS']) {
					$order_data['store_url'] = HTTPS_SERVER;
				} else {
					$order_data['store_url'] = HTTP_SERVER;
				}
			}			
			$this->load->model('account/customer');

			if ($this->customer->isLogged()) {
				$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

				$order_data['customer_id'] = $this->customer->getId();
				$order_data['customer_group_id'] = $customer_info['customer_group_id'];
				$order_data['firstname'] = $customer_info['firstname'];
				$order_data['lastname'] = $customer_info['lastname'];
				$order_data['email'] = $customer_info['email'];
				$order_data['telephone'] = $customer_info['telephone'];
				$order_data['custom_field'] = json_decode($customer_info['custom_field'], true);
			} elseif (isset($this->session->data['guest'])) {
				$order_data['customer_id'] = 0;
				$order_data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
				$order_data['firstname'] = $this->session->data['guest']['firstname'];
				$order_data['lastname'] = $this->session->data['guest']['lastname'];
				$order_data['email'] = $this->session->data['guest']['email'];
				$order_data['telephone'] = $this->session->data['guest']['telephone'];
				$order_data['custom_field'] = $this->session->data['guest']['custom_field'];
			}

			$order_data['payment_firstname'] = $this->session->data['payment_address']['firstname'];
			$order_data['payment_lastname'] = $this->session->data['payment_address']['lastname'];
			$order_data['payment_company'] = $this->session->data['payment_address']['company'];
			$order_data['payment_address_1'] = $this->session->data['payment_address']['address_1'];
			$order_data['payment_address_2'] = $this->session->data['payment_address']['address_2'];
			$order_data['payment_city'] = $this->session->data['payment_address']['city'];
			$order_data['payment_postcode'] = $this->session->data['payment_address']['postcode'];
			$order_data['payment_zone'] = $this->session->data['payment_address']['zone'];
			$order_data['payment_zone_id'] = $this->session->data['payment_address']['zone_id'];
			$order_data['payment_country'] = $this->session->data['payment_address']['country'];
			$order_data['payment_country_id'] = $this->session->data['payment_address']['country_id'];
			$order_data['payment_address_format'] = $this->session->data['payment_address']['address_format'];
			$order_data['payment_custom_field'] = array();

			if (isset($this->session->data['payment_method']['title'])) {
				$order_data['payment_method'] = $this->session->data['payment_method']['title'];
			} else {
				$order_data['payment_method'] = '';
			}

			if (isset($this->session->data['payment_method']['code'])) {
				$order_data['payment_code'] = $this->session->data['payment_method']['code'];
			} else {
				$order_data['payment_code'] = '';
			}

			if ($this->cart->hasShipping()) {
				$order_data['shipping_firstname'] = $this->session->data['shipping_address']['firstname'];
				$order_data['shipping_lastname'] = $this->session->data['shipping_address']['lastname'];
				$order_data['shipping_company'] = $this->session->data['shipping_address']['company'];
				$order_data['shipping_address_1'] = $this->session->data['shipping_address']['address_1'];
				$order_data['shipping_address_2'] = $this->session->data['shipping_address']['address_2'];
				$order_data['shipping_city'] = $this->session->data['shipping_address']['city'];
				$order_data['shipping_postcode'] = $this->session->data['shipping_address']['postcode'];
				$order_data['shipping_zone'] = $this->session->data['shipping_address']['zone'];
				$order_data['shipping_zone_id'] = $this->session->data['shipping_address']['zone_id'];
				$order_data['shipping_country'] = $this->session->data['shipping_address']['country'];
				$order_data['shipping_country_id'] = $this->session->data['shipping_address']['country_id'];
				$order_data['shipping_address_format'] = $this->session->data['shipping_address']['address_format'];
				$order_data['shipping_custom_field'] = array();

				if (isset($this->session->data['shipping_method']['title'])) {
					$order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
				} else {
					$order_data['shipping_method'] = '';
				}

				if (isset($this->session->data['shipping_method']['code'])) {
					$order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
				} else {
					$order_data['shipping_code'] = '';
				}
			} else {
				$order_data['shipping_firstname'] = '';
				$order_data['shipping_lastname'] = '';
				$order_data['shipping_company'] = '';
				$order_data['shipping_address_1'] = '';
				$order_data['shipping_address_2'] = '';
				$order_data['shipping_city'] = '';
				$order_data['shipping_postcode'] = '';
				$order_data['shipping_zone'] = '';
				$order_data['shipping_zone_id'] = '';
				$order_data['shipping_country'] = '';
				$order_data['shipping_country_id'] = '';
				$order_data['shipping_address_format'] = '';
				$order_data['shipping_custom_field'] = array();
				$order_data['shipping_method'] = '';
				$order_data['shipping_code'] = '';
			}

			$order_data['products'] = array();

			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();

				foreach ($product['option'] as $option) {
					$option_data[] = array(
						'product_option_id'       => $option['product_option_id'],
						'product_option_value_id' => $option['product_option_value_id'],
						'option_id'               => $option['option_id'],
						'option_value_id'         => $option['option_value_id'],
						'name'                    => $option['name'],
						'value'                   => $option['value'],
						'type'                    => $option['type']
					);
				}

				$order_data['products'][] = array(
					'product_id' => $product['product_id'],
					'name'       => $product['name'],
					'model'      => $product['model'],
					'option'     => $option_data,
					'download'   => $product['download'],
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'price'      => $product['price'],
					'total'      => $product['total'],
					'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
					'reward'     => $product['reward']
				);
			}

			// Gift Voucher
			$order_data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $voucher) {
					$order_data['vouchers'][] = array(
						'description'      => $voucher['description'],
						'code'             => token(10),
						'to_name'          => $voucher['to_name'],
						'to_email'         => $voucher['to_email'],
						'from_name'        => $voucher['from_name'],
						'from_email'       => $voucher['from_email'],
						'voucher_theme_id' => $voucher['voucher_theme_id'],
						'message'          => $voucher['message'],
						'amount'           => $voucher['amount']
					);
				}
			}

			$order_data['comment'] = $this->session->data['comment'];
			$order_data['total'] = $total_data['total'];

			if (isset($this->request->cookie['tracking'])) {
				$order_data['tracking'] = $this->request->cookie['tracking'];

				$subtotal = $this->cart->getSubTotal();

				// Affiliate
				$affiliate_info = $this->model_account_customer->getAffiliateByTracking($this->request->cookie['tracking']);

				if ($affiliate_info) {
					$order_data['affiliate_id'] = $affiliate_info['customer_id'];
					$order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
				} else {
					$order_data['affiliate_id'] = 0;
					$order_data['commission'] = 0;
				}

				// Marketing
				$this->load->model('checkout/marketing');

				$marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

				if ($marketing_info) {
					$order_data['marketing_id'] = $marketing_info['marketing_id'];
				} else {
					$order_data['marketing_id'] = 0;
				}
			} else {
				$order_data['affiliate_id'] = 0;
				$order_data['commission'] = 0;
				$order_data['marketing_id'] = 0;
				$order_data['tracking'] = '';
			}

			$order_data['language_id'] = $this->config->get('config_language_id');
			$order_data['currency_id'] = $this->currency->getId($this->session->data['currency']);
			$order_data['currency_code'] = $this->session->data['currency'];
			$order_data['currency_value'] = $this->currency->getValue($this->session->data['currency']);
			$order_data['ip'] = $this->request->server['REMOTE_ADDR'];

			if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
				$order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
			} elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
				$order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
			} else {
				$order_data['forwarded_ip'] = '';
			}

			if (isset($this->request->server['HTTP_USER_AGENT'])) {
				$order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
			} else {
				$order_data['user_agent'] = '';
			}

			if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
				$order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
			} else {
				$order_data['accept_language'] = '';
			}

			$this->load->model('checkout/order');

			$this->session->data['order_id'] = $this->model_checkout_order->addOrder($order_data);
			$json['success'] = true;
		} else {
			$json['redirect'] = $redirect;
		}
		
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    
    public function updateTotal() {        
        if (isset($this->request->post['method']) && isset($this->session->data['shipping_methods'])){
            $code = explode('.', $this->request->post['method']);

            if (isset($this->session->data['shipping_methods'][$code[0]]['quote'][$code[1]])) {
                $this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$code[0]]['quote'][$code[1]];
				$this->load->model('setting/extension');
				$totals = array();
				$taxes = $this->cart->getTaxes();
				$total = 0;
				$total_data = array(
					'totals' => &$totals,
					'taxes'  => &$taxes,
					'total'  => &$total
				);
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$sort_order = array();
					$results = $this->model_setting_extension->getExtensions('total');
					foreach ($results as $key => $value) {
						$sort_order[$key] = $this->config->get('total_' . $value['code'] . '_sort_order');
					}
					array_multisort($sort_order, SORT_ASC, $results);
					foreach ($results as $result) {
						if ($this->config->get('total_' . $result['code'] . '_status')) {
							$this->load->model('extension/total/' . $result['code']);
							$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
						}
					}
					$sort_order = array();
					foreach ($totals as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}
					array_multisort($sort_order, SORT_ASC, $totals);
				}

                $json = array();
                $json['totals'] = '';
				foreach ($totals as $total) {
					$json['totals'] .= '<tr class="order-total">';
					$json['totals'] .= '	<th>'.$total['title'].'</th>';
					$json['totals'] .= '	<td>';
					$json['totals'] .= '		<span class="amount">'.$this->currency->format($total['value'], $this->session->data['currency']).'</span>';
					$json['totals'] .= '	</td>';
					$json['totals'] .= '</tr>';
				}
                $this->response->addHeader('Content-Type: application/json');
                $this->response->setOutput(json_encode($json));
            }
        }
    }
}
