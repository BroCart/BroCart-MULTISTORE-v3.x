<?php

class ControllerShippingcourierautolux extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('shipping/courierautolux');

        //$this->document->title = $this->language->get('heading_title');
	  $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            $this->model_setting_setting->editSetting('courierautolux', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect(HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token']);
        }

        // установка языковых переменных
        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_all_zones'] = $this->language->get('text_all_zones');
        $this->data['text_none'] = $this->language->get('text_none');

        $this->data['entry_tax'] = $this->language->get('entry_tax');
        $this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $this->data['entry_delivery_price'] = $this->language->get('entry_delivery_price');
        $this->data['entry_min_total_for_free_delivery'] = $this->language->get('entry_min_total_for_free_delivery');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        $this->data['tab_general'] = $this->language->get('tab_general');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        // хлебные крошки
        $this->document->breadcrumbs = array();

        $this->document->breadcrumbs[] = array(
            'href' => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
            'text' => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->document->breadcrumbs[] = array(
            'href' => HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token'],
            'text' => $this->language->get('text_shipping'),
            'separator' => ' :: '
        );

        $this->document->breadcrumbs[] = array(
            'href' => HTTPS_SERVER . 'index.php?route=shipping/courierautolux&token=' . $this->session->data['token'],
            'text' => $this->language->get('heading_title'),
            'separator' => ' :: '
        );

        // ссылки для кнопок Сохранить и Отменить
        $this->data['action'] = HTTPS_SERVER . 'index.php?route=shipping/courierautolux&token=' . $this->session->data['token'];

        $this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token'];

        if (isset($this->request->post['courierautolux_min_total_for_free_delivery'])) {
            $this->data['courierautolux_min_total_for_free_delivery'] = $this->request->post['courierautolux_min_total_for_free_delivery'];
        } else {
            $this->data['courierautolux_min_total_for_free_delivery'] = $this->config->get('courierautolux_min_total_for_free_delivery');
        }

        if (isset($this->request->post['courierautolux_delivery_price'])) {
            $this->data['courierautolux_delivery_price'] = $this->request->post['courierautolux_delivery_price'];
        } else {
            $this->data['courierautolux_delivery_price'] = $this->config->get('courierautolux_delivery_price');
        }

        if (isset($this->request->post['courierautolux_geo_zone_id'])) {
            $this->data['courierautolux_geo_zone_id'] = $this->request->post['courierautolux_geo_zone_id'];
        } else {
            $this->data['courierautolux_geo_zone_id'] = $this->config->get('courierautolux_geo_zone_id');
        }

        if (isset($this->request->post['courierautolux_status'])) {
            $this->data['courierautolux_status'] = $this->request->post['courierautolux_status'];
        } else {
            $this->data['courierautolux_status'] = $this->config->get('courierautolux_status');
        }

        if (isset($this->request->post['courierautolux_sort_order'])) {
            $this->data['courierautolux_sort_order'] = $this->request->post['courierautolux_sort_order'];
        } else {
            $this->data['courierautolux_sort_order'] = $this->config->get('courierautolux_sort_order');
        }

        $this->load->model('localisation/geo_zone');

        $this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

        $this->template = 'shipping/courierautolux.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'shipping/courierautolux')) {
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