<?php  
class ControllerCommonHome extends Controller {
	public function index() {
	
		$this->load->model('catalog/home');
			
		$lang = $this->model_catalog_home->getLangcode($this->session->data['language']);
			
		$homearr = $this->model_catalog_home->getMainInfo($lang['language_id']);
		
		if ($homearr['main_title']) {		
			$this->document->setTitle($homearr['main_title']);		
		} else {
			$this->document->setTitle($this->config->get('config_title'));			
		}
		
		$this->document->setDescription($homearr['main_meta_desc']);
			
		$this->document->setKeywords($homearr['main_meta_keyw']);
			
		$this->data['home_descroption'] = strip_tags(html_entity_decode($homearr['main_desc'], ENT_QUOTES, 'UTF-8'));
			
		$this->data['heading_title'] = $homearr['main_h1'];		
		
		$this->document->addLink($this->url->link('common/home'), 'canonical');
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}
		
		if ($homearr['main_title']) {		
			$this->document->setOpengraph('og:title', $homearr['main_title']);		
		} else {
			$this->document->setOpengraph('og:title', $this->config->get('config_title'));			
		}
			
		$this->document->setOpengraph('og:type', 'website');
		
		$this->document->setOpengraph('og:url', $this->url->link('common/home'));
		
		$this->document->setOpengraph('og:description', str_replace("\"", "&quot;",utf8_substr(trim(strip_tags(html_entity_decode($homearr['main_desc'], ENT_QUOTES, 'UTF-8')), " \t\n\r"), 0, 300)));		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>