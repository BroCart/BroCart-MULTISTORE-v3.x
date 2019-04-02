<?php

class ModelExtensionShippingUkrpost extends Model {

    function getQuote($address) {
        $this->load->language('extension/shipping/ukrpost');

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int) $this->config->get('shipping_free_geo_zone_id') . "' AND country_id = '" . (int) $address['country_id'] . "' AND (zone_id = '" . (int) $address['zone_id'] . "' OR zone_id = '0')");

        if (!$this->config->get('shipping_free_geo_zone_id')) {
            $status = true;
        } elseif ($query->num_rows) {
            $status = true;
        } else {
            $status = false;
        }

        if ($this->cart->getSubTotal() < $this->config->get('shipping_free_total')) {
            $status = false;
        }

        $image = HTTP_SERVER.'image/catalog/shipping/ukrpost.jpg';
        $image_html = "<img src='$image' alt='".$this->language->get('text_title')."' title='".$this->language->get('text_title')."'>";
        
        $method_data = array();

        if ($status) {
            $quote_data = array();

            $quote_data['ukrpost'] = array(
                'code' => 'ukrpost.ukrpost',
                'title' => $image_html.' '.$this->language->get('text_description'),
                'cost' => $this->config->get('shipping_ukrpost_cost'),
                'tax_class_id' => $this->config->get('shipping_ukrpost_tax_class_id'),
                'text' => $this->currency->format($this->tax->calculate($this->config->get('shipping_ukrpost_cost'), $this->config->get('shipping_ukrpost_tax_class_id'), $this->config->get('shipping_config_tax')), $this->session->data['currency'])
            );

            $method_data = array(
                'code' => 'ukrpost.ukrpost',
                'title' => $this->language->get('text_title'),
                'quote' => $quote_data,
                'sort_order' => $this->config->get('shipping_ukrpost_sort_order'),
                'error' => false
            );
        }

        return $method_data;
    }

}
