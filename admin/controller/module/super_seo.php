<?php
class ControllerModuleSuperSeo extends Controller {
	private $error = array();
	public function index() {
		$this->load->language('module/super_seo');
		$this->document->setTitle($this->language->get('sseo_heading_title'));
		$this->load->model('setting/setting');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('sseo', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('sseo_success_text');
			$description_route = trim($this->request->post['route']);
			$description_url = trim($this->request->post['url']);	
			$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` SET 
				`query` = '" .  $this->db->escape($description_route) . "', 
				`keyword` = '" . $this->db->escape($description_url) . "',
				`seo_mod` = 1");
			$this->redirect($this->url->link('module/super_seo', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->session->data['error'])) {
			$this->data['error'] = $this->session->data['error'];
		
			unset($this->session->data['error']);
		} else {
			$this->data['error'] = '';
		}
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
				'text'      => $this->language->get('sseo_heading_title'),
		'href'      => $this->url->link('module/ultimate_seo', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
		);

		$this->data['button_save'] = $this->language->get('sseo_save');
		$this->data['button_cancel'] = $this->language->get('sseo_cancel');
		$this->data['button_delete'] = $this->language->get('sseo_delete');

		$this->data['codeinspires_url'] = $this->url->link('module/super_seo/support_page', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['codeinspires'] = $this->config->get('codeinspires');

		/*if (isset($this->request->post['useo_meta_num'])) {
			$this->data['useo_meta_num'] = $this->request->post['useo_meta_num'];
		} else {
			$this->data['useo_meta_num'] = $this->config->get('useo_meta_num');
		}

		if (isset($this->request->post['useo_auto_meta'])) {
			$this->data['useo_auto_meta'] = $this->request->post['useo_auto_meta'];
		} else {
			$this->data['useo_auto_meta'] = $this->config->get('useo_auto_meta');
		}
		if ($this->data['useo_auto_meta'] == 'yes') $this->data['useo_auto_meta'] = 'checked';
		else $this->data['useo_auto_meta'] = '';
*/
		$this->data['action'] = $this->url->link('module/super_seo', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['description'] = $this->language->get('sseo_description');
		$this->data['description_route'] = $this->language->get('sseo_description_route');
		$this->data['description_url'] = $this->language->get('sseo_description_url');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['heading_title'] = $this->language->get('sseo_heading_title');
		/*
		$this->data['entry_meta_num'] = $this->language->get('useo_entry_meta_num');
		$this->data['entry_meta_num_description'] = $this->language->get('useo_entry_meta_num_description');
		$this->data['entry_auto_meta'] = $this->language->get('useo_entry_auto_meta');
		$this->data['entry_auto_meta_description'] = $this->language->get('useo_entry_auto_meta_description');
*/
		$this->data['modules'] = array();
		
		if (isset($this->request->post['sseo_module'])) {
			$this->data['modules'] = $this->request->post['sseo_module'];
		} elseif ($this->config->get('sseo_module')) { 
			$this->data['modules'] = $this->config->get('sseo_module');
		}

		$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."url_alias WHERE seo_mod LIKE '1'");
		$this->data['super_seo_urls'] = array();
		foreach ($query->rows as $row) {
			$qr = explode('route=',$row['query']);
			if (isset($qr[1]) ) $qr = $qr[1];
			else $qr = $qr[0];
			$url = '&id='.$row['url_alias_id'];
			$url = $this->url->link('module/super_seo/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
			array_push($this->data['super_seo_urls'],array('query' => $qr, 'keyword' => $row['keyword'], 'delete' => $url ) );
		}

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('design/banner');
		
		$this->data['banners'] = $this->model_design_banner->getBanners();
						
		$this->template = 'module/super_seo.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());

	}

	public function delete() {
	$this->load->language('module/super_seo');
		if (!$this->user->hasPermission('modify', 'module/super_seo')) {
			$this->session->data['error'] = $this->language->get('sseo_no_permission');
			$this->redirect($this->url->link('module/super_seo', 'token=' . $this->session->data['token'], 'SSL'));
		}	
		$id = $this->request->get['id'];
		$query = $this->db->query("DELETE FROM ". DB_PREFIX ."url_alias WHERE url_alias_id = '". (int)$id ."'");
		if ($query)
			$this->session->data['success'] = $this->language->get('sseo_success_delete');
		$this->redirect($this->url->link('module/super_seo', 'token=' . $this->session->data['token'], 'SSL'));
	}

	private function validate() {
		if (isset($this->request->post['route'])) 
			$description_route = trim($this->request->post['route']);
		else $description_route = null;
		if (isset($this->request->post['url'])) 
			$description_url = trim($this->request->post['url']);
		else $description_url = null;

		if (!$this->user->hasPermission('modify', 'module/super_seo')) {
			$this->error['warning'] = $this->language->get('sseo_no_permission');
		}
		else if (empty($description_route) || empty($description_url) ){
			$this->error['warning'] = $this->language->get('sseo_specify');;
		}
		else {
			$query = $this->db->query("SELECT * FROM ".DB_PREFIX."url_alias WHERE query = 'route=".$this->db->escape($description_route)."'");
			if($query->num_rows) {
				$this->error['warning'] = $this->language->get('sseo_same_route');
			}
			$query = $this->db->query("SELECT * FROM ".DB_PREFIX."url_alias WHERE query = 'keyword=".$this->db->escape($description_url)."'");
			if($query->num_rows) {
				$this->error['warning'] = $this->language->get('sseo_same_keyword');
			}
		}
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}

	public function support_page () {
		$this->load->language('module/super_seo');
		if (!$this->user->hasPermission('modify', 'module/super_seo')) {
			$this->session->data['error'] = $this->language->get('sseo_no_permission');
		}
		else {
			$codeinspires = $this->config->get('codeinspires');
			if (isset($codeinspires) && $codeinspires == 1) {
				$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value`='0' WHERE `key`='codeinspires'");
			}
			else if (isset($codeinspires) && $codeinspires == 0) {
				$this->db->query("UPDATE " . DB_PREFIX . "setting SET `value`='1' WHERE `key`='codeinspires'");
			}
		}
		$this->redirect($this->url->link('module/super_seo', 'token=' . $this->session->data['token'], 'SSL'));
	}	

	public function install() {
		$this->db->query("DELETE FROM ". DB_PREFIX . "setting WHERE `key`='codeinspires'");
		$this->db->query("INSERT INTO ". DB_PREFIX . "setting VALUES (NULL,'". (int)$this->config->get('store_admin') ."','codeinspires','codeinspires','1','0')");
	}

	public function uninstall() {

	}

}
?>
