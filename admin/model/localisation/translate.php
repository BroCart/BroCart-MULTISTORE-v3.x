<?php
/**
 * Database Language Editor
 * SQL-based Language Editor for Opencart
 * 
 * v2.0.1 FREE
 **/
class ModelLocalisationTranslate extends Model {
	public function import($interface, $directory, $filename) {
		$count = 0;
		$interfaces = $this->getInterfaces();
		$file = $interfaces[$interface]['langdir'].$directory.'/'.$filename.'.php';
		if(is_file($file)) {
			$_ = array();
			require($file);
			foreach($_ as $k => $v) {
				$data = array(
					'interface'	=> $interface,
					'directory'	=> $directory,
					'filename'	=> $filename,
					'key'		=> $k,
					'value'		=> $v
				);
				if(!$translation = $this->getTranslationByData($data)) {
					$id = $this->insert($data);
					$count++;
				}
				else {
					$id = $translation['translation_id'];
				}
			}
		}
		return $count;
	}
	public function insert($data) {
		$this->db->query("INSERT INTO ".DB_PREFIX."translate
							SET `interface` = '".$this->db->escape($data['interface'])."',
							`directory` = '".$this->db->escape($data['directory'])."',
							`filename` = '".$this->db->escape($data['filename'])."',
							`key` = '".$this->db->escape($data['key'])."',
							`value` = '".$this->db->escape($data['value'])."'");
		return $this->db->getLastId();
	}
	public function update($translation_id, $value) {
		$this->db->query("UPDATE ".DB_PREFIX."translate
							SET `value` = '".$this->db->escape($value)."'
							WHERE `translation_id` = '".(int)$translation_id."'");
	}
	public function delete($translation_id) {
		$this->db->query("DELETE FROM ".DB_PREFIX."translate
							WHERE `translation_id` = '".(int)$translation_id."'");
	}
	public function getTranslation($translation_id) {
		$query = $this->db->query("SELECT *, (`value` = `original`) AS `status` FROM ".DB_PREFIX."translate
									WHERE `translation_id` = '".(int)$translation_id."'");
		return $query->row;
	}
	public function getTranslationByData($data) {
		$query = $this->db->query("SELECT *, (`value` = `original`) AS `status` FROM ".DB_PREFIX."translate
									WHERE `interface` = '".$this->db->escape($data['interface'])."'
									AND `directory` = '".$this->db->escape($data['directory'])."'
									AND `filename` = '".$this->db->escape($data['filename'])."'
									AND `key` = '".$this->db->escape($data['key'])."'");
		return $query->row;
		
	}
	public function getTranslations($data = array()) {
		$sql = "SELECT *, (`value` = `original`) AS `status` FROM " . DB_PREFIX . "translate";

		$implode = array();
		
		if (!empty($data['filter_interface'])) {
			$implode[] = "`interface` = '" . $this->db->escape(utf8_strtolower($data['filter_interface'])) . "'";
		}
		
		if (!empty($data['filter_directory'])) {
			$implode[] = "`directory` = '" . $this->db->escape(utf8_strtolower($data['filter_directory'])) . "'";
		}
		
		if (!empty($data['filter_filename'])) {
			$implode[] = "`filename` LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_filename'])) . "%'";
		}
		
		if (!empty($data['filter_key'])) {
			$implode[] = "`key` LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_key'])) . "%'";
		}
		
		if (!empty($data['filter_value'])) {
			$implode[] = "`value` LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_value'])) . "%'";
		}
		
		if (isset($data['filter_status'])) {
			if($data['filter_status'] == 'equals') $implode[] = "`value` = `original`";
			elseif($data['filter_status'] == 'differs') $implode[] = "`value` <> `original`";
			elseif($data['filter_status'] == 'new') $implode[] = "`original` IS NULL";
		}
		
		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}
		
		$sort_data = array(
			'interface',
			'directory',
			'filename',
			'key',
			'value',
			'status'			
		);
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY `".$data['sort']."`";	
		} else {
			$sql .= " ORDER BY `key`";	
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
	public function getTotalTranslations($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "translate";
		
		$implode = array();
		
		if (!empty($data['filter_interface'])) {
			$implode[] = "`interface` = '" . $this->db->escape(utf8_strtolower($data['filter_interface'])) . "'";
		}
		
		if (!empty($data['filter_directory'])) {
			$implode[] = "`directory` = '" . $this->db->escape(utf8_strtolower($data['filter_directory'])) . "'";
		}
		
		if (!empty($data['filter_filename'])) {
			$implode[] = "`filename` LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_filename'])) . "%'";
		}
		
		if (!empty($data['filter_key'])) {
			$implode[] = "`key` LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_key'])) . "%'";
		}
		
		if (!empty($data['filter_value'])) {
			$implode[] = "`value` LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_value'])) . "%'";
		}
		
		if (isset($data['filter_status'])) {
			if($data['filter_status'] == 'equals') $implode[] = "`value` = `original`";
			elseif($data['filter_status'] == 'differs') $implode[] = "`value` <> `original`";
			elseif($data['filter_status'] == 'new') $implode[] = "`original` IS NULL";
		}
		
		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}
				
		$query = $this->db->query($sql);
				
		return $query->row['total'];
	}
	public function getInterfaces() {
		$interfaces = array();
		$interfaces[basename(DIR_APPLICATION)] = array('name' => basename(DIR_APPLICATION), 'langdir' => DIR_LANGUAGE);
		$interfaces[basename(DIR_CATALOG)] = array('name' => basename(DIR_CATALOG), 'langdir' => DIR_CATALOG.'language/');
		return $interfaces;
	}
	public function getLanguages() {
		$languages = array();
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."language");
		foreach($query->rows as $language) {
			$languages[$language['directory']] = array(
				'directory' => $language['directory'],
				'filename' => $language['filename'],
				'name' => $language['name'],
				'image' => 'view/image/flags/'.$language['image']);
		}
		return $languages;
	}
	public function checkTable() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `".DB_PREFIX."translate` (
							`translation_id` int(11) NOT NULL AUTO_INCREMENT,
							`interface` varchar(32) NOT NULL,
							`directory` varchar(32) NOT NULL,
							`filename` varchar(128) NOT NULL,
							`key` varchar(128) NOT NULL,
							`value` text NOT NULL,
							`original` blob,
							PRIMARY KEY (`translation_id`),
							KEY `key` (`key`),
							KEY `path` (`interface`,`directory`,`filename`),
							FULLTEXT KEY `value` (`value`)
						) ENGINE=MyISAM  DEFAULT CHARSET=utf8");
		$query = $this->db->query("SHOW COLUMNS FROM `".DB_PREFIX."translate` LIKE 'original'");
		if(!$query->row) {
			$this->db->query("ALTER TABLE `".DB_PREFIX."translate` ADD COLUMN `original` blob");
			$this->db->query("ALTER TABLE `".DB_PREFIX."translate` DROP KEY `interface`");
			$this->db->query("ALTER TABLE `".DB_PREFIX."translate` DROP KEY `directory`");
			$this->db->query("ALTER TABLE `".DB_PREFIX."translate` DROP KEY `filename`");
			$this->db->query("ALTER TABLE `".DB_PREFIX."translate` ADD KEY `path` (`interface`,`directory`,`filename`)");
		}
		return true;
	}
	public function resetOriginal() {
		$this->db->query("UPDATE ".DB_PREFIX."translate SET `original` = NULL");
	}
}
?>