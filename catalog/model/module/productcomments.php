<?php
class ModelModuleProductComments extends Model {
    public function getTotalComments($data = array()) {
        $sql = "SELECT count(*) AS total
        		FROM `" . DB_PREFIX . "productcomments` pc
				WHERE 1 = 1"
				. (isset($data['displayed']) ? " AND pc.display = 1" : '')
				. (isset($data['product_id']) ? " AND pc.product_id = " . (int)$data['product_id'] : '');

        $res = $this->db->query($sql);
        return $res->row['total'];
    }

	public function check() {
        $result = $this->db->query("SELECT * FROM `" . DB_PREFIX . "productcomments`");
		if($result->num_rows) {
			return 1;
		} else {
			return 0;
		}
		
    }	
	
	public function getComments($data = array(), $sort = array()) {
		$sql = "SELECT  *
				FROM " . DB_PREFIX . "productcomments pc
				WHERE 1 = 1 "
				. (isset($data['displayed']) ? " AND pc.display = 1" : '')
				. (isset($data['product_id']) ? " AND pc.product_id = " . (int)$data['product_id'] : '')
				. (isset($sort['order_by']) ? " ORDER BY {$sort['order_by']} {$sort['order_way']}" : '')
				. (isset($sort['limit']) ? " LIMIT ".(int)$sort['offset'].', '.(int)($sort['limit']) : '');

		$res = $this->db->query($sql);

		foreach ($res->rows as &$row)  {
			$row['comment'] = htmlspecialchars_decode($row['comment']);
		}

		return $res->rows;
	}	
	
	public function addComment($comment) {
		$sql = "INSERT INTO `" . DB_PREFIX . "productcomments`
            	(customer_id, user_id, parent_id, product_id, name, email, comment, display, create_time)
          		VALUES(" 
			  		. (isset($comment["customer_id"]) ?  (int)$comment["customer_id"] : 'NULL') . ','
			  		. (isset($comment["user_id"]) ?  (int)$comment["user_id"] : 'NULL') . ','
			  		. (isset($comment["parent_id"]) ?  (int)$comment["parent_id"] : 'NULL') . ','
			  		. (int)$comment["product_id"] . ','
			  		. "'" . $this->db->escape($comment["name"]) . "',"
			  		. "'" . $this->db->escape($comment["email"]) . "',"
			  		. "'" . $this->db->escape($comment["comment"]) . "',
					1,
              		UNIX_TIMESTAMP(NOW())
				)";

		if ($res = $this->db->query($sql)) {
        	if (filter_var($this->config->get('pcconf_email'), FILTER_VALIDATE_EMAIL)) {
        		$this->load->model('catalog/product');
				$prod = $this->model_catalog_product->getProduct($comment["product_id"]);
				$product_name = strip_tags(htmlspecialchars_decode($prod['name']));
    		    $comment['comment'] = htmlspecialchars_decode($comment['comment']);

				$headers  = 'MIME-Version: 1.0' . "\r\n";
				$headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
				$headers .= 'From: ' . $this->config->get('config_email') . "\r\n";
				$headers .= 'Reply-To: ' . $comment["email"];
				
				$to = $this->config->get('pcconf_email');
				$baseurl = $this->config->get('config_url');
				$subject = sprintf($this->language->get('pc_mail_subject'), $this->config->get('config_name'), $product_name);
				$message = sprintf($this->language->get('pc_mail'), "<a href='" . $this->url->link('catalog/product', 'product_id=' . $prod['product_id'], 'SSL') . "'>$product_name</a>", $comment['name'], $comment['email'], nl2br($comment['comment']), $this->url->link("module/productcomments", 'SSL'));
				return mail($to, $subject, nl2br($message),$headers);
        	}
        };
    }    
    

}