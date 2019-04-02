<?php
/**
 * @package		BroCart v.3.3.3
 * @author		Artur Larin
 * @copyright	Copyright (c) 22019, BroCart & FIA Ltd. (https://www.brocart.net/)
 * @license		https://opensource.org/licenses/GPL-3.0
 * @link		https://forum.brocart.net
*/

trait microData {	
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
	
	private function getSettings($code = '') {
		$configuration = array();
		$configuration = self::$cached->get('catalog.'.$code);
		if (!$configuration) {
			$this->initConnection();
			$query = self::$connection->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0' AND `code` = '" . $this->db->escape($code) . "'");
				foreach ($query->rows as $result) {
					if (!$result['serialized']) {
						$configuration[$result['key']] = $result['value'];
					} else {
						$configuration[$result['key']] = json_decode($result['value'], true);
					}
				}
			self::$cached->set('catalog.'.$code, $configuration);
		}
		return $configuration;
    }
	
	private function getProPath($product_id) {
		$pro_path = self::$cached->get('catalog.path.pro');
		if (!isset($pro_path[$product_id])) {
			$this->initConnection();
			$query = self::$connection->query("SELECT `category_id` FROM `" . DB_PREFIX . "product_to_category` WHERE product_id = '" . (int)$product_id . "' AND main_category = '1' ORDER BY main_category DESC LIMIT 1");			
			$pro_path[$product_id] = $this->getCatPath($query->num_rows ? (int)$query->row['category_id'] : 0);
			self::$cached->set('catalog.path.pro', $pro_path);
		}
		return $pro_path[$product_id];
	}	
	
	private function getCatPath($category_id) {
		$cat_path = self::$cached->get('catalog.path.cat');
		if (!isset($cat_path[$category_id])) {
			$this->initConnection();	
			$query = self::$connection->query("SELECT GROUP_CONCAT(`path_id` ORDER BY `level` SEPARATOR '_') AS trix FROM `" . DB_PREFIX . "category_path` WHERE category_id = '" . (int)$category_id . "' GROUP BY category_id");
			$cat_path[$category_id] = $query->num_rows ? $query->row['trix'] : 0;					
			self::$cached->set('catalog.path.cat', $cat_path);
		}
		return $cat_path[$category_id];		
	}
	
	public function getProduct($product_id, $language_id) {
		$this->initConnection();
		$query = self::$connection->query("SELECT DISTINCT p.product_id, p.price, p.quantity, p.model, p.sku, p.date_modified, pd.meta_title, pd.meta_description, pd.description, pd.name AS name, p.image, m.name AS manufacturer, p2c.category_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$language_id . "' AND p.status = '1' AND p.date_available <= NOW() AND p2c.main_category = '1'");

		if ($query->num_rows) {
			return array(
				'product_id'       => $query->row['product_id'],
				'name'             => $query->row['name'],
				'description'      => $this->rip_tags($query->row['description']),
				'meta_title'       => $query->row['meta_title'],
				'meta_description' => $query->row['meta_description'],
				'model'            => $query->row['model'],
				'sku'              => $query->row['sku'],
				'category'         => $this->getCategory($query->row['category_id'], $language_id),
				'quantity'         => $query->row['quantity'],
				'image'            => $query->row['image'],
				'manufacturer'     => $query->row['manufacturer'],
				'price'            => $query->row['price'],
				'rating'           => round($query->row['rating']),
				'reviews'          => $query->row['reviews'] ? $query->row['reviews'] : 0,
				'date_modified'    => $query->row['date_modified']
			);
		} else {
			return false;
		}
	}
	
	public function getCatName($category_id, $language_id) {
		$this->initConnection();
		$query = self::$connection->query("SELECT DISTINCT name FROM " . DB_PREFIX . "category_description WHERE category_id = '" . (int)$category_id . "' AND language_id = '" . (int)$language_id . "'");

		if ($query->num_rows) {
			return $query->row['name'];
		} else {
			return false;
		}
	}
	
	public function getInfoName($information_id, $language_id) {
		$this->initConnection();
		$query = self::$connection->query("SELECT DISTINCT title FROM " . DB_PREFIX . "information_description WHERE information_id = '" . (int)$information_id . "' AND language_id = '" . (int)$language_id . "'");

		if ($query->num_rows) {
			return $query->row['title'];
		} else {
			return false;
		}
	}
	
	public function getProName($product_id, $language_id) {
		$this->initConnection();
		$query = self::$connection->query("SELECT DISTINCT name FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$product_id . "' AND language_id = '" . (int)$language_id . "'");

		if ($query->num_rows) {
			return $query->row['name'];
		} else {
			return false;
		}
	}
	
	public function getBestReviewsByProId($product_id) {		
		$this->initConnection();
		$query = self::$connection->query("SELECT author, rating, text, date_added FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$product_id . "' AND status = '1' AND rating > '3' ORDER BY date_added DESC LIMIT 5");
		if ($query->num_rows) {
			return $query->rows;
		} else {
			return false;
		}		
	}
	
	private function rip_tags($string) {
		$string = strip_tags(preg_replace('/<[^>]*>/','',str_replace(array("&nbsp;","\n","\r"),"",html_entity_decode($string,ENT_QUOTES,'UTF-8'))));
		return $string; 
	}
	
	public function getCategory($category_id, $language_id) {
		$this->initConnection();
		$query = self::$connection->query("SELECT DISTINCT name FROM " . DB_PREFIX . "category_description WHERE category_id = '" . (int)$category_id . "' AND language_id = '" . (int)$language_id . "'");
		return $query->row['name'];
	}
	
	private function debug($line, $code = '') {
		$debug = fopen(DIR_LOGS . 'error.log', 'a');
		fwrite($debug, '['.date('G:i:s').'('.$line.')] ' . print_r($code, true) . "\n");
		fclose($debug);
	}
}