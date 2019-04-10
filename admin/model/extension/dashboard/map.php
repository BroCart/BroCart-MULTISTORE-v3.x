<?php
class ModelExtensionDashboardMap extends Model {
	public function getTotalOrdersByCountry() {
		$implode = array();		
		if (is_array($this->config->get('config_complete_status'))) {
			foreach ($this->config->get('config_complete_status') as $order_status_id) {
				$implode[] = (int)$order_status_id;
			}
		}		
		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total, SUM(o.total) AS amount, c.iso_code_2 FROM `" . DB_PREFIX . "order` o LEFT JOIN `" . DB_PREFIX . "country` c ON (o.payment_country_id = c.country_id) WHERE o.order_status_id IN('" . (int)implode(',', $implode) . "') GROUP BY o.payment_country_id");
			return $query->rows;
		} else {
			return array();
		}
	}
	
	public function getRegionsByOrders() {
		$implode = array();		
		if (is_array($this->config->get('config_processing_status'))) {
			foreach ($this->config->get('config_processing_status') as $order_status_id) {
				$implode[] = (int)$order_status_id;
			}
		}		
		if ($implode) {
			$query = $this->db->query("SELECT z.code AS regcode, os.color FROM `" . DB_PREFIX . "order` o LEFT JOIN `" . DB_PREFIX . "zone` z ON (o.payment_zone_id = z.zone_id) LEFT JOIN `" . DB_PREFIX . "order_status` os ON (o.order_status_id = os.order_status_id) WHERE o.order_status_id IN('" . (int)implode(',', $implode) . "') GROUP BY o.payment_zone_id");
			return $query->rows;
		} else {
			return array();
		}
	}
}
