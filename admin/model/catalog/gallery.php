<?php
class ModelCatalogGallery extends Model {
	public function addGallery($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "gallery SET album_id = '" . (int)$data['album_id'] . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");
		$gallery_id = $this->db->getLastId();
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "gallery SET image = '" . $this->db->escape($data['image']) . "' WHERE gallery_id = '" . (int)$gallery_id . "'");
		}
		foreach ($data['gallery_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_description SET gallery_id = '" . (int)$gallery_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		if (isset($data['gallery_image'])) {
			foreach ($data['gallery_image'] as $key => $image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_image SET gallery_id = '" . (int)$gallery_id . "', image = '" . $this->db->escape($image) . "', image_title = '" . $this->db->escape($data['gallery_image_title'][$key]) . "'");
			}
		}
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'gallery_id=" . (int)$gallery_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		$this->cache->delete('gallery');
	}

	public function editGallery($gallery_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "gallery SET album_id = '" . (int)$data['album_id'] . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_description WHERE gallery_id = '" . (int)$gallery_id . "'");
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "gallery SET image = '" . $this->db->escape($data['image']) . "' WHERE gallery_id = '" . (int)$gallery_id . "'");
		}
		foreach ($data['gallery_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_description SET gallery_id = '" . (int)$gallery_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_image WHERE gallery_id = '" . (int)$gallery_id . "'");
		if (isset($data['gallery_image'])) {
			foreach ($data['gallery_image'] as $key => $image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "gallery_image SET gallery_id = '" . (int)$gallery_id . "', image = '" . $this->db->escape($image) . "', image_title = '" . $this->db->escape($data['gallery_image_title'][$key]) . "'");
			}
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'gallery_id=" . (int)$gallery_id. "'");
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'gallery_id=" . (int)$gallery_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		$this->cache->delete('gallery');
	}

	public function deleteGallery($gallery_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_description WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "gallery_image WHERE gallery_id = '" . (int)$gallery_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'gallery_id=" . (int)$gallery_id . "'");
		$this->cache->delete('gallery');
	}

	public function getGallery($gallery_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'gallery_id=" . (int)$gallery_id . "' LIMIT 1) AS keyword FROM " . DB_PREFIX . "gallery WHERE gallery_id = '" . (int)$gallery_id . "'");
		return $query->row;
	}

	public function getGalleryDescriptions($gallery_id) {
		$gallery_description_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_description WHERE gallery_id = '" . (int)$gallery_id . "'");
		foreach ($query->rows as $result) {
			$gallery_description_data[$result['language_id']] = array(
				'name'        => $result['name'],
				'description' => $result['description']
			);
		}
		return $gallery_description_data;
	}

	public function getGalleryImages($gallery_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery_image WHERE gallery_id = '" . (int)$gallery_id . "'");
		return $query->rows;
	}

	public function getGalleries($album_id) {
		$gallery_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery g LEFT JOIN " . DB_PREFIX . "gallery_description gd ON (g.gallery_id = gd.gallery_id) WHERE g.album_id = '" . (int)$album_id . "' AND gd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY g.sort_order, gd.name ASC");
		foreach ($query->rows as $result) {
			$gallery_data[] = array(
				'gallery_id'   => $result['gallery_id'],
				'name'         => $this->getAlbum($result['gallery_id'], $this->config->get('config_language_id')),
				'status'       => $result['status'],
				'sort_order'   => $result['sort_order']
			);
			$gallery_data = array_merge($gallery_data, $this->getGalleries($result['gallery_id']));
		}
		return $gallery_data;
	}

	public function getAlbum($gallery_id) {
		$query = $this->db->query("SELECT name, status, album_id FROM " . DB_PREFIX . "gallery g LEFT JOIN " . DB_PREFIX . "gallery_description gd ON (g.gallery_id = gd.gallery_id) WHERE g.gallery_id = '" . (int)$gallery_id . "' AND gd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY g.sort_order, gd.name ASC");
		$gallery_info = $query->row;
		if ($gallery_info['album_id']) {
			return $this->getAlbum($gallery_info['album_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $gallery_info['name'];
		} else {
			return $gallery_info['name'];
		}
	}

	public function getTotalGalleries() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "gallery");
		return $query->row['total'];
	}

	public function checkGalleries() {
		$create_gallery = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "gallery` (`gallery_id` int(11) NOT NULL auto_increment, `image` varchar(255) COLLATE utf8_general_ci NOT NULL, `album_id` int(11) NOT NULL default '0', `sort_order` int(3) default '0', `status` int(1) NOT NULL default '0', `date_added` datetime default NULL, `date_modified` datetime default NULL, PRIMARY KEY  (`gallery_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;";
		$this->db->query($create_gallery);
		$create_gallery_descriptions = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "gallery_description` (`gallery_id` int(11) NOT NULL default '0', `language_id` int(11) NOT NULL default '1', `name` varchar(32) COLLATE utf8_general_ci NOT NULL, `description` text COLLATE utf8_general_ci NOT NULL, PRIMARY KEY  (`gallery_id`,`language_id`), KEY `name` (`name`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;";
		$this->db->query($create_gallery_descriptions);
		$create_gallery_images = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "gallery_image` (`gallery_image_id` int(11) NOT NULL auto_increment, `gallery_id` int(11) NOT NULL default '0', `image` varchar(255) COLLATE utf8_general_ci NOT NULL, `image_title` varchar(255) COLLATE utf8_general_ci NOT NULL, PRIMARY KEY  (`gallery_image_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci AUTO_INCREMENT=1;";
		$this->db->query($create_gallery_images);
	}
}
?>