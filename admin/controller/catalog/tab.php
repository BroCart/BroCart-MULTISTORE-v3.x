<?php
/*
	This file is part of the "Extra Product Tabs Opencart Extension"

	The "Extra Product Tabs Opencart Extension" is free software: you can redistribute it and/or modify it under
	the terms of the GNU General Public License as published by the Free Software
	Foundation, either version 3 of the License, or (at your option) any later version.

	The Extra Product Tabs Opencart Extension is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
	FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

	---------------------------------------------------------------------
  Name:		Extra Product Tabs Opencart Extension
  
  Version: 1.0.4

  OpenCart:	Version 1.5.4.1, 1.5.4.1

  Author: 	rebdog (Godfrey Livinsgtone godfrey@satelliteshop.co.nz)

  Copyright 2012, 2013

*/

class ControllerCatalogTab extends Controller {
	private $error = array();

	public function index() {

		//Add extra DB tables if needed
		$sql =	"CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "tab (
							`tab_id` int(11) NOT NULL AUTO_INCREMENT,
							`sort_order` int(3) NOT NULL,
							`status` tinyint(1) NOT NULL DEFAULT 1,
							`position` tinyint(1) NOT NULL DEFAULT 1,
							`show_empty` tinyint(1) NOT NULL DEFAULT 0,
							PRIMARY KEY (`tab_id`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin";

		$this->db->query($sql);

		$sql = 	"CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "tab_description (
							`tab_id` int(11) NOT NULL,
							`language_id` int(11) NOT NULL,
							`name` varchar(64) COLLATE utf8_bin NOT NULL,
							PRIMARY KEY (`tab_id`,`language_id`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin";

		$this->db->query($sql);

		$sql = 	"CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_tab (
							`product_id` int(11) NOT NULL,
							`tab_id` int(11) NOT NULL,
							`language_id` int(11) NOT NULL,
							`text` text NOT NULL,
							`position` tinyint(1),
							`show_empty` tinyint(1),
							PRIMARY KEY (`product_id`,`tab_id`,`language_id`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin";

		$this->db->query($sql);

		$this->load->language('catalog/tab');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/tab');

		$this->getList();
	}

	public function insert() {

		$this->load->language('catalog/tab');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/tab');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
					$this->model_catalog_tab->addTab($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}

		$this->getForm();
	}

	public function update() {

		$this->load->language('catalog/tab');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/tab');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_tab->editTab($this->request->get['tab_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, 'SSL'));

		}

		$this->getForm();
	}

	public function delete() {

		$this->load->language('catalog/tab');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/tab');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {

			foreach ($this->request->post['selected'] as $tab_id) {
				$this->model_catalog_tab->deleteTab($tab_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	private function getList() {

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
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

		$url = '';

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
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['insert'] = $this->url->link('catalog/tab/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/tab/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['product_tabs'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$product_tab_total = $this->model_catalog_tab->getTotalTabs();

		$results = $this->model_catalog_tab->getTabs($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/tab/update', 'token=' . $this->session->data['token'] . '&tab_id=' . $result['tab_id'] . $url, 'SSL')
			);

			$this->data['product_tabs'][] = array(
				'tab_id' 						=> $result['tab_id'],
				'name'              => $result['name'],
				'sort_order'        => $result['sort_order'],
				'selected'          => isset($this->request->post['selected']) && in_array($result['tab_id'], $this->request->post['selected']),
				'action'            => $action
			);

		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');

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

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_name'] = $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . '&sort=agd.name' . $url, 'SSL');
		$this->data['sort_sort_order'] = $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . '&sort=ag.sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $product_tab_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/tab_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function getForm() {
		$this->data['heading_title'] 		= $this->language->get('heading_title');

		$this->data['entry_name'] 			= $this->language->get('entry_name');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'] 		= $this->language->get('entry_status');
		$this->data['entry_position'] 	= $this->language->get('entry_position');
		$this->data['entry_show_empty'] = $this->language->get('entry_show_empty');

		$this->data['text_disabled'] 		= $this->language->get('text_disabled');
		$this->data['text_enabled'] 		= $this->language->get('text_enabled');
		$this->data['text_yes'] 				= $this->language->get('text_yes');
		$this->data['text_no'] 					= $this->language->get('text_no');

		$this->data['button_save'] 			= $this->language->get('button_save');
		$this->data['button_cancel'] 		= $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

		$url = '';

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
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, 'SSL'),
				'separator' => ' :: '
			);

		if (!isset($this->request->get['tab_id'])) {
			$this->data['action'] = $this->url->link('catalog/tab/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/tab/update', 'token=' . $this->session->data['token'] . '&tab_id=' . $this->request->get['tab_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('catalog/tab', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['tab_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$product_tab_info = $this->model_catalog_tab->getTab($this->request->get['tab_id']);
		}

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['product_tab_description'])) {
			$this->data['product_tab_description'] = $this->request->post['product_tab_description'];
		} elseif (isset($this->request->get['tab_id'])) {
			$this->data['product_tab_description'] = $this->model_catalog_tab->getTabDescriptions($this->request->get['tab_id']);
		} else {
			$this->data['product_tab_description'] = array();
		}

		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($product_tab_info)) {
			$this->data['sort_order'] = $product_tab_info['sort_order'];
		} else {
			$this->data['sort_order'] = '';
		}

		$this->data['insert_positions'] = array();

		$this->data['insert_positions'][] = array(
																					'position_number'	=> '1',
																					'description' 		=>	$this->language->get('text_position_1')
																				);

		$this->data['insert_positions'][]	=	array(
																					'position_number'	=> '2',
																					'description' 		=>	$this->language->get('text_position_2')
																				);

		$this->data['insert_positions'][]	= array(
																					'position_number'	=> '3',
																					'description' 		=>	$this->language->get('text_position_3')
																				);

		$this->data['insert_positions'][]	= array(
																					'position_number'	=> '4',
																					'description' 		=>	$this->language->get('text_position_4')
																				);

		$this->data['insert_positions'][] = array(
																					'position_number' => '5',
																					'description' 		=>	$this->language->get('text_position_5')
																				);

		if (isset($this->request->post['position'])) {
			$this->data['position'] = $this->request->post['position'];
		} elseif (!empty($product_tab_info)) {
			$this->data['position'] = $product_tab_info['position'];
		} else {
			$this->data['position'] = '5';  // Default After All System Tabs
		}

		if (isset($this->request->post['show_empty'])) {
			$this->data['show_empty'] = $this->request->post['show_empty'];
		} elseif (!empty($product_tab_info)) {
			$this->data['show_empty'] = $product_tab_info['show_empty'];
		} else {
			$this->data['show_empty'] = '0';  // Default to not show empty
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($product_tab_info)) {
			$this->data['status'] = $product_tab_info['status'];
		} else {
			$this->data['status'] = '1';  // Enabled
		}


		$this->template = 'catalog/tab_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/tab')) {
				$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['product_tab_description'] as $language_id => $value) {
				if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 64)) {
					$this->error['name'][$language_id] = $this->language->get('error_name');
				}
		}

		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  }

  private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/tab')) {
					$this->error['warning'] = $this->language->get('error_permission');
			}

		foreach ($this->request->post['selected'] as $tab_id) {

			$product_tab_total = $this->model_catalog_tab->getTotalUsedTabs($tab_id);

			if ($product_tab_total) {
				$this->error['warning'] = sprintf($this->language->get('error_product_tab'), $product_tab_total);
			}
		}

		if (!$this->error) {
				return true;
		} else {
				return false;
		}
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/tab');

			$data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 20
			);

			$json = array();

			$results = $this->model_catalog_tab->getTabs($data);

			foreach ($results as $result) {
				$json[] = array(
					'tab_id'    => $result['tab_id'],
					'name'      => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->setOutput(json_encode($json));
	}
}
?>