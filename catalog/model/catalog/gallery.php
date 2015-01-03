<?php
class ModelCatalogGallery extends Model {
	public function getGallery($gallery_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "gallery g LEFT JOIN " . DB_PREFIX . "gallery_description gd ON (g.gallery_id = gd.gallery_id) WHERE g.gallery_id = '" . (int)$gallery_id . "' AND gd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		return $query->row;
	}

	public function getGalleries($album_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gallery g LEFT JOIN " . DB_PREFIX . "gallery_description gd ON (g.gallery_id = gd.gallery_id) WHERE g.album_id = '" . (int)$album_id . "' AND gd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY g.sort_order");
		return $query->rows;
	}

	public function getTotalGalleriesByGalleryId($album_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "gallery WHERE album_id = '" . (int)$album_id . "'");
		return $query->row['total'];
	}

	public function getGalleryImages($gallery_id, $start = 0, $limit = 20) {
		$sql = "SELECT * FROM " . DB_PREFIX . "gallery_image WHERE gallery_id = '" . (int)$gallery_id . "' ORDER BY gallery_image_id";
		$sql .= " LIMIT " . (int)$start . "," . (int)$limit;
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getTotalImagesByGalleryId($gallery_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "gallery_image WHERE gallery_id = '" . (int)$gallery_id . "'");
		return $query->row['total'];
	}

	public function getTotalGalleries() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "gallery WHERE status = '1'");
		return $query->row['total'];
	}
}
?>