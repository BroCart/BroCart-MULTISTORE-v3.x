<?php

/**
 * @package		BroCart v.3.3.3
 * @author		Artur Larin
 * @copyright	Copyright (c) 22019, BroCart & FIA Ltd. (https://www.brocart.net/)
 * @license		https://opensource.org/licenses/GPL-3.0
 * @link		https://forum.brocart.net
*/

trait seoHelper {
	private static $connection;
	protected static $cached;

	public function __construct() {
		if (!defined('DB_DRIVER')) exit();
		self::$cached = new Cache('file', 3600);	
    }

	private function initConnection() {		
        if (is_null(self::$connection)) {
            self::$connection = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE, DB_PORT);
        }
    }
	
	private function cleaner($data) {
		if (is_array($data)) {
			foreach ($data as $key => $value) {
				unset($data[$key]);
				$data[self::cleaner($key)] = self::cleaner($value);
			}
		} else {
			$data = htmlspecialchars($data, ENT_COMPAT, 'UTF-8');
		}
		return $data;
	}
	
	public function getLanguagesStack() {
		$language = self::$cached->get('catalog.seolang');		
		if (!$language) {
			$this->initConnection();
			$query = self::$connection->query("SELECT * FROM " . DB_PREFIX . "language WHERE status = '1' ORDER BY sort_order, name");
			foreach ($query->rows as $result) {
				$language[$result['code']] = array(
					'language_id'	=> $result['language_id'],
					'name'			=> $result['name'],
					'prefix'		=> $result['prefix'],
					'code'			=> $result['code']
				);				
			}
			self::$cached->set('catalog.seolang', $language);
		}
		return $language;
	}
	
	private function getProPath($product_id, $include = 'full') {
		$pro_path = self::$cached->get('catalog.path.pro');
		if (!isset($pro_path[$product_id])) {
			$this->initConnection();
			$query = self::$connection->query("SELECT `category_id` FROM `" . DB_PREFIX . "product_to_category` WHERE product_id = '" . (int)$product_id . "' AND main_category = '1' ORDER BY main_category DESC LIMIT 1");
			if ($include == 'full') {
				$pro_path[$product_id] = $this->getCatPath($query->num_rows ? (int)$query->row['category_id'] : 0, $include);
			} elseif ($include == 'last') {
				$pro_path[$product_id] = $query->num_rows ? (int)$query->row['category_id'] : 0;			
			} else {
				return false;
			}			
			self::$cached->set('catalog.path.pro', $pro_path);
		}
		return $pro_path[$product_id];
	}
	
	private function getCatPath($category_id, $include = 'full') {
		$cat_path = self::$cached->get('catalog.path.cat');
		if (!isset($cat_path[$category_id])) {
			$this->initConnection();			
			if ($include == 'full') {	
				$query = self::$connection->query("SELECT GROUP_CONCAT(`path_id` ORDER BY `level` SEPARATOR '_') AS trix FROM `" . DB_PREFIX . "category_path` WHERE category_id = '" . (int)$category_id . "' GROUP BY category_id");
				$cat_path[$category_id] = $query->num_rows ? $query->row['trix'] : 0;
			} elseif ($include == 'last') {
				$query = self::$connection->query("SELECT `parent_id` AS trix FROM `" . DB_PREFIX . "category` WHERE category_id = '" . (int)$category_id . "' GROUP BY category_id");
				if ($query->num_rows) {
					if (!$query->row['trix']) {
						$cat_path[$category_id] = $category_id;
					} else {
						$cat_path[$category_id] = $query->row['trix'].'_'.$category_id;
					}
				}
			} else {
				$cat_path[$category_id] = $category_id;
			}			
			self::$cached->set('catalog.path.cat', $cat_path);
		}
		return $cat_path[$category_id];		
	}
	
	private function getSeoDataByLangId($lang_id) {
		$lang_data = $this->cache->get('catalog.seo_bro.0.'.(int)$lang_id);
		if (!$lang_data) {
			$this->initConnection();
			$query = self::$connection->query("SELECT LOWER(`keyword`) as 'keyword', `query` FROM " . DB_PREFIX . "seo_url WHERE store_id = '0' AND language_id = '".(int)$lang_id."' ORDER BY seo_url_id");
			foreach ($query->rows as $row) {
				$lang_data['keywords'][$row['keyword']] = $row['query'];
				$lang_data['queries'][$row['query']] = $row['keyword'];
			}
			$this->cache->set('catalog.seo_bro.0.'.(int)$lang_id, $lang_data);
		}		
		return $lang_data;
	}
	
	private function checked($keyw) {
		$lang_data = array();
		$this->initConnection();
		$query = self::$connection->query("SELECT `query` FROM " . DB_PREFIX . "seo_url WHERE store_id = '0' AND keyword = '" . self::$connection->escape($keyw) . "' LIMIT 1");
		foreach ($query->rows as $row) {
			$lang_data['keywords'][$keyw] = $row['query'];
			$lang_data['queries'][$row['query']] = $keyw;
		}	
		if (isset($lang_data['keywords'][$keyw])) {
			return array('keyword' => $keyw, 'query' => $lang_data['keywords'][$keyw]);			
		} else {
			return false;
		}
	}
	
	private function getLanguageByKeyword($keyword) {
		$keyword_data = self::$cached->get('catalog.keystack.0');
		if (!isset($keyword_data[$keyword])) {
			$this->initConnection();
			$query = self::$connection->query("SELECT language_id, `query` FROM " . DB_PREFIX . "seo_url WHERE `keyword` = '" . self::$connection->escape($keyword) . "'");
			if ($query->num_rows) {
				foreach ($query->rows as $row) {
					$keyword_data[$keyword] = $row['language_id'];
				}
				$this->cache->set('catalog.keystack.0', $keyword_data);
			}
		}
		return $keyword_data[$keyword];
	}
}