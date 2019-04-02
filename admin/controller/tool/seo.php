<?php
class ControllerToolSeo extends Controller {
	private $error = array();

	public function index() {		
		$this->load->language('tool/seo');
		
		$this->document->setTitle($this->language->get('heading_title'));		

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_sub_title'),
			'href' => $this->url->link('tool/seo', 'user_token=' . $this->session->data['user_token'], true)
		);
		
		$data['action'] = $this->url->link('tool/seo/save', 'user_token=' . $this->session->data['user_token'], true);

		$data['user_token'] = $this->session->data['user_token'];

		$vars = array(
			'microdata_price_range',
			'microdata_address_locality',
			'microdata_postal_code',
			'microdata_street_address',
			'microdata_latitude',
			'microdata_longitude',
			'microdata_monday',
			'microdata_tuesday',
			'microdata_wednesday',
			'microdata_thursday',
			'microdata_friday',
			'microdata_saturday',
			'microdata_sunday',
			'microdata_microstatus'
		);
		
 		foreach($vars as $var){
			if (isset($this->request->post[$var])) {
				$data[$var] = $this->request->post[$var];
			} else {
				$data[$var] = $this->config->get($var);
			}
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('tool/seo', $data));
	}
	
	public function save() {
		$this->load->language('tool/seo');
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->load->model('setting/setting');			
			$this->model_setting_setting->editSetting('microdata', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
		}
		$this->response->redirect($this->url->link('tool/seo', 'user_token=' . $this->session->data['user_token'], true));
	}
	
	public function autokeyw() {
		$json = array();		
		if (isset($this->request->get['filter_keyw']) && isset($this->request->get['filter_lang'])) {
			$this->load->language('tool/seo');
			$this->load->model('tool/seo');
			if (isset($this->request->get['filter_keyw'])) {
				$filter_keyw = $this->request->get['filter_keyw'];
			} else {
				$filter_keyw = '';
			}			
			if (isset($this->request->get['filter_lang'])) {
				$filter_lang = $this->request->get['filter_lang'];
			} else {
				$filter_lang = $this->config->get('config_language_id');
			}			
			$filter_data = array(
				'filter_keyw'  => $filter_keyw,
				'filter_lang' => $filter_lang
			);
			
			$results = $this->model_tool_seo->getKeywords($filter_data);
			
			if ($results) {				
				$json['err'] = $this->language->get('text_match') . $results;				
			} else {
				$json['ok'] = $this->language->get('text_not_match');
			}
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}