<?php

class ModelShippingcourierautolux extends Model {

    function getQuote($address) {
        $this->load->language('shipping/courierautolux');

        if ($this->config->get('courierautolux_status')) {
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int) $this->config->get('courierautolux_geo_zone_id') . "' AND country_id = '" . (int) $address['country_id'] . "' AND (zone_id = '" . (int) $address['zone_id'] . "' OR zone_id = '0')");

            if (!$this->config->get('courierautolux_geo_zone_id')) {
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
            if ($this->config->get('courierautolux_min_total_for_free_delivery') > $this->cart->getSubTotal()) {
                $cost = $this->config->get('courierautolux_delivery_price');
            }

            $quote_data['courierautolux'] = array(
                'code' => 'courierautolux.courierautolux',
                'title' => $this->language->get('text_description'),
                'cost' => $cost,
                'tax_class_id' => 0,
				'text'         => 'Вартість можна розрахувати, за допомогою <a href="http://autolux.ua/Kalkulyator_stoimosti" target="_blank">калькулятора</a> на сайті Автолюкса' //$this->currency->format($cost)
//                'text' => $this->currency->format($cost)
            );

            $method_data = array(
                'code' => 'courierautolux',
                'title' => $this->language->get('text_title'),
                'quote' => $quote_data,
                'sort_order' => $this->config->get('courierautolux_sort_order'),
                'error' => FALSE
            );
        }

        return $method_data;
    }

}

?>