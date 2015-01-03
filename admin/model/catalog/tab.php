<?php
/*
	This file is part of the "Extra Product Tabs Opencart Extension"

	The "Extra Product Tabs Opencart Extension" is free software: you can redistribute it and/or modify it under
	the terms of the GNU General Public License as published by the Free Software
	Foundation, either version 3 of the License, or (at your option) any later version.

	The Extra Product Tabs Opencart Extension is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
	FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

	---------------------------------------------------------------------
  Name:		Extra Product Tabs Opencart Extension
  
  Version: 1.0.4

  OpenCart:	Version 1.5.4.1, 1.5.5.1

  Author: 	rebdog (Godfrey Livinsgtone godfrey@satelliteshop.co.nz)

  Copyright 2012, 2013

*/

class ModelCatalogTab extends Model {

	public function addTab($data) {

		$this->db->query("INSERT INTO " . DB_PREFIX . "tab SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', position = '" . (int)$data['position'] . "', show_empty = '" . (int)$data['show_empty'] . "'");

		$tab_id = $this->db->getLastId();

		foreach ($data['product_tab_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "tab_description SET tab_id = '" . (int)$tab_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
	}

	public function editTab($tab_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "tab SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', position = '" . (int)$data['position'] . "', show_empty = '" . (int)$data['show_empty'] . "' WHERE tab_id = '" . (int)$tab_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "tab_description WHERE tab_id = '" . (int)$tab_id . "'");

		foreach ($data['product_tab_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "tab_description SET tab_id = '" . (int)$tab_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}
	}

	public function deleteTab($tab_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "tab WHERE tab_id = '" . (int)$tab_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "tab_description WHERE tab_id = '" . (int)$tab_id . "'");
	}

	public function getTab($tab_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tab WHERE tab_id = '" . (int)$tab_id . "'");

		return $query->row;
	}

	public function getTabs($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "tab t LEFT JOIN " . DB_PREFIX . "tab_description td ON (t.tab_id = td.tab_id) WHERE td.language_id = '" . (int)$this->config->get('config_language_id') . "'";


		if (!empty($data['filter_name']) AND trim($data['filter_name'],' ')!= '' ) {
			$sql .= " AND LCASE(td.name) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
		}

		$sort_data = array(
			'td.name',
			't.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY td.name";
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
	}

	public function getTabDescriptions($tab_id) {
		$tab_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tab_description WHERE tab_id = '" . (int)$tab_id . "'");

		foreach ($query->rows as $result) {
			$tab_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $tab_data;
	}

	public function getTotalTabs() {

		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "tab");

		return $query->row['total'];

	}

	public function getTotalUsedTabs($tab_id) {

		$query = $this->db->query("SELECT COUNT(DISTINCT product_id) AS total FROM " . DB_PREFIX . "product_tab WHERE tab_id = '" . (int)$tab_id . "'");

		return $query->row['total'];
	}

}
?>