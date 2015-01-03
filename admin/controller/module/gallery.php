<?php
class ControllerModuleGallery extends Controller {
	private $error = array();

	public function index() {
		$this->load->model('catalog/gallery');
		$this->model_catalog_gallery->checkGalleries();
		$this->load->language('module/gallery');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('gallery', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		$this->getList();
	}

	public function insert() {
		$this->load->language('module/gallery');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('catalog/gallery');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
			$this->model_catalog_gallery->addGallery($this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('module/gallery', 'token=' . $this->session->data['token'], 'SSL'));
		}
		$this->getForm();
	}

	public function update() {
		$this->load->language('module/gallery');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('catalog/gallery');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())) {
			$this->model_catalog_gallery->editGallery($this->request->get['gallery_id'], $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('module/gallery', 'token=' . $this->session->data['token'], 'SSL'));
		}
		$this->getForm();
	}

	public function delete() {
		$this->load->language('module/gallery');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('catalog/gallery');
		if ((isset($this->request->post['selected'])) && ($this->validateDelete())) {
			foreach ($this->request->post['selected'] as $gallery_id) {
				$this->model_catalog_gallery->deleteGallery($gallery_id);
			}
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('module/gallery', 'token=' . $this->session->data['token'], 'SSL'));
		}
		$this->getList();
	}

	private function getList() {
		$this->load->language('module/gallery');
		$this->load->model('catalog/gallery');
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_left'] = $this->language->get('text_left');
		$this->data['text_right'] = $this->language->get('text_right');
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['column_title'] = $this->language->get('column_title');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_gallery_thumb'] = $this->language->get('entry_gallery_thumb');
		$this->data['entry_gallery_popup'] = $this->language->get('entry_gallery_popup');
		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_data'] = $this->language->get('tab_data');
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
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/gallery', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		$this->data['action'] = $this->url->link('module/gallery', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['insert'] = $this->url->link('module/gallery/insert', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['delete'] = $this->url->link('module/gallery/delete', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['galleries'] = array();
		$gallery_total = $this->model_catalog_gallery->getTotalGalleries();
		$results = $this->model_catalog_gallery->getGalleries(0);
		foreach ($results as $result) {
			$action = array();
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('module/gallery/update&gallery_id=' . $result['gallery_id'] . '&token=' . $this->session->data['token'])
			);
			$this->data['galleries'][] = array(
				'gallery_id' => $result['gallery_id'],
				'name'       => $result['name'],
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'sort_order' => $result['sort_order'],
				'selected'   => isset($this->request->post['selected']) && in_array($result['gallery_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}
		/*if (isset($this->request->post['gallery_position'])) {
			$this->data['gallery_position'] = $this->request->post['gallery_position'];
		} else {
			$this->data['gallery_position'] = $this->config->get('gallery_position');
		}*/
		if (isset($this->request->post['gallery_status'])) {
			$this->data['gallery_status'] = $this->request->post['gallery_status'];
		} else {
			$this->data['gallery_status'] = $this->config->get('gallery_status');
		}
		/*if (isset($this->request->post['gallery_sort_order'])) {
			$this->data['gallery_sort_order'] = $this->request->post['gallery_sort_order'];
		} else {
			$this->data['gallery_sort_order'] = $this->config->get('gallery_sort_order');
		}*/
		if (isset($this->request->post['config_gallery_thumb_width'])) {
			$this->data['config_gallery_thumb_width'] = $this->request->post['config_gallery_thumb_width'];
		} elseif ($this->config->get('config_gallery_thumb_width')) {
			$this->data['config_gallery_thumb_width'] = $this->config->get('config_gallery_thumb_width');
		} else {
			$this->data['config_gallery_thumb_width'] = 100;
		}
		if (isset($this->request->post['config_gallery_thumb_height'])) {
			$this->data['config_gallery_thumb_height'] = $this->request->post['config_gallery_thumb_height'];
		} elseif ($this->config->get('config_gallery_thumb_height')) {
			$this->data['config_gallery_thumb_height'] = $this->config->get('config_gallery_thumb_height');
		} else {
			$this->data['config_gallery_thumb_height'] = 100;
		}
		if (isset($this->request->post['config_gallery_popup_width'])) {
			$this->data['config_gallery_popup_width'] = $this->request->post['config_gallery_popup_width'];
		} elseif ($this->config->get('config_gallery_popup_width')) {
			$this->data['config_gallery_popup_width'] = $this->config->get('config_gallery_popup_width');
		} else {
			$this->data['config_gallery_popup_width'] = 400;
		}
		if (isset($this->request->post['config_gallery_popup_height'])) {
			$this->data['config_gallery_popup_height'] = $this->request->post['config_gallery_popup_height'];
		} elseif ($this->config->get('config_gallery_popup_height')) {
			$this->data['config_gallery_popup_height'] = $this->config->get('config_gallery_popup_height');
		} else {
			$this->data['config_gallery_popup_height'] = 400;
		}
		if (isset($this->request->post['config_gallery_limit'])) {
			$this->data['config_gallery_limit'] = $this->request->post['config_gallery_limit'];
		} elseif ($this->config->get('config_gallery_limit')) {
			$this->data['config_gallery_limit'] = $this->config->get('config_gallery_limit');
		} else {
			$this->data['config_gallery_limit'] = 20;
		}
		$this->template = 'module/gallery.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
	}

	private function getForm() {
		$this->load->language('module/gallery');
		$this->load->model('catalog/gallery');
		$this->data['lang'] = $this->language->get('code');
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_none'] = $this->language->get('text_none');
		//$this->data['text_upload'] = $this->language->get('text_upload');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_album'] = $this->language->get('entry_album');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_image_title'] = $this->language->get('entry_image_title');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_image'] = $this->language->get('button_add_image');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_image'] = $this->language->get('tab_image');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
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
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/gallery', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		if (isset($this->request->get['gallery_id'])) {
			$this->data['action'] = $this->url->link('module/gallery/update&gallery_id=' . $this->request->get['gallery_id'] . '&token=' . $this->session->data['token']);
			$this->data['gallery_id'] = (int)$this->request->get['gallery_id'];
		} else {
			$this->data['action'] = $this->url->link('module/gallery/insert&token=' . $this->session->data['token']);
			$this->data['gallery_id'] = 0;
		}
		$this->data['cancel'] = $this->url->link('module/gallery&token=' . $this->session->data['token']);
		if ((isset($this->request->get['gallery_id'])) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$gallery_info = $this->model_catalog_gallery->getGallery($this->request->get['gallery_id']);
		}
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		if (isset($this->request->post['gallery_description'])) {
			$this->data['gallery_description'] = $this->request->post['gallery_description'];
		} elseif (isset($this->request->get['gallery_id'])) {
			$this->data['gallery_description'] = $this->model_catalog_gallery->getGalleryDescriptions($this->request->get['gallery_id']);
		} else {
			$this->data['gallery_description'] = array();
		}
		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (isset($gallery_info)) {
			$this->data['keyword'] = $gallery_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}
		$this->data['galleries'] = $this->model_catalog_gallery->getGalleries(0);
		if (isset($this->request->post['album_id'])) {
			$this->data['album_id'] = $this->request->post['album_id'];
		} elseif (isset($gallery_info)) {
			$this->data['album_id'] = $gallery_info['album_id'];
		} else {
			$this->data['album_id'] = '';
		}
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (isset($gallery_info)) {
			$this->data['status'] = $gallery_info['status'];
		} else {
			$this->data['status'] = '';
		}
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($gallery_info)) {
			$this->data['sort_order'] = $gallery_info['sort_order'];
		} else {
			$this->data['sort_order'] = '';
		}
		
		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (isset($gallery_info)) {
			$this->data['image'] = $gallery_info['image'];
		} else {
			$this->data['image'] = '';
		}
		$this->load->model('tool/image');
		if (isset($gallery_info) && $gallery_info['image'] && file_exists(DIR_IMAGE . $gallery_info['image'])) {
			$this->data['preview'] = $this->model_tool_image->resize($gallery_info['image'], 100, 100);
		} else {
			$this->data['preview'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		$this->data['gallery_images'] = array();
		if (isset($gallery_info)) {
			$results = $this->model_catalog_gallery->getGalleryImages($this->request->get['gallery_id']);
			foreach ($results as $result) {
				if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['gallery_images'][] = array(
						'preview' => $this->model_tool_image->resize($result['image'], 100, 100),
						'file'    => $result['image'],
						'title'   => $result['image_title']
					);
				} else {
					$this->data['gallery_images'][] = array(
						'preview' => $this->model_tool_image->resize('no_image.jpg', 100, 100),
						'file'    => $result['image'],
						'title'   => $result['image_title']
					);
				}
			}
		}
		$this->data['token'] = $this->session->data['token'];
		$this->template = 'module/gallery/form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/gallery')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'module/gallery')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		foreach ($this->request->post['gallery_description'] as $language_id => $value) {
			if (trim($value['name']) == '') {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'module/gallery')) {
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