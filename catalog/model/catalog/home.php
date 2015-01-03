<?php
class ModelCatalogHome extends Model {

	public function getMainInfo($lang) {
	
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_main WHERE language_id = '" . (int)$lang . "'");								
		return $query->row;
	}

	public function getLangcode($langcode) {
		$query = $this->db->query("SELECT language_id FROM " . DB_PREFIX . "language WHERE code = '" . $langcode . "'");
		
		return $query->row;	
	}	
}
?>