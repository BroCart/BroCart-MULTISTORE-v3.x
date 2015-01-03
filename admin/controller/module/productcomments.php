<?php

class ControllerModuleProductComments extends Controller {
	private $name = 'productcomments';
	
	private $settings = Array(
		"pcconf_perpage" => '',
		"pcconf_email" => '',
		"pcconf_maxlen" => 500,
		"pcconf_enforce_customer_data" => 0,
		"pcconf_allow_guests" => 0,
		"pcconf_enable_customer_captcha" => 0
	);
	
	private $error = array(); 
	
	public function __construct($registry) {
		parent::__construct($registry);
		$this->registry = $registry;
		$this->data = array_merge($this->data, $this->load->language('module/productcomments'));
		$this->data['token'] = $this->session->data['token'];
		$this->load->model("module/productcomments");
		$this->document->setTitle($this->language->get('heading_title'));
	}	
	
	private function editSettings() {
		$this->load->model("setting/setting");
		
		$set = $this->model_setting_setting->getSetting($this->name);
		
		foreach ($this->settings as $name=>$value) {
			if (!array_key_exists($name,$set)) {
				$set[$name] = $value;
			}
		}
		
		foreach($set as $s=>$v) {
			if (isset($this->request->post[$s])) {
				$set[$s] = $this->request->post[$s];
				$this->data[$s] = $this->request->post[$s];
			} elseif ($this->config->get($s)) {
				$this->data[$s] = $this->config->get($s);
			}
		}
		
		$this->model_setting_setting->editSetting($this->name, $set);
	}

	private function setBreadcrumbs() {
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
			'href'      => $this->url->link("module/{$this->name}", 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);		
	}
	
	public function install() {
		$this->load->model('setting/setting');
		$this->model_module_productcomments->createTable();
		$this->model_setting_setting->editSetting($this->name, $this->settings);
	}

	public function uninstall() {
		$this->model_module_productcomments->dropTable();
	}
	
	public function saveSettings() {
		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
	        $this->editSettings();
	        $this->session->data['success'] = $this->language->get('pc_success');
		} else {
			$json['errors'][] = $this->language->get('error_permission');
		}
		
		if (strcmp(VERSION,'1.5.1.3') >= 0) {
			$this->response->setOutput(json_encode($json));
		} else {
			$this->load->library('json');
			$this->response->setOutput(Json::encode($json));			
		}			
	}
	
	public function index() {
		$this->load->model('setting/setting');
		
		foreach($this->settings as $s=>$v) {
			$this->data[$s] = $this->config->get($s);
		}
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->setBreadcrumbs();
				
        $this->data['action'] = $this->url->link("module/{$this->name}", 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
        if (isset($this->session->data['success'])) {
                $this->data['success'] = $this->session->data['success'];
                $this->session->data['success'] = '';
        } else {
                $this->data['success'] = '';
        }		
		
		$page = (isset($this->request->get['page'])) ? $this->request->get['page'] : 1;
		$total_comments = $this->model_module_productcomments->getTotalComments();
		
		$sort = array(
			'order_by' => 'pc.create_time',
			'order_way' => 'DESC',
			'offset' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')			
		);
		
		$this->data['pcComments'] = $this->model_module_productcomments->getComments(array(), $sort);
		
		$pagination = new Pagination();
		$pagination->total = $total_comments;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('module/productcomments', 'token=' . $this->session->data['token'] . '&page={page}', 'SSL');
		$this->data['pagination'] = $pagination->render();	
		
		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->template = "module/{$this->name}.tpl";
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		$this->response->setOutput($this->render());		
		//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}		

	public function editComment() {
		$this->model_module_productcomments->editComment($this->request->post);
	}
	 
	public function deleteComment() {
		$this->model_module_productcomments->deleteComment($this->request->get['comment_id']);
	}	
}
?>
