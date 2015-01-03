<?php
/**
 * Database Language Editor
 * SQL-based Language Editor for Opencart
 * 
 * v2.0.1 FREE
 **/
class ControllerModuleTranslate extends Controller {
	private $error = array();
	
	public function index() {
		$this->language->load('module/translate');
		 
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('localisation/translate');
		
		$this->model_localisation_translate->checkTable();
		
    	$this->getList();
	}
	public function insert() {
		$this->language->load('module/translate');

		$this->document->setTitle($this->language->get('heading_title').' - '.$this->language->get('text_insert'));
		
		$this->load->model('localisation/translate');
		
		$this->model_localisation_translate->checkTable();

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_localisation_translate->insert($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = $this->burl();
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('module/translate', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
	public function edit() {
		$this->language->load('module/translate');

		$this->document->setTitle($this->language->get('heading_title').' - '.$this->language->get('text_edit'));
		
		$this->load->model('localisation/translate');
		
		$this->model_localisation_translate->checkTable();

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_localisation_translate->update($this->request->get['translation_id'], $this->request->post['value']);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = $this->burl();
					
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
					
			$this->redirect($this->url->link('module/translate', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
	public function delete() {
		$this->language->load('module/translate');
		 
		$this->load->model('localisation/translate');
		
		$this->model_localisation_translate->checkTable();
		
    	if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $translation_id) {
				$this->model_localisation_translate->delete($translation_id);
			}
			
			$this->session->data['success'] = $this->language->get('text_delete_success');

			$url = $this->burl();

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('module/translate', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    	}
    
    	$this->getList();
	}
	public function import() {
		$this->language->load('module/translate');
		 
		$this->load->model('localisation/translate');
		
		$this->model_localisation_translate->checkTable();
		
		if(isset($this->request->post['import']) && $this->validateImport()) {
			$this->model_localisation_translate->resetOriginal();
			$count = 0;
			foreach($this->model_localisation_translate->getInterfaces() as $interface) {
				foreach($this->model_localisation_translate->getLanguages() as $language) {
					$count += $this->model_localisation_translate->import($interface['name'], $language['directory'], $language['filename']);
					foreach(glob($interface['langdir'].$language['directory'].'/*', GLOB_ONLYDIR) as $dir) {
						foreach(glob($dir.'/*.php') as $file) {
							$filename = basename($dir).'/'.basename($file, '.php');
							$count += $this->model_localisation_translate->import($interface['name'], $language['directory'], $filename);
						}
					}
				}
			}
			$this->session->data['success'] = sprintf($this->language->get('text_import_success'), $count);
			$this->redirect($this->url->link('module/translate', 'token=' . $this->session->data['token'], 'SSL'));
		}
    	$this->getList();
	}
	private function getList() {
		if (isset($this->request->get['filter_interface']) && array_key_exists($this->request->get['filter_interface'], $this->model_localisation_translate->getInterfaces())) {
			$filter_interface = $this->request->get['filter_interface'];
		} else {
			$filter_interface = null;
		}

		if (isset($this->request->get['filter_directory']) && array_key_exists($this->request->get['filter_directory'], $this->model_localisation_translate->getLanguages())) {
			$filter_directory = $this->request->get['filter_directory'];
		} else {
			$filter_directory = null;
		}
		
		if (isset($this->request->get['filter_filename'])) {
			$filter_filename = $this->request->get['filter_filename'];
		} else {
			$filter_filename = null;
		}

		if (isset($this->request->get['filter_key'])) {
			$filter_key = $this->request->get['filter_key'];
		} else {
			$filter_key = null;
		}

		if (isset($this->request->get['filter_value'])) {
			$filter_value = $this->request->get['filter_value'];
		} else {
			$filter_value = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'key'; 
		}
		
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
						
		$url = $this->burl();

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
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
			'href'      => $this->url->link('module/translate', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['translatemode'] = $this->url->link('module/translate/translatemode', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['import'] = $this->url->link('module/translate/import', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['insert'] = $this->url->link('module/translate/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('module/translate/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['translations'] = array();

		$data = array(
			'filter_interface'              => $filter_interface,
			'filter_directory'             => $filter_directory,
			'filter_filename' => $filter_filename,
			'filter_key' => $filter_key,
			'filter_value' => $filter_value,
			'filter_status' => $filter_status, 
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                    => $this->config->get('config_admin_limit')
		);
		
		$translations_total = $this->model_localisation_translate->getTotalTranslations($data);
		$translations = $this->model_localisation_translate->getTranslations($data);
 
    	foreach ($translations as $result) {
			$action = array();
		
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('module/translate/edit', 'token=' . $this->session->data['token'] . '&translation_id=' . $result['translation_id'] . $url, 'SSL')
			);
			if($result['status']) $status = $this->language->get('text_exists');
			elseif($result['status'] === NULL) $status = $this->language->get('text_not_exists');
			else $status = $this->language->get('text_exists_and_differs');
			
			$this->data['translations'][] = array(
				'translation_id'    => $result['translation_id'],
				'interface'           => $result['interface'],
				'directory'          => isset($result['directory']) ? $result['directory'] : null,
				'filename' => $result['filename'],
				'key'         => $result['key'],
				'value'         => htmlspecialchars($result['value']),
				'selected'       => isset($this->request->post['selected']) && in_array($result['translation_id'], $this->request->post['selected']),
				'action'         => $action,
				'status'		=> $status
			);
		}	
					
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_all'] = $this->language->get('text_all');
		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_interface'] = $this->language->get('column_interface');
		$this->data['column_directory'] = $this->language->get('column_directory');
		$this->data['column_filename'] = $this->language->get('column_filename');
		$this->data['column_key'] = $this->language->get('column_key');
		$this->data['column_value'] = $this->language->get('column_value');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_action'] = $this->language->get('column_action');		
		
		$this->data['button_translatemode'] = $this->language->get('button_translatemode');
		$this->data['button_import'] = $this->language->get('button_import');
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
		
		$url = $this->burl();

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['sort_interface'] = $this->url->link('module/translate', 'token=' . $this->session->data['token'] . '&sort=interface' . $url, 'SSL');
		$this->data['sort_directory'] = $this->url->link('module/translate', 'token=' . $this->session->data['token'] . '&sort=directory' . $url, 'SSL');
		$this->data['sort_filename'] = $this->url->link('module/translate', 'token=' . $this->session->data['token'] . '&sort=filename' . $url, 'SSL');
		$this->data['sort_key'] = $this->url->link('module/translate', 'token=' . $this->session->data['token'] . '&sort=key' . $url, 'SSL');
		$this->data['sort_value'] = $this->url->link('module/translate', 'token=' . $this->session->data['token'] . '&sort=value' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('module/translate', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		
		$url = $this->burl();

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $translations_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('module/translate', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();

		$this->data['filter_interface'] = $filter_interface;
		$this->data['filter_directory'] = $filter_directory;
		$this->data['filter_filename'] = $filter_filename;
		$this->data['filter_key'] = $filter_key;
		$this->data['filter_value'] = $filter_value;
		$this->data['filter_status'] = $filter_status;
		
		$this->data['interfaces'] = array_keys($this->model_localisation_translate->getInterfaces());
		$this->data['directories'] = array_keys($this->model_localisation_translate->getLanguages());
		$this->data['statuses'] = array(
			'new' => $this->language->get('text_not_exists'),
			'differs' => $this->language->get('text_exists_and_differs'),
			'equals' => $this->language->get('text_exists')
		);
		
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		
		$this->template = 'module/translate_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
  	private function getForm() {
    	$this->data['heading_title'] = $this->language->get('heading_title');
 		if(isset($this->request->get['translation_id'])) {
 			$this->data['edit'] = true;
 			$this->data['heading_title'] .= ' - '.$this->language->get('text_edit');
 		}
 		else {
 			$this->data['edit'] = false;
 			$this->data['heading_title'] .= ' - '.$this->language->get('text_insert');
		}
 
    	$this->data['entry_interface'] = $this->language->get('entry_interface');
    	$this->data['entry_directory'] = $this->language->get('entry_directory');
    	$this->data['entry_filename'] = $this->language->get('entry_filename');
    	$this->data['entry_key'] = $this->language->get('entry_key');
    	$this->data['entry_value'] = $this->language->get('entry_value');
    	$this->data['text_select'] = $this->language->get('text_select');
 
		$this->data['button_save'] = $this->language->get('button_save');
    	$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['token'] = $this->session->data['token'];

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['interface'])) {
			$this->data['error_interface'] = $this->error['interface'];
		} else {
			$this->data['error_interface'] = '';
		}

 		if (isset($this->error['directory'])) {
			$this->data['error_directory'] = $this->error['directory'];
		} else {
			$this->data['error_directory'] = '';
		}
		
 		if (isset($this->error['filename'])) {
			$this->data['error_filename'] = $this->error['filename'];
		} else {
			$this->data['error_filename'] = '';
		}
		
 		if (isset($this->error['key'])) {
			$this->data['error_key'] = $this->error['key'];
		} else {
			$this->data['error_key'] = '';
		}
		
		$url = $this->burl();
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
						
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
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
			'href'      => $this->url->link('module/translate', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);

		if (!isset($this->request->get['translation_id'])) {
			$this->data['action'] = $this->url->link('module/translate/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('module/translate/edit', 'token=' . $this->session->data['token'] . '&translation_id=' . $this->request->get['translation_id'] . $url, 'SSL');
		}
		  
    	$this->data['cancel'] = $this->url->link('module/translate', 'token=' . $this->session->data['token'] . $url, 'SSL');

    	if (isset($this->request->get['translation_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$translation_info = $this->model_localisation_translate->getTranslation($this->request->get['translation_id']);
    	}
			
    	if (isset($this->request->post['interface'])) {
      		$this->data['post_interface'] = $this->request->post['interface'];
		} elseif (isset($translation_info)) { 
			$this->data['post_interface'] = $translation_info['interface'];
		} else {
      		$this->data['post_interface'] = '';
    	}

    	if (isset($this->request->post['directory'])) {
      		$this->data['post_directory'] = $this->request->post['directory'];
    	} elseif (isset($translation_info)) { 
			$this->data['post_directory'] = $translation_info['directory'];
		} else {
      		$this->data['post_directory'] = '';
    	}

    	if (isset($this->request->post['filename'])) {
      		$this->data['post_filename'] = $this->request->post['filename'];
    	} elseif (isset($translation_info)) { 
			$this->data['post_filename'] = $translation_info['filename'];
		} else {
      		$this->data['post_filename'] = '';
    	}

    	if (isset($this->request->post['key'])) {
      		$this->data['post_key'] = $this->request->post['key'];
    	} elseif (isset($translation_info)) { 
			$this->data['post_key'] = $translation_info['key'];
		} else {
      		$this->data['post_key'] = '';
    	}

    	if (isset($this->request->post['value'])) {
      		$this->data['post_value'] = $this->request->post['value'];
    	} elseif (isset($translation_info)) { 
			$this->data['post_value'] = htmlspecialchars($translation_info['value']);
		} else {
      		$this->data['post_value'] = '';
    	}
		
		$this->data['interfaces'] = array_keys($this->model_localisation_translate->getInterfaces());
		$this->data['directories'] = array_keys($this->model_localisation_translate->getLanguages());
		
		$this->template = 'module/translate_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
  	private function validateForm() {
    	if (!$this->user->hasPermission('modify', 'module/translate')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

		if(!array_key_exists($this->request->post['interface'], $this->model_localisation_translate->getInterfaces())) {
			$this->error['interface'] = $this->language->get('error_interface');
		}

		$languages = $this->model_localisation_translate->getLanguages();
		if(!array_key_exists($this->request->post['directory'], $languages)) {
			$this->error['directory'] = $this->language->get('error_directory');
			$expr = '';
			foreach($languages as $language) {
				$expr .= '|^'.$language['filename'].'$';
			}
		}
		else $expr = '|^'.$languages[$this->request->post['directory']]['filename'].'$';
		
		if(!preg_match("/^[a-z0-9_]{1,63}\/[a-z0-9_]{1,63}$$expr/", $this->request->post['filename'])) {
			$this->error['filename'] = $this->language->get('error_filename');
		}
		
		if(!preg_match("/^[a-z0-9_]{1,127}$/", $this->request->post['key'])) {
			$this->error['key'] = $this->language->get('error_key');
		}
		
		$this->request->post['value'] = htmlspecialchars_decode($this->request->post['value']);
		
		if($translation_info = $this->model_localisation_translate->getTranslationByData($this->request->post)) {
			if(!isset($this->request->get['translation_id'])) {
				$this->error['warning'] = $this->language->get('error_exists');
			}
			elseif($this->request->get['translation_id'] != $translation_info['translation_id']) {
				$this->error['warning'] = $this->language->get('error_exists');
			}
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}    
	private function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'module/translate')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}	
	  	 
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}  
	}
	private function validateImport() {
    	if (!$this->user->hasPermission('modify', 'module/translate')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}	
	  	 
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}  
	}
	private function burl() {
		$burl = '';

		if (isset($this->request->get['filter_interface'])) {
			$burl .= '&filter_interface=' . $this->request->get['filter_interface'];
		}
		
		if (isset($this->request->get['filter_directory'])) {
			$burl .= '&filter_directory=' . $this->request->get['filter_directory'];
		}
		
		if (isset($this->request->get['filter_filename'])) {
			$burl .= '&filter_filename=' . $this->request->get['filter_filename'];
		}
			
		if (isset($this->request->get['filter_key'])) {
			$burl .= '&filter_key=' . $this->request->get['filter_key'];
		}
			
		if (isset($this->request->get['filter_value'])) {
			$burl .= '&filter_value=' . $this->request->get['filter_value'];
		}

		if (isset($this->request->get['filter_status'])) {
			$burl .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_lang1'])) {
			$burl .= '&filter_lang1=' . $this->request->get['filter_lang1'];
		}

		if (isset($this->request->get['filter_lang2'])) {
			$burl .= '&filter_lang2=' . $this->request->get['filter_lang2'];
		}

		return $burl;
	}
}
?>