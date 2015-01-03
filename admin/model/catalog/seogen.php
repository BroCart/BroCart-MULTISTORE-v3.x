<?php
class ModelCatalogSeogen extends Model {

	public function title($data, $lang) {
	
		$query = $this->db->query("SELECT pd.name as pname, p.model as model, p.price as price, cd.name as cname, pd.language_id as language_id, pd.product_id as product_id,  m.name as brand FROM " . DB_PREFIX . "product_description pd
		LEFT JOIN " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
		INNER JOIN " . DB_PREFIX . "product p on pd.product_id = p.product_id
		LEFT JOIN " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id AND cd.language_id = ".$lang."
		LEFT JOIN " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id;");
				
		foreach ($query->rows as $product) {
			
			$product['price'] = $this->currency->format($product['price']);
			
			$needle = Array($product['pname'], $product['model'], $product['price'], $product['cname'], $product['brand']);
			
			$searchArray = array('{name}', '{model}', '{price}', '{catname}', '{brand}');			
				
			$replace = str_replace($searchArray, $needle, $data);
				
			$ch2s = $replace;				
				
			$this->db->query("UPDATE " . DB_PREFIX . "product_description SET u_title = '". htmlspecialchars($ch2s) ."' WHERE product_id = ".$product['product_id']." AND language_id = ".(int)$lang.";");
			
		} 
		
		return;
		
	}
	
	public function desc($data, $lang) {
	
		$query = $this->db->query("SELECT pd.name as pname, p.model as model, p.price as price, cd.name as cname, pd.language_id as language_id, pd.product_id as product_id,  m.name as brand FROM " . DB_PREFIX . "product_description pd
		LEFT JOIN " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
		INNER JOIN " . DB_PREFIX . "product p on pd.product_id = p.product_id
		LEFT JOIN " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id AND cd.language_id = ".$lang."
		LEFT JOIN " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id;");
				
		foreach ($query->rows as $product) {
		
			$product['price'] = $this->currency->format($product['price']);
		
			$needle = Array($product['pname'], $product['model'], $product['price'], $product['cname'], $product['brand']);
			
			$searchArray = array('{name}', '{model}', '{price}', '{catname}', '{brand}');			
				
			$replacedesc = str_replace($searchArray, $needle, $data);
							
			$ch1s = $replacedesc;
				
			$this->db->query("UPDATE " . DB_PREFIX . "product_description SET meta_description = '". htmlspecialchars($ch1s) ."' WHERE product_id = ".$product['product_id']." AND language_id = ".(int)$lang.";");
		} 
		
		return;
	}
	
	public function keyw($data, $lang) {
	
		$query = $this->db->query("SELECT pd.name as pname, p.model as model, p.price as price, cd.name as cname, pd.language_id as language_id, pd.product_id as product_id,  m.name as brand FROM " . DB_PREFIX . "product_description pd
		LEFT JOIN " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
		INNER JOIN " . DB_PREFIX . "product p on pd.product_id = p.product_id
		LEFT JOIN " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id AND cd.language_id = ".$lang."
		LEFT JOIN " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id;");
				
		foreach ($query->rows as $product) {
			
			$product['price'] = $this->currency->format($product['price']);
			
			$needle = Array($product['pname'], $product['model'], $product['price'], $product['cname'], $product['brand']);
			
			$searchArray = array('{name}', '{model}', '{price}', '{catname}', '{brand}');			
				
			$replacekey = str_replace($searchArray, $needle, $data);
				
			$keywords = $replacekey;
				
			$this->db->query("UPDATE " . DB_PREFIX . "product_description SET meta_keyword = '". htmlspecialchars($keywords) ."' WHERE product_id = ".$product['product_id']." AND language_id = ".(int)$lang.";");
			
		} 
		
		return;
	
	}
	
	public function h1($data, $lang) {
		
		$query = $this->db->query("SELECT pd.name as pname, p.model as model, p.price as price, cd.name as cname, pd.language_id as language_id, pd.product_id as product_id,  m.name as brand FROM " . DB_PREFIX . "product_description pd
		LEFT JOIN " . DB_PREFIX . "product_to_category pc on pd.product_id = pc.product_id
		INNER JOIN " . DB_PREFIX . "product p on pd.product_id = p.product_id
		LEFT JOIN " . DB_PREFIX . "category_description cd on cd.category_id = pc.category_id AND cd.language_id = ".$lang."
		LEFT JOIN " . DB_PREFIX . "manufacturer m on m.manufacturer_id = p.manufacturer_id;");
				
		foreach ($query->rows as $product) {
			
			$needle = Array($product['pname'], $product['model'], $product['price'], $product['cname'], $product['brand']);
			
			$searchArray = array('{name}', '{model}', '{price}', '{catname}', '{brand}');			
				
			$replaceh1 = str_replace($searchArray, $needle, $data);
				
			$ch2sh1 = $replaceh1;
				
			$this->db->query("UPDATE " . DB_PREFIX . "product_description SET u_h1 = '". htmlspecialchars($ch2sh1) ."' WHERE product_id = ".$product['product_id']." AND language_id = ".(int)$lang.";");
			
		} 
		
		return;
		
	}

	public function rewrite() {
	
		$ende = "";
	
		$query = $this->db->query("SELECT `product_id`, `name` FROM `" . DB_PREFIX . "product_description`");
		
		foreach ($query->rows as $row) {
		
			$gebuk = $this->seo($row['name']);
		
			$query_alias = $this->db->query("SELECT `url_alias_id`, `query`, `keyword` FROM `" . DB_PREFIX . "url_alias` WHERE `query` = 'product_id=".((int)$row['product_id'])."'");
			
			if ($query_alias->num_rows) {
				$this->db->query("UPDATE `" . DB_PREFIX . "url_alias` SET `keyword` = '".$this->db->escape($gebuk).$this->db->escape($ende)."' WHERE `query` = 'product_id=".((int)$row['product_id'])."'");
			} else {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` (`query`, `keyword`) VALUES ('product_id=".((int)$row['product_id'])."', '".$this->db->escape($gebuk).$this->db->escape($ende)."')");
			}
		}
						
		return true;
	}
	
	public function unwrite() { 
	
		$ende = "";
	
		$query = $this->db->query("SELECT `product_id`, `name` FROM `" . DB_PREFIX . "product_description`");
		 
		foreach ($query->rows as $row) {
		
			$gebuk = $this->seo($row['name']);
		
			$query_alias = $this->db->query("SELECT `url_alias_id`, `query`, `keyword` FROM `" . DB_PREFIX . "url_alias` WHERE `query` = 'product_id=".((int)$row['product_id'])."'");
			
			if (!$query_alias->num_rows) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` (`query`, `keyword`) VALUES ('product_id=".((int)$row['product_id'])."', '".$this->db->escape($gebuk).$this->db->escape($ende)."')");
			}
		}
		
		$this->cache->delete('seo_bro');				
		$this->cache->delete('product.seopath');
		
		return true;    	
	  }
	  
	public function cattitle($data, $lang) { 
		
		$query = $this->db->query("SELECT category_id, name FROM " . DB_PREFIX . "category_description WHERE language_id = '".$lang."'");
				
		foreach ($query->rows as $row) {
		
			$sql2 = $this->db->query("SELECT DISTINCT p.manufacturer_id AS manufacturer_id, m.name AS manufacturer_name FROM " . DB_PREFIX . "product p 
			LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) 
			LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) 
			WHERE p.status = '1' AND p.date_available <= NOW() AND p2c.category_id = '" . (int)$row['category_id'] . "' ORDER BY `m`.`name` ASC");
			
			if ($sql2->num_rows) {
				
				$needle = Array($sql2->row['manufacturer_name']);
			
				$searchArray = array('{brand}');			
					
				$data2 = str_replace($searchArray, $needle, $data);
				
			} else {
			
				$needle = Array('');
			
				$searchArray = array('{brand}');			
					
				$data2 = str_replace($searchArray, $needle, $data);
				
			}
			
			$query3 = $this->db->query("SELECT round(min(price)) as min, round(max(price)) as max FROM " . DB_PREFIX . "product P
            JOIN " . DB_PREFIX . "product_to_category POC
            on POC.product_id = P.product_id
            WHERE POC.category_id = '" . (int)$row['category_id'] . "' AND P.status = 1");
			
			if ($query3->num_rows) {
			
				$min = $this->currency->format($query3->row['min']);
				
				$max = $this->currency->format($query3->row['max']);
			
				$needle = Array($min, $max);
			
				$searchArray = array('{min}', '{max}');
			
				$data3 = str_replace($searchArray, $needle, $data2);
			
			}
			
			$store = $this->config->get('config_name');
			
			$needle = Array($row['name'], $store);
			
			$searchArray = array('{name}', '{store}');			
				
			$data4 = str_replace($searchArray, $needle, $data3);
				
			$ch2s = $data4;				
				
			$this->db->query("UPDATE " . DB_PREFIX . "category_description SET u_title = '". htmlspecialchars($ch2s) ."' WHERE category_id = ".(int)$row['category_id']." AND language_id = ".(int)$lang.";");
			
		} 
		
		return;
		
	}
	
	public function prodesc($data, $lang) { 
		
		$query = $this->db->query("SELECT category_id,name FROM " . DB_PREFIX . "category_description WHERE language_id = '".$lang."'");
				
		foreach ($query->rows as $row) {
		
			$sql2 = $this->db->query("SELECT DISTINCT p.manufacturer_id AS manufacturer_id, m.name AS manufacturer_name FROM " . DB_PREFIX . "product p 
			LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) 
			LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) 
			WHERE p.status = '1' AND p.date_available <= NOW() AND p2c.category_id = '" . (int)$row['category_id'] . "' ORDER BY `m`.`name` ASC");
			
			if ($sql2->num_rows) {
				
				$needle = Array($sql2->row['manufacturer_name']);
			
				$searchArray = array('{brand}');			
					
				$data2 = str_replace($searchArray, $needle, $data);
				
			} else {
			
				$needle = Array('');
			
				$searchArray = array('{brand}');			
					
				$data2 = str_replace($searchArray, $needle, $data);
				
			}
			
			$query3 = $this->db->query("SELECT round(min(price)) as min, round(max(price)) as max FROM " . DB_PREFIX . "product P
            JOIN " . DB_PREFIX . "product_to_category POC
            on POC.product_id = P.product_id
            WHERE POC.category_id = '" . (int)$row['category_id'] . "' AND P.status = 1");
			
			if ($query3->num_rows) {
			
				$min = $this->currency->format($query3->row['min']);
				
				$max = $this->currency->format($query3->row['max']);
			
				$needle = Array($min, $max);
			
				$searchArray = array('{min}', '{max}');
			
				$data3 = str_replace($searchArray, $needle, $data2);
			
			}
			
			$store = $this->config->get('config_name');
			
			$needle = Array($row['name'], $store);
			
			$searchArray = array('{name}', '{store}');			
				
			$data4 = str_replace($searchArray, $needle, $data3);
				
			$ch2s = $data4;				
				
			$this->db->query("UPDATE " . DB_PREFIX . "category_description SET meta_description = '". htmlspecialchars($ch2s) ."' WHERE category_id = ".(int)$row['category_id']." AND language_id = ".(int)$lang.";");
			
		} 
		
		return;
		
	}
	
	public function prokey($data, $lang) { 
		
		$query = $this->db->query("SELECT category_id,name FROM " . DB_PREFIX . "category_description WHERE language_id = '".$lang."'");
				
		foreach ($query->rows as $row) {
		
			$sql2 = $this->db->query("SELECT DISTINCT p.manufacturer_id AS manufacturer_id, m.name AS manufacturer_name FROM " . DB_PREFIX . "product p 
			LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) 
			LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) 
			WHERE p.status = '1' AND p.date_available <= NOW() AND p2c.category_id = '" . (int)$row['category_id'] . "' ORDER BY `m`.`name` ASC");
			
			if ($sql2->num_rows) {
				
				$needle = Array($sql2->row['manufacturer_name']);
			
				$searchArray = array('{brand}');			
					
				$data2 = str_replace($searchArray, $needle, $data);
				
			} else {
			
				$needle = Array('');
			
				$searchArray = array('{brand}');			
					
				$data2 = str_replace($searchArray, $needle, $data);
				
			}
			
			$query3 = $this->db->query("SELECT round(min(price)) as min, round(max(price)) as max FROM " . DB_PREFIX . "product P
            JOIN " . DB_PREFIX . "product_to_category POC
            on POC.product_id = P.product_id
            WHERE POC.category_id = '" . (int)$row['category_id'] . "' AND P.status = 1");
			
			if ($query3->num_rows) {
			
				$min = $this->currency->format($query3->row['min']);
				
				$max = $this->currency->format($query3->row['max']);
			
				$needle = Array($min, $max);
			
				$searchArray = array('{min}', '{max}');
			
				$data3 = str_replace($searchArray, $needle, $data2);
			
			}
			
			$store = $this->config->get('config_name');
			
			$needle = Array($row['name'], $store);
			
			$searchArray = array('{name}', '{store}');			
				
			$data4 = str_replace($searchArray, $needle, $data3);
				
			$ch2s = $data4;				
				
			$this->db->query("UPDATE " . DB_PREFIX . "category_description SET meta_keyword = '". htmlspecialchars($ch2s) ."' WHERE category_id = ".(int)$row['category_id']." AND language_id = ".(int)$lang.";");
			
		} 
		
		return;
		
	}
	
	public function proh1($data, $lang) { 
		
		$query = $this->db->query("SELECT category_id,name FROM " . DB_PREFIX . "category_description WHERE language_id = '".$lang."'");
				
		foreach ($query->rows as $row) {
		
			$sql2 = $this->db->query("SELECT DISTINCT p.manufacturer_id AS manufacturer_id, m.name AS manufacturer_name FROM " . DB_PREFIX . "product p 
			LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) 
			LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) 
			WHERE p.status = '1' AND p.date_available <= NOW() AND p2c.category_id = '" . (int)$row['category_id'] . "' ORDER BY `m`.`name` ASC");
			
			if ($sql2->num_rows) {
				
				$needle = Array($sql2->row['manufacturer_name']);
			
				$searchArray = array('{brand}');			
					
				$data2 = str_replace($searchArray, $needle, $data);
				
			} else {
			
				$needle = Array('');
			
				$searchArray = array('{brand}');			
					
				$data2 = str_replace($searchArray, $needle, $data);
				
			}
			
			$query3 = $this->db->query("SELECT round(min(price)) as min, round(max(price)) as max FROM " . DB_PREFIX . "product P
            JOIN " . DB_PREFIX . "product_to_category POC
            on POC.product_id = P.product_id
            WHERE POC.category_id = '" . (int)$row['category_id'] . "' AND P.status = 1");
			
			if ($query3->num_rows) {
			
				$min = $this->currency->format($query3->row['min']);
				
				$max = $this->currency->format($query3->row['max']);
			
				$needle = Array($min, $max);
			
				$searchArray = array('{min}', '{max}');
			
				$data3 = str_replace($searchArray, $needle, $data2);
			
			}
			
			$store = $this->config->get('config_name');
			
			$needle = Array($row['name'], $store);
			
			$searchArray = array('{name}', '{store}');			
				
			$data4 = str_replace($searchArray, $needle, $data3);
				
			$ch2s = $data4;				
				
			$this->db->query("UPDATE " . DB_PREFIX . "category_description SET u_h1 = '". htmlspecialchars($ch2s) ."' WHERE category_id = ".(int)$row['category_id']." AND language_id = ".(int)$lang.";");
			
		} 
		
		return;
		
	}
	
	private function seo($name) {
	
		return $this->toAscii(html_entity_decode($name));
			
	}

	private function toAscii($string) {
		// ua
		$source[] = '/а/'; $replace[] = 'a';
		$source[] = '/б/'; $replace[] = 'b';
		$source[] = '/в/'; $replace[] = 'v';
		$source[] = '/г/'; $replace[] = 'g';
		$source[] = '/ґ/'; $replace[] = 'g';
		$source[] = '/д/'; $replace[] = 'd';
		$source[] = '/е/'; $replace[] = 'e';
		$source[] = '/є/'; $replace[] = 'ye';
		$source[] = '/ж/'; $replace[] = 'zh';
		$source[] = '/з/'; $replace[] = 'z';
		$source[] = '/и/'; $replace[] = 'i';
		$source[] = '/і/'; $replace[] = 'i';
		$source[] = '/ї/'; $replace[] = 'yi';
		$source[] = '/й/'; $replace[] = 'j';
		$source[] = '/к/'; $replace[] = 'k';
		$source[] = '/л/'; $replace[] = 'l';
		$source[] = '/м/'; $replace[] = 'm';
		$source[] = '/н/'; $replace[] = 'n';
		$source[] = '/о/'; $replace[] = 'o';
		$source[] = '/п/'; $replace[] = 'p';
		$source[] = '/р/'; $replace[] = 'r';
		$source[] = '/с/'; $replace[] = 's';
		$source[] = '/т/'; $replace[] = 't';
		$source[] = '/у/'; $replace[] = 'y';
		$source[] = '/ф/'; $replace[] = 'f';
		$source[] = '/х/'; $replace[] = 'h';
		$source[] = '/ц/'; $replace[] = 'c';
		$source[] = '/ч/'; $replace[] = 'ch';
		$source[] = '/ш/'; $replace[] = 'sh';
		$source[] = '/щ/'; $replace[] = 'shh';
		$source[] = '/ь/'; $replace[] = '';
		$source[] = '/ю/'; $replace[] = 'yu';
		$source[] = '/я/'; $replace[] = 'ya';
		$source[] = '/э/'; $replace[] = 'e';
		$source[] = '/ы/'; $replace[] = 'u';

		// UA
		$source[] = '/А/'; $replace[] = 'a';
		$source[] = '/Б/'; $replace[] = 'b';
		$source[] = '/В/'; $replace[] = 'v';
		$source[] = '/Г/'; $replace[] = 'g';
		$source[] = '/Ґ/'; $replace[] = 'g';
		$source[] = '/Д/'; $replace[] = 'd';
		$source[] = '/Е/'; $replace[] = 'e';
		$source[] = '/Є/'; $replace[] = 'ye';
		$source[] = '/Ж/'; $replace[] = 'zh';
		$source[] = '/З/'; $replace[] = 'z';
		$source[] = '/И/'; $replace[] = 'i';
		$source[] = '/І/'; $replace[] = 'i';
		$source[] = '/Ї/'; $replace[] = 'yi';
		$source[] = '/Й/'; $replace[] = 'j';
		$source[] = '/К/'; $replace[] = 'k';
		$source[] = '/Л/'; $replace[] = 'l';
		$source[] = '/М/'; $replace[] = 'm';
		$source[] = '/Н/'; $replace[] = 'n';
		$source[] = '/О/'; $replace[] = 'o';
		$source[] = '/П/'; $replace[] = 'p';
		$source[] = '/Р/'; $replace[] = 'r';
		$source[] = '/С/'; $replace[] = 's';
		$source[] = '/Т/'; $replace[] = 't';
		$source[] = '/У/'; $replace[] = 'y';
		$source[] = '/Ф/'; $replace[] = 'f';
		$source[] = '/Х/'; $replace[] = 'h';
		$source[] = '/Ц/'; $replace[] = 'c';
		$source[] = '/Ч/'; $replace[] = 'ch';
		$source[] = '/Ш/'; $replace[] = 'sh';
		$source[] = '/Щ/'; $replace[] = 'shh';
		$source[] = '/Ь/'; $replace[] = '';
		$source[] = '/Ю/'; $replace[] = 'yu';
		$source[] = '/Я/'; $replace[] = 'ya';
		$source[] = '/Э/'; $replace[] = 'e';
		$source[] = '/Ы/'; $replace[] = 'u';
		$source[] = '/Ё/'; $replace[] = 'yo';

		$string = preg_replace($source, $replace, $string);

		for ($i=0; $i<strlen($string); $i++) {
			if ($string[$i] >= 'a' && $string[$i] <= 'z') continue;
			if ($string[$i] >= 'A' && $string[$i] <= 'Z') continue;
			if ($string[$i] >= '0' && $string[$i] <= '9') continue;
			$string[$i] = '-';
		}
			
		$string = str_replace("--","-",$string);
			
		return $this->tolover($string);
	}
			
	private function tolover($string) {
	
		return strtolower($string);
		
	}
	
	
}
?>
