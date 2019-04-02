<?php
class ModelExtensionFeedFuriousSitemap extends Model {

	public function getMan() {		
		$query = $this->db->query("SELECT m.manufacturer_id FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY name");
		if ($query->num_rows) {
			return $query->rows;
		} else {
			return false;
		}
	}

	public function getInformations() {
		$query = $this->db->query("SELECT i.information_id FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) LEFT JOIN " . DB_PREFIX . "information_to_store i2s ON (i.information_id = i2s.information_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' ORDER BY i.sort_order, LCASE(id.title) ASC");			
		if ($query->num_rows) {
			return $query->rows;
		} else {
			return false;
		}
	}
	
	public function getProducts($start = 0, $limit = false, $lang_id) {
		$now = date('Y-m-d H:i') . ':00';
		$sql = "SELECT p.product_id, p.date_added, p.date_modified, p.image, pd.name FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id AND pd.language_id = '" . (int)$lang_id . "') WHERE p.status = '1' AND p.date_available <= '".$now."' ORDER BY p.product_id ASC";
		if ($limit) {			
			$sql .= " LIMIT " . $start . ", " . $limit;			
		}
		$query = $this->db->query($sql);
		if ($query->num_rows) {
			return $query->rows;
		} else {
			return false;
		}
	}
	
	public function getTotalProByCat($category_id = 0, $path = false) {
		if ($path) {
			$parts = explode('_', (string)$category_id);
			$category_id = (int)array_pop($parts);
		}		
		$query = $this->db->query("SELECT count(product_id) AS total FROM " . DB_PREFIX . "product_to_category pd JOIN " . DB_PREFIX . "category c ON (pd.category_id = c.category_id) WHERE c.category_id = '" . (int)$category_id . "'  AND c.status = '1'");
		if ($query->num_rows) {				
			return $query->row['total'];
		} else {
			return false;
		}		
	} 
	
	public function getTotal() {	
		$now = date('Y-m-d H:i') . ':00';		
		$query = $this->db->query("SELECT COUNT(p.product_id) as total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id AND p.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= '". $now ."')");
		
		return $query->row['total'];
	}
	
	public function getCatsByParentId($parent_id) {	
		$query = $this->db->query("SELECT category_id, parent_id, date_modified FROM " . DB_PREFIX . "category WHERE status = '1' ORDER BY parent_id, category_id");	
		return $query->rows;
	}
	
	public function getProPath($product_id, $suff = '', $lang = 0, $path = 'full') {
		$murl = '';
		if (isset($product_id)) {
			$lang = $lang ? (int)$lang : (int)$this->config->get('config_language_id');
			$select = $this->db->query("SELECT `keyword` FROM `" . DB_PREFIX . "seo_url` WHERE `query` = 'product_id=" . (int)$product_id . "' AND language_id = '" . $lang . "'");
			if (!$select->num_rows) {
				return false;
			}			
			if ($path == 'full') {
				$query = $this->db->query("SELECT `category_id` FROM `" . DB_PREFIX . "product_to_category` WHERE product_id = '" . (int)$product_id . "' AND main_category = '1' ORDER BY main_category DESC LIMIT 1");
				if ($query->num_rows) {
					$murl .= $this->getCatPath($query->num_rows ? (int)$query->row['category_id'] : 0, $suff, $lang, $path);
				}
			} elseif($path == 'last') {				
				$query = $this->db->query("SELECT `category_id` FROM `" . DB_PREFIX . "product_to_category` WHERE product_id = '" . (int)$product_id . "' AND main_category = '1' ORDER BY main_category DESC LIMIT 1");
				if ($query->num_rows) {
					$last_path = $this->getKyew('category_id', $query->row['category_id'], $lang) . $suff;
					if ($last_path) {
						$murl .= $last_path;
					}						
				}				
			} elseif($path == 'none') {
				return strtolower($select->row['keyword']);				
			}
			$murl .= strtolower($select->row['keyword']);
		}
		return $murl;
	}
	
	public function getKyew($data_id, $value, $lang = 0) {
		$murl = '';			
		if (isset($data_id) && isset($value)) {
			$lang = $lang ? (int)$lang : (int)$this->config->get('config_language_id');
			$select = $this->db->query("SELECT `keyword` FROM `" . DB_PREFIX . "seo_url` WHERE `query` = '" . $this->db->escape($data_id) . "=" . (int)$value . "' AND language_id = '" . $lang . "'");
			if ($select->num_rows) {
				$murl .= $select->row['keyword'];
			} else {
				return false;
			}			
		}
		return strtolower($murl);
	}
	
	public function getCatPath($category_id, $suff = '', $lang = 0, $path_in = 'full') {
		$murl = '';		
		if (isset($category_id)) {	
			$lang = $lang ? (int)$lang : (int)$this->config->get('config_language_id');
			if ($path_in == 'full') {
				$query = $this->db->query("SELECT `path_id` AS trix FROM `" . DB_PREFIX . "category_path` WHERE category_id = '" . (int)$category_id . "' GROUP BY `level`");		
				if ($query->num_rows) {
					foreach ($query->rows as $result) {
						$select = $this->db->query("SELECT `keyword` FROM `" . DB_PREFIX . "seo_url` WHERE `query` = 'category_id=" . $this->db->escape($result['trix']) . "' AND language_id = '" . $lang . "'");
						if ($select->num_rows) {
							$murl .= $select->row['keyword'] . $suff;
						}					
					}				
					return strtolower($murl);
				}
			} elseif ($path_in == 'last') {
				$query = $this->db->query("SELECT `parent_id` AS trix FROM `" . DB_PREFIX . "category` WHERE category_id = '" . (int)$category_id . "' GROUP BY category_id");
				if ($query->num_rows) {
					$select_one = $this->db->query("SELECT `keyword` FROM `" . DB_PREFIX . "seo_url` WHERE `query` = 'category_id=" . $this->db->escape($query->row['trix']) . "' AND language_id = '" . $lang . "'");
					if ($select_one->num_rows) {
						$murl .= $select_one->row['keyword'] . $suff;
					}
				}
				$select_two = $this->db->query("SELECT `keyword` FROM `" . DB_PREFIX . "seo_url` WHERE `query` = 'category_id=" . (int)$category_id . "' AND language_id = '" . $lang . "'");
				if ($select_two->num_rows) {
					$murl .= $select_two->row['keyword'] . $suff;
					return strtolower($murl);					
				}				
			} elseif ($path_in == 'none') {
				$select = $this->db->query("SELECT `keyword` FROM `" . DB_PREFIX . "seo_url` WHERE `query` = 'category_id=" . (int)$category_id . "' AND language_id = '" . $lang . "'");
				if ($select->num_rows) {
					return $select->row['keyword'] . $suff;
				}
			}			
		}
		return false;
	}	
}

?>
