<?php
class ModelCatalogLables extends Model {
	public function addLables($data) {
	
		$query = $this->db->query("SELECT lable_id FROM " . DB_PREFIX . "label_block ORDER BY lable_id DESC LIMIT 1");
		
		if ($query->num_rows) {		
		$lable_id = $query->row['lable_id'] + 1; 		
		} else {
		$lable_id = 0;
		}
		
		if (isset($data['stick_text'])) {
		
			foreach ($data['stick_text'] as $language_id => $value) { 				
				$this->db->query("INSERT INTO " . DB_PREFIX . "label_block SET language_id = '". (int)$language_id ."', lable_id = '" . (int)$lable_id . "', stick_text = '" . $this->db->escape($value['stick_text']) . "', image = '" . $this->db->escape($value['image']) . "', stick_main = '" . $this->db->escape($value['stick_main']) . "', sort_order = '" . (int)$data['sort_order'] . "'");
			}
		
		}
		
		$this->cache->delete('stickers');
	}

	public function editLables($lable_id, $data) {
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "label_block WHERE lable_id = '" . (int)$lable_id . "'");
		if (isset($data['stick_text'])) {
		
			foreach ($data['stick_text'] as $language_id => $value) { 				
				$this->db->query("INSERT INTO " . DB_PREFIX . "label_block SET language_id = '". (int)$language_id ."', lable_id = '" . (int)$lable_id . "', sort_order = '" . (int)$data['sort_order'] . "', stick_text = '" . $this->db->escape($value['stick_text']) . "', image = '" . $this->db->escape($value['image']) . "', stick_main = '" . $this->db->escape($value['stick_main']) . "'");
			}
		
		}
		
		$this->cache->delete('stickers');
	}

	public function deleteLables($lable_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "label_block WHERE lable_id = '" . (int)$lable_id . "'");
		$this->cache->delete('stickers');
	}
	
	public function getLablesAll($lable_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "label_block WHERE lable_id = '" . (int)$lable_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}
	
	public function getLables($data = array()) {
		//if ($data) {
			
			$sql = "SELECT * FROM " . DB_PREFIX . "label_block WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'";
			
			$sort_data = array(
				'stick_text',
				'sort_order'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY stick_text";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}

			$query = $this->db->query($sql);

			return $query->rows;
		/* } else {
			
			if (!$stickers_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "label_block ORDER BY stick_text");

				$stickers_data = $query->rows;

				$this->cache->set('stickers', $stickers_data);
			}

			return $stickers_data;
		} */
	}
	
	public function getStickerText($sticker_id) {
		$sticker_text = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "label_block WHERE lable_id = '" . (int)$sticker_id . "'");
		
		foreach ($query->rows as $result) {
			$sticker_text[$result['language_id']] = array(
				'stick_text'       => $result['stick_text'],
				'image'      	   => $result['image'],
				'stick_main'       => $result['stick_main']
			);
		}
		
		return $sticker_text;
	}
		
	public function getLablesPro($product_id) {
	
		$sticker_text = array();
	
      	$query = $this->db->query("SELECT label_id, date_begin, date_end FROM " . DB_PREFIX . "label_to_product WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$sticker_text[] = array(
				'stick_text'       => $this->getTextLable($result['label_id']),
				//'image'      	   => $this->getImageLable($result['label_id']),
				'date_begin'       => $result['date_begin'],
				'date_end'         => $result['date_end'],
				'lable_id'      	=> $result['label_id']
			);
			
		}
		
		//$this->log->write('Product_image:'. print_r($sticker_text,true));
		
		return $sticker_text;
		//return $query->rows;
	}
	
	/* public function getImageLable($lable_id) {
		$sql = "SELECT image FROM " . DB_PREFIX . "label_block WHERE lable_id = '" . (int)$lable_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
		$query = $this->db->query($sql);

		return $query->row['image'];
	} */
	
	public function getTextLable($lable_id) {
	
		$sql = "SELECT stick_text FROM " . DB_PREFIX . "label_block WHERE lable_id = '" . (int)$lable_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'";
		$query = $this->db->query($sql);

		return $query->row['stick_text'];
	}

	public function getTotalLables($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "label_block WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'";
		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	
}
?>