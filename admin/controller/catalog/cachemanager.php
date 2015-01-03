<?php 
class ControllerCatalogCacheManager extends Controller {
	public function index(){
		$this->load->language('catalog/cachemanager');

		$this->document->setTitle($this->language->get('heading_title'));
				
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/cachemanager', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['delete'] = HTTPS_SERVER . 'index.php?route=catalog/cachemanager/delete&token=' . $this->session->data['token'];
		
		$this->data['deleteseo'] = HTTPS_SERVER . 'index.php?route=catalog/cachemanager/deleteSeo&token=' . $this->session->data['token'];
		
		$this->data['deletepro'] = HTTPS_SERVER . 'index.php?route=catalog/cachemanager/deletePro&token=' . $this->session->data['token'];
		
		$this->data['deletefil'] = HTTPS_SERVER . 'index.php?route=catalog/cachemanager/deleteFil&token=' . $this->session->data['token'];
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_expire'] = $this->language->get('column_expire');
		$this->data['column_action'] = $this->language->get('column_action');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_delseo'] = $this->language->get('button_delseo');
		$this->data['button_delpro'] = $this->language->get('button_delpro');
		$this->data['button_delfil'] = $this->language->get('button_delfil');
		
		$this->data['caches'] = array();
		$files = glob(DIR_CACHE . 'cache.*');
		foreach($files as $file){
			$data = explode('/', $file);
			if (strpos(end($data),'.') > 0){
				if (end($data) != 'index.html') {
					$time = substr(strrchr(end($data), '.'), 1);
					$this->data['caches'][] = array(
						'name' 		=> end($data),
						'time'		=> round(($time - time())/60),
						'selected'  => isset($this->request->post['selected']) && in_array(end($data), $this->request->post['selected']),
					);
				}
			}
		}
		
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		$this->template = 'catalog/cache_list.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render());
	}
	
	public function delete(){
		$this->load->language('catalog/cachemanager');

		$this->document->setTitle($this->language->get('heading_title'));
				
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $name) {
				$fullpath = DIR_CACHE . $name;
				if (file_exists($fullpath)){
					@unlink($fullpath);
				}
			}

			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect(HTTPS_SERVER . 'index.php?route=catalog/cachemanager&token=' . $this->session->data['token']);
		}

		$this->index();
	}
	
	public function deleteSeo(){
		$this->load->language('catalog/cachemanager');

		$this->document->setTitle($this->language->get('heading_title'));
				
		if ($this->validateDelete()) {
			
				if ($fullpath = glob(DIR_CACHE . 'sql/sqls*')) {
					foreach($fullpath as $full){
						$this->clear($full);
					}
				}
			
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect(HTTPS_SERVER . 'index.php?route=catalog/cachemanager&token=' . $this->session->data['token']);
		}

		$this->index();
	}
	
	public function deletePro(){
		$this->load->language('catalog/cachemanager');

		$this->document->setTitle($this->language->get('heading_title'));
				
		if ($this->validateDelete()) {
			
				if ($fullpath = glob(DIR_CACHE . 'pro/sqlp*')) {
					foreach($fullpath as $full){
						$this->clear($full);
					}
				}
			
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect(HTTPS_SERVER . 'index.php?route=catalog/cachemanager&token=' . $this->session->data['token']);
		}

		$this->index();
	}
	
	public function deleteFil(){
		$this->load->language('catalog/cachemanager');

		$this->document->setTitle($this->language->get('heading_title'));
				
		if ($this->validateDelete()) {
			
				if ($fullpath = glob(DIR_CACHE . 'fil/sqlf*')) {
					foreach($fullpath as $full){
						$this->clear($full);
					}
				}
			
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect(HTTPS_SERVER . 'index.php?route=catalog/cachemanager&token=' . $this->session->data['token']);
		}

		$this->index();
	}
	
	private function clear($full) {         
		if(file_exists($full)) {
			@unlink($full);						
		}
	}
	
	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/cachemanager')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
 
		if (!$this->error) {
			return TRUE; 
		} else {
			return FALSE;
		}
	}
}
?>