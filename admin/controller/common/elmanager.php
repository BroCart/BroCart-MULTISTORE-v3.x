<?php
class ControllerCommonElmanager extends Controller {
	private $error = array();
	
	public function index() {				
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = HTTPS_SERVER;
		} else {
			$this->data['base'] = HTTP_SERVER;
		}
			
		$this->data['token'] = $this->session->data['token'];
			
		$this->template = 'common/elmanager.tpl';
		
		$this->response->setOutput($this->render());
	}	
} 
?>