<?php
class ControllerModuleQvCh extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/qv_ch');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('qv_ch', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');
		//reg_w
		$this->data['entry_firstname_req'] = $this->language->get('entry_firstname_req');
		$this->data['entry_lastname_req'] = $this->language->get('entry_lastname_req');
		$this->data['entry_telephone_req'] = $this->language->get('entry_telephone_req');
		$this->data['entry_fax_req'] = $this->language->get('entry_fax_req');
		$this->data['entry_company_req'] = $this->language->get('entry_company_req');
		$this->data['entry_address_1_req'] = $this->language->get('entry_address_1_req');
		$this->data['entry_address_2_req'] = $this->language->get('entry_address_2_req');
		$this->data['entry_city_req'] = $this->language->get('entry_city_req');
		$this->data['entry_postcode_req'] = $this->language->get('entry_postcode_req');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_confirm'] = $this->language->get('entry_confirm');
		//end_reg_w
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_required'] = $this->language->get('text_required');
		$this->data['text_not_required'] = $this->language->get('text_not_required');
		$this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['text_fields'] = $this->language->get('text_fields');
        $this->data['entry_firstname'] = $this->language->get('entry_firstname');
        $this->data['entry_lastname'] = $this->language->get('entry_lastname');
        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['entry_telephone'] = $this->language->get('entry_telephone');
        $this->data['entry_fax'] = $this->language->get('entry_fax');
        $this->data['entry_company'] = $this->language->get('entry_company');
        $this->data['entry_address_1'] = $this->language->get('entry_address_1');
        $this->data['entry_address_2'] = $this->language->get('entry_address_2');
        $this->data['entry_city'] = $this->language->get('entry_city');
        $this->data['entry_postcode'] = $this->language->get('entry_postcode');
        $this->data['entry_country'] = $this->language->get('entry_country');
        $this->data['entry_min_order_sum'] = $this->language->get('entry_min_order_sum');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['token'] = $this->session->data['token'];
        $this->data['settings'] = $this->model_setting_setting->getSetting('qv_ch');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/qv_ch', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = $this->url->link('module/qv_ch', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');


		//customer_config_firstname
		if (isset($this->request->post['config_firstname_req'])) {
			$this->data['config_firstname_req'] = $this->request->post['config_firstname_req'];
		} else {
			$this->data['config_firstname_req'] = $this->config->get('config_firstname_req');
		}
		if (isset($this->request->post['config_firstname_disp'])) {
			$this->data['config_firstname_disp'] = $this->request->post['config_firstname_disp'];
		} else {
			$this->data['config_firstname_disp'] = $this->config->get('config_firstname_disp');
		}
		//lastname
		if (isset($this->request->post['config_lastname_req'])) {
			$this->data['config_lastname_req'] = $this->request->post['config_lastname_req'];
		} else {
			$this->data['config_lastname_req'] = $this->config->get('config_lastname_req');
		}
		if (isset($this->request->post['config_lastname_disp'])) {
			$this->data['config_lastname_disp'] = $this->request->post['config_lastname_disp'];
		} else {
			$this->data['config_lastname_disp'] = $this->config->get('config_lastname_disp');
		}
		
		//telepfhone
		if (isset($this->request->post['config_tel_req'])) {
			$this->data['config_tel_req'] = $this->request->post['config_tel_req'];
		} else {
			$this->data['config_tel_req'] = $this->config->get('config_tel_req');
		}
		if (isset($this->request->post['config_tel_disp'])) {
			$this->data['config_tel_disp'] = $this->request->post['config_tel_disp'];
		} else {
			$this->data['config_tel_disp'] = $this->config->get('config_tel_disp');
		}
		//fax
		if (isset($this->request->post['config_fax_req'])) {
			$this->data['config_fax_req'] = $this->request->post['config_fax_req'];
		} else {
			$this->data['config_fax_req'] = $this->config->get('config_fax_req');
		}
		if (isset($this->request->post['config_fax_disp'])) {
			$this->data['config_fax_disp'] = $this->request->post['config_fax_disp'];
		} else {
			$this->data['config_fax_disp'] = $this->config->get('config_fax_disp');
		}
		//company
		if (isset($this->request->post['config_comp_req'])) {
			$this->data['config_comp_req'] = $this->request->post['config_comp_req'];
		} else {
			$this->data['config_comp_req'] = $this->config->get('config_comp_req');
		}
		if (isset($this->request->post['config_comp_disp'])) {
			$this->data['config_comp_disp'] = $this->request->post['config_comp_disp'];
		} else {
			$this->data['config_comp_disp'] = $this->config->get('config_comp_disp');
		}
		//addres 1 
		if (isset($this->request->post['config_addr_req'])) {
			$this->data['config_addr_req'] = $this->request->post['config_addr_req'];
		} else {
			$this->data['config_addr_req'] = $this->config->get('config_addr_req');
		}
		if (isset($this->request->post['config_addr_disp'])) {
			$this->data['config_addr_disp'] = $this->request->post['config_addr_disp'];
		} else {
			$this->data['config_addr_disp'] = $this->config->get('config_addr_disp');
		}
		//addres 2 
		if (isset($this->request->post['config_addr2_req'])) {
			$this->data['config_addr2_req'] = $this->request->post['config_addr2_req'];
		} else {
			$this->data['config_addr2_req'] = $this->config->get('config_addr2_req');
		}
		if (isset($this->request->post['config_addr2_disp'])) {
			$this->data['config_addr2_disp'] = $this->request->post['config_addr2_disp'];
		} else {
			$this->data['config_addr2_disp'] = $this->config->get('config_addr2_disp');
		}
		//city 
		if (isset($this->request->post['config_city_req'])) {
			$this->data['config_city_req'] = $this->request->post['config_city_req'];
		} else {
			$this->data['config_city_req'] = $this->config->get('config_city_req');
		}
		if (isset($this->request->post['config_city_disp'])) {
			$this->data['config_city_disp'] = $this->request->post['config_city_disp'];
		} else {
			$this->data['config_city_disp'] = $this->config->get('config_city_disp');
		}
		//postcode 
		if (isset($this->request->post['config_post_req'])) {
			$this->data['config_post_req'] = $this->request->post['config_post_req'];
		} else {
			$this->data['config_post_req'] = $this->config->get('config_post_req');
		}
		if (isset($this->request->post['config_post_disp'])) {
			$this->data['config_post_disp'] = $this->request->post['config_post_disp'];
		} else {
			$this->data['config_post_disp'] = $this->config->get('config_post_disp');
		}
		//country 
		
		if (isset($this->request->post['config_co_disp'])) {
			$this->data['config_co_disp'] = $this->request->post['config_co_disp'];
		} else {
			$this->data['config_co_disp'] = $this->config->get('config_co_disp');
		}
		//confirm
		
		if (isset($this->request->post['config_conf_disp'])) {
			$this->data['config_conf_disp'] = $this->request->post['config_conf_disp'];
		} else {
			$this->data['config_conf_disp'] = $this->config->get('config_conf_disp');
		}
		//end_cust_conf

		//cart_config
		//firstname
		if (isset($this->request->post['firstname_status'])) {
			$this->data['firstname_status'] = $this->request->post['firstname_status'];
		} else {
			$this->data['firstname_status'] = $this->config->get('firstname_status');
		}
		if (isset($this->request->post['firstname_required'])) {
			$this->data['firstname_required'] = $this->request->post['firstname_required'];
		} else {
			$this->data['firstname_required'] = $this->config->get('firstname_required');
		}
		
		
		$this->template = 'module/qv_ch.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/qv_ch')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>