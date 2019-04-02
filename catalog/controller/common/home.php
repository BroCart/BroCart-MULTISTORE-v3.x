<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$code = $this->config->get('config_language_id');		
		$this->document->setTitle($this->config->get('config_meta_title_' . $code));
		$this->document->setDescription($this->config->get('config_meta_description_' . $code));
		$this->document->setKeywords($this->config->get('config_meta_keyword_' . $code));
		$this->document->setOpengraph('og:description', $this->config->get('config_meta_description_' . $code));
		$logos = $this->config->get('config_logo');
		if (is_array($logos)) {				
			if (is_file(DIR_IMAGE . $logos[$code])) {
				$this->document->setOgImage(HTTP_SERVER . 'image/' . $logos[$code]);
			}
		}
		if (isset($this->request->get['route'])) {
			$this->document->addCanonical($this->url->link('common/home', '', true));
		}
		
		$langs = $this->cache->get('catalog.seolang');		
		if ($langs && count($langs) > 1) {
			foreach ($langs as $longer) {
				$this->document->addHreflang($this->url->link('common/home', '', $this->request->server['HTTPS'], $longer['code']), $longer['code']);					
			}
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
