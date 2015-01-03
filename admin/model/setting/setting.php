<?php 
class ModelSettingSetting extends Model {
	public function getSetting($group, $store_id = 0) {
		$data = array(); 
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
		
		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$data[$result['key']] = $result['value'];
			} else {
				$data[$result['key']] = unserialize($result['value']);
			}
		}

		return $data;
	}
	
	public function editSetting($group, $data, $store_id = 0) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");

		foreach ($data as $key => $value) {
			if (!is_array($value)) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `group` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
			} else {
				$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `group` = '" . $this->db->escape($group) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(serialize($value)) . "', serialized = '1'");
			}
		}
	}
	
	public function deleteSetting($group, $store_id = 0) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
	}
	
	public function editSettingValue($group = '', $key = '', $value = '', $store_id = 0) {
		if (!is_array($value)) {
			$this->db->query("UDPATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape($value) . " WHERE `group` = '" . $this->db->escape($group) . "' AND `key` = '" . $this->db->escape($key) . "' AND store_id = '" . (int)$store_id . "'");
		} else {
			$this->db->query("UDPATE " . DB_PREFIX . "setting SET `value` = '" . $this->db->escape(serialize($value)) . "' WHERE `group` = '" . $this->db->escape($group) . "' AND `key` = '" . $this->db->escape($key) . "' AND store_id = '" . (int)$store_id . "', serialized = '1'");
		}
	}	
	
	public function editMain ($data) {
	
			foreach ($data['main_title'] as $language_id => $value) {
				$this->db->query("UPDATE " . DB_PREFIX . "seo_main SET main_title = '" . $this->db->escape($value) . "' WHERE language_id = '" . (int)$language_id . "'");
			}
			foreach ($data['main_h1'] as $language_id => $value) {
				$this->db->query("UPDATE " . DB_PREFIX . "seo_main SET main_h1 = '" . $this->db->escape($value) . "' WHERE language_id = '" . (int)$language_id . "'");			
			}
			foreach ($data['main_meta_desc'] as $language_id => $value) {
				$this->db->query("UPDATE " . DB_PREFIX . "seo_main SET main_meta_desc = '" . $this->db->escape($value) . "' WHERE language_id = '" . (int)$language_id . "'");
			}
			foreach ($data['main_meta_keyw'] as $language_id => $value) {
				$this->db->query("UPDATE " . DB_PREFIX . "seo_main SET main_meta_keyw = '" . $this->db->escape($value) . "' WHERE language_id = '" . (int)$language_id . "'");
			}

			foreach ($data['main_desc'] as $language_id => $value) {
				$this->db->query("UPDATE " . DB_PREFIX . "seo_main SET main_desc = '" . $value . "' WHERE language_id = '" . (int)$language_id . "'");
			}
		
		}
		
		public function getMainInfo($language_id) {
		
			$main_h1 = array();		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_main");		
					foreach ($query->rows as $result) {
						$main_h1[$result['language_id']] = array(
							'main_h1'     => $result['main_h1'],
							'main_desc'		 => $result['main_desc'],
							'main_title'      => $result['main_title'],
							'main_meta_desc'      => $result['main_meta_desc'],
							'main_meta_keyw'      => $result['main_meta_keyw']
						);
					}				
			
			return $main_h1;
		}
}
?>