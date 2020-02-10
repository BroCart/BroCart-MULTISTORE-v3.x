<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		$this->load->model('setting/extension');
		$data['analytics'] = array();
		$analytics = $this->model_setting_extension->getExtensions('analytics');
		foreach ($analytics as $analytic) {
			if ($this->config->get('analytics_' . $analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get('analytics_' . $analytic['code'] . '_status'));
			}
		}
		if ($this->request->server['HTTPS']) {
			$server = HTTPS_SERVER;
		} else {
			$server = HTTP_SERVER;
		}
		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}
		$data['title'] = $this->document->getTitle();
		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();		
		$data['robots'] = $this->document->getRobots();
		$data['opg'] = $this->document->getOpengraph();
		$data['canonicals'] = $this->document->getCanonical();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts('header');
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['name'] = $this->config->get('config_name');

		$logos = $this->config->get('config_logo');		
		$data['logo'] = '';
		if (is_array($logos)) {				
			if (is_file(DIR_IMAGE . $logos[$this->config->get('config_language_id')])) {
				$data['logo'] = $server . 'image/' . $logos[$this->config->get('config_language_id')];
			}
		} else {
			if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
				$data['logo'] = $this->config->get('config_url') . 'image/' . $this->config->get('config_logo');
			}
		}
		
		//OG data
		$data['og_url'] = $server . utf8_substr($this->request->server['REQUEST_URI'], 1, (utf8_strlen($this->request->server['REQUEST_URI']) - 1));
		
		$data['og_image'] = $this->document->getOgImage();
		
		$this->load->language('common/header');		
		$data['text_home'] = $this->language->get('text_home');
		
		//Class route selector
		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}
		
		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));
		
		if ($this->url->link('common/home') == $data['og_url']) {
			$data['home'] = 'javascript:void(0);';
		} else {
			$data['home'] = $this->url->link('common/home');
		}
		
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		if ($this->config->get('config_simple_order')) {
		$data['checkout'] = $this->url->link('checkout/zakaz', '', $this->request->server['HTTPS'], $this->session->data['language']);
		} else {
		$data['checkout'] = $this->url->link('checkout/checkout', '', $this->request->server['HTTPS'], $this->session->data['language']);	
		}	
		$data['shopping_cart'] = $this->url->link('checkout/cart');		
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');		
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');
		
		if ('2.3' == VER_TMPL) {			
			$data['categories'] = $this->load->controller('common/menu');
		} else {
			$data['menu'] = $this->load->controller('common/menu');
		}

		return $this->load->view('common/header', $data);
	}
}
