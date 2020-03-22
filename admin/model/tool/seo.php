<?php
class ModelToolSeo extends Model {
	public function getKeywords($data = array()) {		
		$sql = $this->db->query("SELECT `keyword` FROM `" . DB_PREFIX . "seo_url` WHERE language_id = '" . (int)$data['filter_lang'] . "' AND `keyword` LIKE '" . $this->db->escape($data['filter_keyw']) . "%' ORDER BY keyword DESC LIMIT 1");
		
		if ($sql->num_rows) {
			return $sql->row['keyword'];
		} else {
			return false;
		}
	}
}
