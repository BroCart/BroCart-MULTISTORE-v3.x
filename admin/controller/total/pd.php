<?php
class ControllerTotalPD extends Controller {
	private $error = array(); 
	 
	public function index() {
		
		$this->load->language('total/pd');

		$this->document->setTitle($this->language->get('heading_title'));
				
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('pd', $this->request->post);
		
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_none'] = $this->language->get('text_none');
		
		$this->data['entry_type'] = $this->language->get('entry_type');
		$this->data['text_percent'] = $this->language->get('text_percent');
    	$this->data['text_amount'] = $this->language->get('text_amount');
		
		$this->data['entry_fix'] = $this->language->get('entry_fix');
		$this->data['entry_method'] = $this->language->get('entry_method');
		$this->data['entry_charge'] = $this->language->get('entry_charge');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
					
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

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
       		'text'      => $this->language->get('text_total'),
			'href'      => $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('total/pd', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('total/pd', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['pd_method'])) {
			$this->data['pd_method'] = $this->request->post['pd_method'];
		} else {
			$this->data['pd_method'] = $this->config->get('pd_method');
		}

		if (isset($this->request->post['pd_charge'])) {
			$this->data['pd_charge'] = $this->request->post['pd_charge'];
		} else {
			$this->data['pd_charge'] = $this->config->get('pd_charge');
		}
		
		if (isset($this->request->post['pd_type'])) {
      		$this->data['pd_type'] = $this->request->post['pd_type'];    	
		} else {
      		$this->data['pd_type'] = $this->config->get('pd_type');
    	}
		
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		foreach ($languages as $language) { $description = 'pd_description_' . $language['language_id'];
			if (isset($this->request->post[$description])) {
				$this->data[$description] = $this->request->post[$description];
			} else {
				$this->data[$description] = $this->config->get($description);
			}
		}
		$this->data['languages'] = $languages;
		
		if (isset($this->request->post['pd_status'])) {
			$this->data['pd_status'] = $this->request->post['pd_status'];
		} else {
			$this->data['pd_status'] = $this->config->get('pd_status');
		}

		if (isset($this->request->post['pd_sort_order'])) {
			$this->data['pd_sort_order'] = $this->request->post['pd_sort_order'];
		} else {
			$this->data['pd_sort_order'] = $this->config->get('pd_sort_order');
		}
		
		$this->load->model('setting/extension');
		$payments = $this->model_setting_extension->getInstalled('payment');
		$payments_files = glob(DIR_APPLICATION . 'controller/payment/*.php');
		
		if ($payments_files) {
			foreach ($payments_files as $file) {
				$payment = basename($file, '.php');
				$this->load->language('payment/' . $payment);
				if (in_array($payment, $payments)) {
					$this->data['payments'][] = array(
						'hname' => $this->language->get('heading_title'),
						'fname' => $payment
					);
				}
			}
		}
		
		$this->template = 'total/pd.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'total/pd')) {
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