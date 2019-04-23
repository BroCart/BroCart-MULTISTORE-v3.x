<?php
/**********************************************************/
/*	@copyright	OCappLab 2019.							  */
/*	@license	LICENSE.md								  */
/**********************************************************/

class ControllerExtensionModuleOClabManufacturer extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/oclab_manufacturer');
		
		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');
		
		$data['header_title'] = isset($setting['module_description'][$this->config->get('config_language_id')]['title']) && $setting['module_description'][$this->config->get('config_language_id')]['title'] ? $setting['module_description'][$this->config->get('config_language_id')]['title'] : $this->language->get('header_title');
		
		$data['manufacturers'] = [];
		$data['alphabets'] = [];
		$data['display_view'] = $setting['display_view'] ? $setting['display_view'] : 1;
		
		if (isset($this->request->get['manufacturer_id'])) {
			$data['manufacturer_id'] = (int)$this->request->get['manufacturer_id'];
		} else {
			$data['manufacturer_id'] = 0;
		}
		
		$results = $this->model_catalog_manufacturer->getManufacturers();
		
		if ($results) {
			foreach ($results as $result) {
				if ($data['display_view'] == 3) {
					if (is_numeric(utf8_substr($result['name'], 0, 1))) {
						$key = '0 - 9';
					} else {
						$key = utf8_substr(utf8_strtoupper($result['name']), 0, 1);
					}
		
					if (!isset($data['alphabets'][$key])) {
						$data['alphabets'][$key] = [
							'name' => $key,
							'href' => $this->url->link('product/manufacturer','',true).'#' . $key
						];
					}
				}
				
				$data['manufacturers'][] = [
					'manufacturer_id' => $result['manufacturer_id'],
					'name' => $result['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'], true)
				];
			}
		}
		
		return $this->load->view('extension/module/oclab_manufacturer', $data);
	}
}