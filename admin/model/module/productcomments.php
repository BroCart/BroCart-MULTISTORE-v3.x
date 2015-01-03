<?php
class ModelModuleProductComments extends Model {
	public function createTable() {
		$createTable = "
			CREATE TABLE " . DB_PREFIX . "productcomments (
             `id` int(11) NOT NULL AUTO_INCREMENT,
             `parent_id` int(11) DEFAULT NULL,
             `product_id` int(11) NOT NULL,
             `customer_id` int(11) DEFAULT NULL,
			 `user_id` int(11) DEFAULT NULL,
             `name` varchar(128) NOT NULL DEFAULT '',
             `email` varchar(128) NOT NULL DEFAULT '',
             `comment` text NOT NULL,
             `display` tinyint(1) NOT NULL DEFAULT 1,
             `create_time` int(11) NOT NULL,
        	PRIMARY KEY (`id`)) default CHARSET=utf8";
        
        $this->db->query($createTable);
	}
	
	public function dropTable() {
		$dropTable = "DROP TABLE IF EXISTS " . DB_PREFIX . "productcomments";
		$this->db->query($dropTable);
    }
	
    public function getTotalComments($data = array()) {
        $sql = "SELECT count(*) AS total
        		FROM `" . DB_PREFIX . "productcomments` pc
				WHERE 1 = 1";

        $res = $this->db->query($sql);
        return $res->row['total'];
    }	
	
	public function getComments($data = array(), $sort = array()) {
		$sql = "SELECT  *,
						pc.name as name,
						pd.name as product_name
				FROM " . DB_PREFIX . "productcomments pc
				LEFT JOIN " . DB_PREFIX . "product_description pd
					USING(product_id)
			  	WHERE pd.language_id = " . (int)$this->config->get('config_language_id') 
				. (isset($sort['order_by']) ? " ORDER BY {$sort['order_by']} {$sort['order_way']}" : '')
				. (isset($sort['limit']) ? " LIMIT ".(int)$sort['offset'].', '.(int)($sort['limit']) : '');

		$res = $this->db->query($sql);

		foreach ($res->rows as &$row)  {
			$row['comment'] = htmlspecialchars_decode($row['comment']);
		}
		
		return $res->rows;
	}

    public function deleteComment($comment_id) {
        $sql = "DELETE FROM `" . DB_PREFIX . "productcomments`
				WHERE id = " . (int)$comment_id;

        return $this->db->query($sql);
    }

    public function editComment($comment) {
        $sql = "UPDATE `" . DB_PREFIX . "productcomments`
        		SET	comment = '" . $this->db->escape($comment["comment"]) . "',
					email = '" . $this->db->escape($comment["email"]) . "',
					name = '" . $this->db->escape($comment["name"]) . "',
					product_id = "   . (int)($comment["product_id"]) . ",
            		display = "  . ($comment["display"] == "on" ? 1  : 0)  . "
            	WHERE id =  " . $comment["comment_id"];

        return $this->db->query($sql);
    }
}