<?php
class ControllerExtensionDashboardMap extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/dashboard/map');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('dashboard_map', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=dashboard', true));
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=dashboard', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/dashboard/map', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['action'] = $this->url->link('extension/dashboard/map', 'user_token=' . $this->session->data['user_token'], true);

		$data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=dashboard', true);
		
		$data['jsmaps'] = array();
		$jsmaps = glob(DIR_APPLICATION . 'view/javascript/jquery/jqvmap/maps/*.js');
		
		foreach ($jsmaps as $jsmap) {
			$inf = pathinfo($jsmap);
			$name = $inf['filename'];	
			$data['jsmaps'][] = $name;
		}
	
		if (isset($this->request->post['dashboard_map_js'])) {
			$data['dashboard_map_js'] = $this->request->post['dashboard_map_js'];
		} else if ($this->config->get('dashboard_map_js')) {
			$data['dashboard_map_js'] = $this->config->get('dashboard_map_js');
		} else {
			$data['dashboard_map_js'] = 'jquery.vmap.russia';
		}
		
		if (isset($this->request->post['dashboard_map_regions'])) {
			$data['dashboard_map_regions'] = $this->request->post['dashboard_map_regions'];
		} else {
			$data['dashboard_map_regions'] = $this->config->get('dashboard_map_regions');
		}

		if (isset($this->request->post['dashboard_map_width'])) {
			$data['dashboard_map_width'] = $this->request->post['dashboard_map_width'];
		} else {
			$data['dashboard_map_width'] = $this->config->get('dashboard_map_width');
		}

		$data['columns'] = array();
		
		for ($i = 3; $i <= 12; $i++) {
			$data['columns'][] = $i;
		}
		
		if (isset($this->request->post['dashboard_map_status'])) {
			$data['dashboard_map_status'] = $this->request->post['dashboard_map_status'];
		} else {
			$data['dashboard_map_status'] = $this->config->get('dashboard_map_status');
		}

		if (isset($this->request->post['dashboard_map_sort_order'])) {
			$data['dashboard_map_sort_order'] = $this->request->post['dashboard_map_sort_order'];
		} else {
			$data['dashboard_map_sort_order'] = $this->config->get('dashboard_map_sort_order');
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/dashboard/map_form', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/dashboard/map')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
		
	public function dashboard() {
		$this->load->language('extension/dashboard/map');

		$data['user_token'] = $this->session->data['user_token'];
		
		if ($this->config->get('dashboard_map_js') == 'jquery.vmap.russia') {
			$data['map_location'] = 'russia_en';
		} else if ($this->config->get('dashboard_map_js') == 'jquery.vmap.ukraine') {
			$data['map_location'] = 'ukraine_ua';
		} else if ($this->config->get('dashboard_map_js') == 'jquery.vmap.germany') {
			$data['map_location'] = 'germany_en';
		} else if ($this->config->get('dashboard_map_js') == 'jquery.vmap.europe') {
			$data['map_location'] = 'europe_en';
		} else if ($this->config->get('dashboard_map_js') == 'jquery.vmap.usa') {
			$data['map_location'] = 'usa_en';
		} else if ($this->config->get('dashboard_map_js') == 'jquery.vmap.asia') {
			$data['map_location'] = 'asia_en';
		} else if ($this->config->get('dashboard_map_js') == 'jquery.vmap.australia') {
			$data['map_location'] = 'australia_en';
		} else if ($this->config->get('dashboard_map_js') == 'jquery.vmap.usa.counties') {
			$data['map_location'] = 'usa_counties_en';
		} else if ($this->config->get('dashboard_map_js') == 'jquery.vmap.usa.districts') {
			$data['map_location'] = 'usa_districts_en';
		} else {
			$data['map_location'] = 'world_en';
		}
	
		if ($this->config->get('dashboard_map_js')) {
			$data['dashboard_map_js'] = $this->config->get('dashboard_map_js');
		} else {
			$data['dashboard_map_js'] = 'jquery.vmap.russia';
		}
		
		if ($this->config->get('dashboard_map_regions')) {
			$data['map_regions'] = true;
		} else {
			$data['map_regions'] = false;
		}
		
		$this->load->model('extension/dashboard/map');
		$regions = $this->model_extension_dashboard_map->getRegionsByOrders();
		$data['region'] = array();
		foreach ($regions as $region) {
			$data['region'][] = array(
				'code'		=> $region['regcode'],
				'color'		=> $region['color'] ? $region['color'] : '#0000ff'
			);
		}
		
		return $this->load->view('extension/dashboard/map_info', $data);
	}

	public function map() {
		$json = array();

		$this->load->model('extension/dashboard/map');

		$results = $this->model_extension_dashboard_map->getTotalOrdersByCountry();

		foreach ($results as $result) {
			$json[strtolower($result['iso_code_2'])] = array(
				'total'  => $result['total'],
				'amount' => $this->currency->format($result['amount'], $this->config->get('config_currency'))
			);
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
