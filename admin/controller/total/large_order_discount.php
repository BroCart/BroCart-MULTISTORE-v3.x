<?php

/**
 * Large Order Discount extension for Opencart.
 *
 * @author Diana Savvatina <diana.savvatina@gmail.com>
 * @version 1.0
 * @copyright © Diana Savvatina 2013
 * @license Creative Common's ShareAlike License - http://creativecommons.org/licenses/by-sa/3.0/
 */


class ControllerTotalLargeOrderDiscount extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('total/large_order_discount');

		$this->document->setTitle = $this->language->get('heading_title');

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$data = array();
			if(isset($this->request->post['large_order_discount_sort_order'])) $data['large_order_discount_sort_order'] = $this->request->post['large_order_discount_sort_order'];
			if(isset($this->request->post['large_order_discount_status']))     $data['large_order_discount_status']     = $this->request->post['large_order_discount_status'];
			if(isset($this->request->post['large_order_discount_date_end']))   $data['large_order_discount_date_end']   = $this->request->post['large_order_discount_date_end'];
			if(isset($this->request->post['large_order_discount_date_start'])) $data['large_order_discount_date_start'] = $this->request->post['large_order_discount_date_start'];
			if(isset($this->request->post['large_order_discount_type']))       $data['large_order_discount_type']       = $this->request->post['large_order_discount_type'];
			if(isset($this->request->post['large_order_discount_amount01']))   $data['large_order_discount_amount01']   = $this->request->post['large_order_discount_amount01'];
			if(isset($this->request->post['large_order_discount_amount02']))   $data['large_order_discount_amount02']   = $this->request->post['large_order_discount_amount02'];
			if(isset($this->request->post['large_order_discount_amount03']))   $data['large_order_discount_amount03']   = $this->request->post['large_order_discount_amount03'];
			if(isset($this->request->post['large_order_discount_amount04']))   $data['large_order_discount_amount04']   = $this->request->post['large_order_discount_amount04'];
			if(isset($this->request->post['large_order_discount_amount05']))   $data['large_order_discount_amount05']   = $this->request->post['large_order_discount_amount05'];
			if(isset($this->request->post['large_order_discount_amount06']))   $data['large_order_discount_amount06']   = $this->request->post['large_order_discount_amount06'];
			if(isset($this->request->post['large_order_discount_amount07']))   $data['large_order_discount_amount07']   = $this->request->post['large_order_discount_amount07'];
			if(isset($this->request->post['large_order_discount_amount08']))   $data['large_order_discount_amount08']   = $this->request->post['large_order_discount_amount08'];
			if(isset($this->request->post['large_order_discount_amount09']))   $data['large_order_discount_amount09']   = $this->request->post['large_order_discount_amount09'];
			if(isset($this->request->post['large_order_discount_amount10']))   $data['large_order_discount_amount10']   = $this->request->post['large_order_discount_amount10'];
			if(isset($this->request->post['large_order_discount_total01']))    $data['large_order_discount_total01']    = $this->request->post['large_order_discount_total01'];
			if(isset($this->request->post['large_order_discount_total02']))    $data['large_order_discount_total02']    = $this->request->post['large_order_discount_total02'];
			if(isset($this->request->post['large_order_discount_total03']))    $data['large_order_discount_total03']    = $this->request->post['large_order_discount_total03'];
			if(isset($this->request->post['large_order_discount_total04']))    $data['large_order_discount_total04']    = $this->request->post['large_order_discount_total04'];
			if(isset($this->request->post['large_order_discount_total05']))    $data['large_order_discount_total05']    = $this->request->post['large_order_discount_total05'];
			if(isset($this->request->post['large_order_discount_total06']))    $data['large_order_discount_total06']    = $this->request->post['large_order_discount_total06'];
			if(isset($this->request->post['large_order_discount_total07']))    $data['large_order_discount_total07']    = $this->request->post['large_order_discount_total07'];
			if(isset($this->request->post['large_order_discount_total08']))    $data['large_order_discount_total08']    = $this->request->post['large_order_discount_total08'];
			if(isset($this->request->post['large_order_discount_total09']))    $data['large_order_discount_total09']    = $this->request->post['large_order_discount_total09'];
			if(isset($this->request->post['large_order_discount_total10']))    $data['large_order_discount_total10']    = $this->request->post['large_order_discount_total10'];
			
			$this->model_setting_setting->editSetting('large_order_discount', $data);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect(HTTPS_SERVER . 'index.php?route=extension/total&token=' . $this->session->data['token']);
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_none'] = $this->language->get('text_none');

		$this->data['entry_total'] = $this->language->get('entry_total');
		$this->data['entry_amount'] = $this->language->get('entry_amount');
		$this->data['entry_level'] = $this->language->get('entry_level');
		$this->data['entry_type'] = $this->language->get('entry_type');
		$this->data['entry_date_start'] = $this->language->get('entry_date_start');
		$this->data['entry_date_end'] = $this->language->get('entry_date_end');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

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
       		'text'      => $this->language->get('text_total'),
			'href'      => $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->document->breadcrumbs[] = array(
       		'text'      => $this->language->get('heading_title'),
       		'href'      => $this->url->link('total/large_order_discount', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = HTTPS_SERVER . 'index.php?route=total/large_order_discount&token=' . $this->session->data['token'];

		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/total&token=' . $this->session->data['token'];

		if (isset($this->request->post['large_order_discount_total01'])) { $this->data['large_order_discount_total01'] = $this->request->post['large_order_discount_total01']; } else { $this->data['large_order_discount_total01'] = $this->config->get('large_order_discount_total01'); }
		if (isset($this->request->post['large_order_discount_total02'])) { $this->data['large_order_discount_total02'] = $this->request->post['large_order_discount_total02']; } else { $this->data['large_order_discount_total02'] = $this->config->get('large_order_discount_total02'); }
		if (isset($this->request->post['large_order_discount_total03'])) { $this->data['large_order_discount_total03'] = $this->request->post['large_order_discount_total03']; } else { $this->data['large_order_discount_total03'] = $this->config->get('large_order_discount_total03'); }
		if (isset($this->request->post['large_order_discount_total04'])) { $this->data['large_order_discount_total04'] = $this->request->post['large_order_discount_total04']; } else { $this->data['large_order_discount_total04'] = $this->config->get('large_order_discount_total04'); }
		if (isset($this->request->post['large_order_discount_total05'])) { $this->data['large_order_discount_total05'] = $this->request->post['large_order_discount_total05']; } else { $this->data['large_order_discount_total05'] = $this->config->get('large_order_discount_total05'); }
		if (isset($this->request->post['large_order_discount_total06'])) { $this->data['large_order_discount_total06'] = $this->request->post['large_order_discount_total06']; } else { $this->data['large_order_discount_total06'] = $this->config->get('large_order_discount_total06'); }
		if (isset($this->request->post['large_order_discount_total07'])) { $this->data['large_order_discount_total07'] = $this->request->post['large_order_discount_total07']; } else { $this->data['large_order_discount_total07'] = $this->config->get('large_order_discount_total07'); }
		if (isset($this->request->post['large_order_discount_total08'])) { $this->data['large_order_discount_total08'] = $this->request->post['large_order_discount_total08']; } else { $this->data['large_order_discount_total08'] = $this->config->get('large_order_discount_total08'); }
		if (isset($this->request->post['large_order_discount_total09'])) { $this->data['large_order_discount_total09'] = $this->request->post['large_order_discount_total09']; } else { $this->data['large_order_discount_total09'] = $this->config->get('large_order_discount_total09'); }
		if (isset($this->request->post['large_order_discount_total10'])) { $this->data['large_order_discount_total10'] = $this->request->post['large_order_discount_total10']; } else { $this->data['large_order_discount_total10'] = $this->config->get('large_order_discount_total10'); }

		if (isset($this->request->post['large_order_discount_amount01'])) { $this->data['large_order_discount_amount01'] = $this->request->post['large_order_discount_amount01']; } else { $this->data['large_order_discount_amount01'] = $this->config->get('large_order_discount_amount01'); }
		if (isset($this->request->post['large_order_discount_amount02'])) { $this->data['large_order_discount_amount02'] = $this->request->post['large_order_discount_amount02']; } else { $this->data['large_order_discount_amount02'] = $this->config->get('large_order_discount_amount02'); }
		if (isset($this->request->post['large_order_discount_amount03'])) { $this->data['large_order_discount_amount03'] = $this->request->post['large_order_discount_amount03']; } else { $this->data['large_order_discount_amount03'] = $this->config->get('large_order_discount_amount03'); }
		if (isset($this->request->post['large_order_discount_amount04'])) { $this->data['large_order_discount_amount04'] = $this->request->post['large_order_discount_amount04']; } else { $this->data['large_order_discount_amount04'] = $this->config->get('large_order_discount_amount04'); }
		if (isset($this->request->post['large_order_discount_amount05'])) { $this->data['large_order_discount_amount05'] = $this->request->post['large_order_discount_amount05']; } else { $this->data['large_order_discount_amount05'] = $this->config->get('large_order_discount_amount05'); }
		if (isset($this->request->post['large_order_discount_amount06'])) { $this->data['large_order_discount_amount06'] = $this->request->post['large_order_discount_amount06']; } else { $this->data['large_order_discount_amount06'] = $this->config->get('large_order_discount_amount06'); }
		if (isset($this->request->post['large_order_discount_amount07'])) { $this->data['large_order_discount_amount07'] = $this->request->post['large_order_discount_amount07']; } else { $this->data['large_order_discount_amount07'] = $this->config->get('large_order_discount_amount07'); }
		if (isset($this->request->post['large_order_discount_amount08'])) { $this->data['large_order_discount_amount08'] = $this->request->post['large_order_discount_amount08']; } else { $this->data['large_order_discount_amount08'] = $this->config->get('large_order_discount_amount08'); }
		if (isset($this->request->post['large_order_discount_amount09'])) { $this->data['large_order_discount_amount09'] = $this->request->post['large_order_discount_amount09']; } else { $this->data['large_order_discount_amount09'] = $this->config->get('large_order_discount_amount09'); }
		if (isset($this->request->post['large_order_discount_amount10'])) { $this->data['large_order_discount_amount10'] = $this->request->post['large_order_discount_amount10']; } else { $this->data['large_order_discount_amount10'] = $this->config->get('large_order_discount_amount10'); }

		if (isset($this->request->post['large_order_discount_type'])) {
			$this->data['large_order_discount_type'] = $this->request->post['large_order_discount_type'];
		} else {
			$this->data['large_order_discount_type'] = $this->config->get('large_order_discount_type');
		}

		if (isset($this->request->post['large_order_discount_date_start'])) {
			$this->data['large_order_discount_date_start'] = $this->request->post['large_order_discount_date_start'];
		} else {
			$this->data['large_order_discount_date_start'] = $this->config->get('large_order_discount_date_start');
		}

		if (isset($this->request->post['large_order_discount_date_end'])) {
			$this->data['large_order_discount_date_end'] = $this->request->post['large_order_discount_date_end'];
		} else {
			$this->data['large_order_discount_date_end'] = $this->config->get('large_order_discount_date_end');
		}

		if (isset($this->request->post['large_order_discount_status'])) {
			$this->data['large_order_discount_status'] = $this->request->post['large_order_discount_status'];
		} else {
			$this->data['large_order_discount_status'] = $this->config->get('large_order_discount_status');
		}

		if (isset($this->request->post['large_order_discount_sort_order'])) {
			$this->data['large_order_discount_sort_order'] = $this->request->post['large_order_discount_sort_order'];
		} else {
			$this->data['large_order_discount_sort_order'] = $this->config->get('large_order_discount_sort_order');
		}

		$this->load->model('localisation/tax_class');

		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		$this->template = 'total/large_order_discount.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'total/large_order_discount')) {
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