<?php
class ControllerCatalogLables extends Controller {
	private $error = array();

  	public function index() {
		$this->load->language('catalog/lables');

		$this->document->setTitle($this->language->get('heading_title')); 

		$this->load->model('catalog/lables');

		$this->getList();
  	}

  	public function insert() {
    	$this->load->language('catalog/lables');

    	$this->document->setTitle($this->language->get('heading_title')); 

		$this->load->model('catalog/lables');

    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_lables->addLables($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$this->redirect($this->url->link('catalog/lables', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    	}

    	$this->getForm();
  	}

  	public function update() {
    	$this->load->language('catalog/lables');

    	$this->document->setTitle($this->language->get('heading_title')); 

		$this->load->model('catalog/lables');

    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_lables->editLables($this->request->get['lable_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->redirect($this->url->link('catalog/lables', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getForm();
  	}

  	public function delete() {
    	$this->load->language('catalog/lables');

    	$this->document->setTitle($this->language->get('heading_title')); 

		$this->load->model('catalog/lables');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $lable_id) {
				$this->model_catalog_lables->deleteLables($lable_id);
	  		}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$this->redirect($this->url->link('catalog/lables', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

    	$this->getList();
  	}

  	private function getList() {
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'pt.stick_text';
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('catalog/lables', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);

		$this->data['insert'] = $this->url->link('catalog/lables/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/lables/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['lables'] = array();

		$data = array(
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'           => $this->config->get('config_admin_limit')
		);

		$this->load->model('tool/image');

		$lables_total = $this->model_catalog_lables->getTotalLables($data);

		$results = $this->model_catalog_lables->getLables($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/lables/update', 'token=' . $this->session->data['token'] . '&lable_id=' . $result['lable_id'] . $url, 'SSL')
			);

			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 50, 50);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 50, 50);
			}
			
			$this->data['lables'][] = array(
				'lable_id' 	=> $result['lable_id'],
				'stick_text'    	=> $result['stick_text'],
				'stick_main'  		=> $result['stick_main'],
				'sort_order'    	=> $result['sort_order'],
				'image'      		=> $image,
               	'selected'   		=> isset($this->request->post['selected']) && in_array($result['lable_id'], $this->request->post['selected']),
				'action'     		=> $action
			);
    	}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');

		$this->data['column_image'] = $this->language->get('column_image');
		$this->data['column_image_position'] = $this->language->get('column_image_position');
		$this->data['column_stick_text'] = $this->language->get('column_stick_text');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_filter'] = $this->language->get('button_filter');
	
 		$this->data['token'] = $this->session->data['token'];

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		if (isset($this->request->get['filter_stick_text'])) {
			$filter_stick_text = $this->request->get['filter_stick_text'];
		} else {
			$filter_stick_text = '';
		}


		if (isset($this->request->get['filter_sort_order'])) {
			$filter_sort_order = $this->request->get['filter_sort_order'];
		} else {
			$filter_sort_order = '';
		}

		$url = '';

		if (isset($this->request->get['filter_stick_text'])) {
			$url .= '&filter_stick_text=' . $this->request->get['filter_stick_text'];
		}
		

		if (isset($this->request->get['filter_sort_order'])) {
			$url .= '&filter_sort_order=' . $this->request->get['filter_sort_order'];
		} 

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_stick_text'] = $this->url->link('catalog/lables', 'token=' . $this->session->data['token'] . '&sort=pt.stick_text' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('catalog/lables', 'token=' . $this->session->data['token'] . '&sort=pt.sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
		
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $lables_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/lables', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['filter_stick_text'] = $filter_stick_text;
			
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/lables_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}

  	private function getForm() {
    	$this->data['heading_title'] = $this->language->get('heading_title');

    	$this->data['text_enabled'] = $this->language->get('text_enabled');
    	$this->data['text_disabled'] = $this->language->get('text_disabled');
    	$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
	
		$this->data['entry_stick_text'] = $this->language->get('entry_stick_text');
		$this->data['entry_image'] = $this->language->get('entry_image');
     	$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
    	$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_remove'] = $this->language->get('button_remove');
    	$this->data['button_cancel'] = $this->language->get('button_cancel');
		
    	$this->data['tab_general'] = $this->language->get('tab_general');
    	
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['stick_text'])) {
			$this->data['error_stick_text'] = $this->error['stick_text'];
		} else {
			$this->data['error_stick_text'] = '';
		}
		

   		if (isset($this->error['sort_order'])) {
			$this->data['error_sort_order'] = $this->error['sort_order'];
		} else {
			$this->data['error_sort_order'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_stick_text'])) {
			$url .= '&filter_stick_text=' . $this->request->get['filter_stick_text'];
		}


		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
			'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('catalog/lables', 'token=' . $this->session->data['token'] . $url, 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);

		if (!isset($this->request->get['lable_id'])) {
			$this->data['action'] = $this->url->link('catalog/lables/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/lables/update', 'token=' . $this->session->data['token'] . '&lable_id=' . $this->request->get['lable_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('catalog/lables', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->get['lable_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$lables_info = $this->model_catalog_lables->getLablesAll($this->request->get['lable_id']);
    	}
		
		if (isset($this->request->post['stick_text'])) {
      		$this->data['stick_text'] = $this->request->post['stick_text'];
    	} elseif (isset($lables_info)) {
			$this->data['stick_text'] = $this->model_catalog_lables->getStickerText($this->request->get['lable_id']);	
		} else {
			$this->data['stick_text'] = array();
		}
				
		if (isset($this->request->post['sort_order'])) {
      		$this->data['sort_order'] = $this->request->post['sort_order'];
    	} elseif (isset($lables_info)) {
			$this->data['sort_order'] = $lables_info['sort_order'];
		} else {	
      		$this->data['sort_order'] = '';
    	}

		$this->load->model('tool/image');
		if (isset($this->request->get['lable_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
		$this->data['thumb'] = array();
		
		$sccobi = $this->model_catalog_lables->getStickerText($this->request->get['lable_id']);
	
		foreach ($sccobi as $key => $value) {
		if (isset($value['image']) && $value['image'] && file_exists(DIR_IMAGE . $value['image'])) {	
			$this->data['thumb'][$key] = $this->model_tool_image->resize($value['image'], 100, 100);
		} else {
			$this->data['thumb'][$key] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}	
			
		}
		} else {
			$lang_arr = $this->model_localisation_language->getLanguages();
			foreach ($lang_arr as $lang) {
				$this->data['thumb'][$lang['language_id']] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
			}
		}
				
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		$this->template = 'catalog/lables_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
  	}

  	private function validateForm() {
    	if (!$this->user->hasPermission('modify', 'catalog/lables')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

    	/* if ((strlen(utf8_decode($this->request->post['stick_text'])) < 1) || (strlen(utf8_decode($this->request->post['stick_text'])) > 64)) {
      		$this->error['stick_text'] = $this->language->get('error_stick_text');
    	} */

    	if (!$this->error) {
			return true;
    	} else {
			if (!isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_required_data');
			}
      		return false;
    	}
  	}

  	private function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'catalog/lables')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}
		
		$this->load->model('catalog/lables');

		foreach ($this->request->post['selected'] as $lables_id) {
  			/* $stickers_top_right = $this->model_catalog_stickers->getTotalProductsBystickersTopRightId($stickers_id);
			$stickers_top_left = $this->model_catalog_stickers->getTotalProductsBystickersTopLeftId($stickers_id);
			$stickers_bottom_right = $this->model_catalog_stickers->getTotalProductsBystickersBottomRightId($stickers_id);
			$stickers_bottom_left = $this->model_catalog_stickers->getTotalProductsBystickersBottomLeftId($stickers_id);
			
			if ($stickers_top_right) {
	  			$this->error['warning'] = sprintf($this->language->get('error_stickers'), $stickers_top_right);	
			}

			if ($stickers_top_left) {
	  			$this->error['warning'] = sprintf($this->language->get('error_stickers'), $stickers_top_left);	
			}	
			
			if ($stickers_bottom_right) {
	  			$this->error['warning'] = sprintf($this->language->get('error_stickers'), $stickers_bottom_right);	
			}	
			
			if ($stickers_bottom_left) {
	  			$this->error['warning'] = sprintf($this->language->get('error_stickers'), $stickers_bottom_left);	
			} */	
	  	} 
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}

}
?>