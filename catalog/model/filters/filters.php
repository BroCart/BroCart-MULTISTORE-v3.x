<?php

class ModelFiltersFilters extends Model {

	private function queryCacher($sql) {
		if ($this->config->get('config_seo_query')) {
				if (!$this->cachesql) {
					require_once(DIR_SYSTEM . 'config/cachesql.php');
					$this->cachesql = new CACHEsql(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
				}
			return $this->cachesql->filquery($sql);
		} else {
			return $this->db->query($sql);
		}
	}

    public function getPriceRange($categoryId) {
        //Caching enabled
        $priceRange = $this->cache->get('fil/filters.priceRange' . (int) $this->config->get('config_language_id') . '.' . (int) $categoryId);
        if (!$priceRange) {
            $priceRange = array();
            
            $query = 'SELECT min(price) as min, max(price) as max FROM ' . DB_PREFIX . 'product P
                    join ' . DB_PREFIX . 'product_to_category POC
                    on POC.product_id = P.product_id
                    where POC.category_id = ' . (int) $categoryId . ' AND P.status = 1' ;
			
            $results = $this->db->query($query);
            $priceRange = $results->row;
            
            $this->cache->set('fil/filters.priceRange' . (int) $this->config->get('config_language_id') . '.' . (int) $categoryId, $priceRange);
        }

        return $priceRange;//Array;
    }

    public function getProductOptionsInACategory($categoryId) {
        //Caching enabled
        $productOptionArray = $this->cache->get('fil/filters.options' . (int) $this->config->get('config_language_id') . '.' . (int) $categoryId);
        if (!$productOptionArray) {
            $productOptionArray = array();
					
			$query = 'SELECT POD.option_id, OD.name as parent_option, OVD.option_value_id as child_id, OVD.name as child_name  FROM
                    ' . DB_PREFIX . 'product_option_value POD
                    join ' . DB_PREFIX . 'option_description OD
                    on POD.option_id = OD.option_id
                    join ' . DB_PREFIX . 'option_value_description OVD
                    on OVD.option_value_id = POD.option_value_id					
                    join ' . DB_PREFIX . 'product_to_category PTC
                    on PTC.product_id = POD.product_id
                    join ' . DB_PREFIX . 'product P
                    on P.product_id = POD.product_id
                    AND P.status = 1
                    where PTC.category_id =' . (int) $categoryId
                    . ' group by OD.name,OVD.name';


          // $this->log->write($query );
            $results = $this->queryCacher($query);

            $productOptionsData = $results->rows;

            $oldParentName = null;
            $i = -1;
            $j = -1;
            foreach ($productOptionsData as $options) {
                $i++;
                $childOptionsArray = array();
                //Comparing old parent option name
                if ($oldParentName != $options['parent_option']) {
                    $j++;
                    $i = 0;
                    $oldParentName = $options['parent_option'];
                    $productOptionArray[$j]['name'] = $oldParentName;
                }
                $productOptionArray[$j][$i] = array('child_id' => $options['child_id'], 'child_name' => $options['child_name']);
            }
            $this->cache->set('fil/filters.options' . (int) $this->config->get('config_language_id') . '.' . (int) $categoryId, $productOptionArray);
        }
        return $productOptionArray;
    }

    public function getOptionValues($optionId) {

    }

	public function getAttributes($categoryId) {

		$sql = "SELECT DISTINCT pa.text, a.`attribute_id`, ad.`name`, ag.attribute_group_id, agd.name as attribute_group_name FROM `" . DB_PREFIX . "product_attribute` pa" .
			   " LEFT JOIN " . DB_PREFIX . "attribute a ON(pa.attribute_id=a.`attribute_id`) " .
			   " LEFT JOIN " . DB_PREFIX . "attribute_description ad ON(a.attribute_id=ad.`attribute_id`) " .
			   " LEFT JOIN " . DB_PREFIX . "attribute_group ag ON(ag.attribute_group_id=a.`attribute_group_id`) " .
			   " LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON(agd.attribute_group_id=ag.`attribute_group_id`) " .
			   " LEFT JOIN " . DB_PREFIX . "product p ON(p.product_id=pa.`product_id`) ";
		if($categoryId) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON(p.product_id=p2c.product_id) ";
		}
		$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON(p.product_id=p2s.product_id) ";
		$sql .= " WHERE  p.status = '1' AND p.date_available <= NOW() AND p2s.store_id =" . (int)$this->config->get('config_store_id');
		if($categoryId) {
			$sql .= " AND p2c.category_id = '" . (int)$categoryId . "'";
		}
		
		$sql .= " AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "'" .
				" AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "'" .
				" AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "'" .
				" ORDER BY ag.sort_order, agd.name, a.sort_order, ad.name, pa.text";

		$query = $this->queryCacher($sql);


		$attributes = array();
		foreach($query->rows as $row) {
			if(!isset($attributes[$row['attribute_group_id']])) {
				$attributes[$row['attribute_group_id']] = array(
					'name' => $row['attribute_group_name'],
					'attribute_values' => array()
				);
			}

			if(!isset($attributes[$row['attribute_group_id']]['attribute_values'][$row['attribute_id']])) {
				$attributes[$row['attribute_group_id']]['attribute_values'][$row['attribute_id']] = array('name' => $row['name'], 'values' => array());
			}
			
		}

		foreach($attributes as $attribute_group_id => $attribute_group) {
			foreach($attribute_group['attribute_values'] as $attribute_id => $attribute) {
				sort($attributes[$attribute_group_id]['attribute_values'][$attribute_id]['values']);
			}
		}
		return $attributes;
	}
		
    public function getManufacturersInACategory($categoryId) {
        //Caching enabled
        $manufacturersData = $this->cache->get('fil/filters.manufacturer' . (int) $this->config->get('config_language_id') . '.' . (int) $categoryId);
        $manufacturersData = array();
        if (!$manufacturersData) {
            $manufacturersData = array();
            $query = 'SELECT distinct(M.manufacturer_id), M.name, M.image from ' . DB_PREFIX . 'product P
                    join ' . DB_PREFIX . 'product_to_category PTC
                    on PTC.product_id=P.product_id
                    join ' . DB_PREFIX . 'manufacturer M
                    on M.manufacturer_id = P.manufacturer_id
                    where category_id=' . (int) $categoryId . ' AND P.status = 1';           
            $results = $this->queryCacher($query);
            $manufacturersData = $results->rows;
            $this->cache->set('fil/filters.manufacturer' . (int) $this->config->get('config_language_id') . '.' . (int) $categoryId, $manufacturersData);
        }
        return $manufacturersData;
    }

    public function getProducts($data = array()) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$cache = md5(http_build_query($data));

		$product_data = $this->cache->get('fil/product.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache);                
		if (!$product_data) {
			$sql = "SELECT p.product_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product p 
			LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)			
			LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)
			LEFT JOIN " . DB_PREFIX . "product_special ps ON (p.product_id = ps.product_id)";
			if (!empty($data['filter_tag'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product_tag pt ON (p.product_id = pt.product_id)";
			}

			if (!empty($data['filter_category_id'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";
			}
                        
            if (!empty($data['productOption'])) {
				$sql .= " JOIN " . DB_PREFIX . "product_option_value POV ON (p.product_id = POV.product_id)";
                $sql .= " AND POV.option_value_id in (".$data['productOption'].")";
			}

			if (!empty($data['productAttribute'])) {
				$sql .= " JOIN " . DB_PREFIX . "product_attribute PA ON (p.product_id = PA.product_id)";
                $sql .= " AND PA.attribute_id in (".$data['productAttribute'].")";
			} 
			
            if (!empty($data['manufacturerId'])) {
                $sql .= " AND p.manufacturer_id in (" .$data['manufacturerId']  . ")";
			}
            
			
			
            if (!empty($data['inStock'])) {
                 $sql .= " AND p.quantity > 1";
			}

             if (!empty($data['saleItems'])) {
				$sql .= " JOIN " . DB_PREFIX . "product_discount PDC ON (p.product_id = PDC.product_id)";
                                $sql .= " AND (PDC.date_end >= current_date or PDC.date_end = '0000-00-00')";
			}
		              
			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

			if (!empty($data['minPrice']) && !empty($data['maxPrice'])) {
                
				$sql .= " AND ( (p.price BETWEEN '" . $data['minPrice'] . "' AND '" . $data['maxPrice'] . "' 
				 
				AND NOT EXISTS (SELECT ps.product_id FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id=p.product_id))";

				  $sql .= " OR ((
						 (date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())
						) AND
						ps.price BETWEEN '" . $data['minPrice'] . "' AND '" . $data['maxPrice'] . "' 
						";
			
			$sql .= "))";
			
			
			}
			
			if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
				$sql .= " AND (";

				if (!empty($data['filter_name'])) {
					$implode = array();

					$words = explode(' ', $data['filter_name']);

					foreach ($words as $word) {
						if (!empty($data['filter_description'])) {
							$implode[] = "LCASE(pd.name) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%' OR LCASE(pd.description) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";
						} else {
							$implode[] = "LCASE(pd.name) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%'";
						}
					}

					if ($implode) {
						$sql .= " " . implode(" OR ", $implode) . "";
					}
				}

				if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
					$sql .= " OR ";
				}

				if (!empty($data['filter_tag'])) {
					$implode = array();

					$words = explode(' ', $data['filter_tag']);

					foreach ($words as $word) {
						$implode[] = "LCASE(pt.tag) LIKE '%" . $this->db->escape(utf8_strtolower($word)) . "%' AND pt.language_id = '" . (int)$this->config->get('config_language_id') . "'";
					}

					if ($implode) {
						$sql .= " " . implode(" OR ", $implode) . "";
					}
				}

				$sql .= ")";
			}

			if (!empty($data['filter_category_id'])) {
				if (!empty($data['filter_sub_category'])) {
					$implode_data = array();

					$implode_data[] = "p2c.category_id = '" . (int)$data['filter_category_id'] . "'";

					$this->load->model('catalog/category');

					$categories = $this->model_catalog_category->getCategoriesByParentId($data['filter_category_id']);

					foreach ($categories as $category_id) {
						$implode_data[] = "p2c.category_id = '" . (int)$category_id . "'";
					}

					$sql .= " AND (" . implode(' OR ', $implode_data) . ")";
				} else {
					$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
				}
				
			}

			if (!empty($data['filter_manufacturer_id'])) {
				$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
			}

			$sql .= " GROUP BY p.product_id";

			$sort_data = array(
				'pd.name',
				'p.model',
				'p.quantity',
				'p.price',
				'rating',
				'p.sort_order',
				'p.date_added'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
					$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
				} else {
					$sql .= " ORDER BY " . $data['sort'];
				}
			} else {
				$sql .= " ORDER BY p.sort_order";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC, LCASE(pd.name) DESC";
			} else {
				$sql .= " ASC, LCASE(pd.name) ASC";
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

			$product_data = array();

			$query = $this->queryCacher($sql);

            $this->load->model('catalog/product');
			foreach ($query->rows as $result) {                           
				$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
			}

			$this->cache->set('fil/product.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache, $product_data);
		}

		return $product_data;
	}
}

?>
