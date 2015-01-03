<?php

class ModelShippingnexpress extends Model {

    function getQuote($address) {
        $this->load->language('shipping/nexpress');

        if ($this->config->get('nexpress_status')) {
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int) $this->config->get('nexpress_geo_zone_id') . "' AND country_id = '" . (int) $address['country_id'] . "' AND (zone_id = '" . (int) $address['zone_id'] . "' OR zone_id = '0')");

            if (!$this->config->get('nexpress_geo_zone_id')) {
                $status = TRUE;
            } elseif ($query->num_rows) {
                $status = TRUE;
            } else {
                $status = FALSE;
            }
        } else {
            $status = FALSE;
        }

        $method_data = array();

        if ($status) {
            $quote_data = array();

            $cost = 0.00;
            if ($this->config->get('nexpress_min_total_for_free_delivery') > $this->cart->getSubTotal()) {
                $cost = $this->config->get('nexpress_delivery_price');
            }

            $quote_data['nexpress'] = array(
                'code' => 'nexpress.nexpress',
                'title' => $this->language->get('text_description'),
                'cost' => $cost,
                'tax_class_id' => 0,
				'text'         => 'Вартість можна розрахувати, за допомогою <a href="http://www.nexpress.com.ua/calculator" target="_blank">калькулятора</a> на сайті Нічного Експресу' //$this->currency->format($cost)
            );

            $method_data = array(
                'code' => 'nexpress',
                'title' => $this->language->get('text_title'),
                'quote' => $quote_data,
                'sort_order' => $this->config->get('nexpress_sort_order'),
                'error' => FALSE
            );
        }

        return $method_data;
    }

}

?>