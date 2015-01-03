<?php
class ModelSalenewssubscribers extends Model {
   private function check_db(){
	   
	 $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "subscribe (
	  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	  `email_id` varchar(225) NOT NULL,
	  `name` varchar(225) NOT NULL,
	  `option1` varchar(225) NOT NULL,  
	  PRIMARY KEY (`id`),
	  UNIQUE KEY `Index_2` (`email_id`)
	) ENGINE=MyISAM  DEFAULT CHARSET=utf8;");

   }
	public function addEmail($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "subscribe SET email_id='".$data['email_id']."',name='".$data['email_name']."'");
	}
	
	public function editEmail($id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "subscribe SET email_id='".$data['email_id']."',name='".$data['email_name']."' WHERE id = '" . (int)$id . "'");
	}
	
	public function deleteEmail($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "subscribe WHERE id = '" . (int)$id . "'");
	}
	
	public function getEmail($id) {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "subscribe WHERE id = '" . (int)$id . "'");

		return $query->row;
	}
	
	public function getEmails($data,$start,$limit) {
		

		
		$sql = "SELECT * FROM " . DB_PREFIX . "subscribe  LIMIT $start,$limit";
			
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function exportEmails() {
		
		$this->check_db();
		
		$sql = "SELECT name,email_id FROM " . DB_PREFIX . "subscribe";
			
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	

	
	public function getTotalEmails($data) {
		
		$this->check_db();
		
		$sql = "SELECT * FROM " . DB_PREFIX . "subscribe";
			
		$query = $this->db->query($sql);
		
		return $query->num_rows;
	}
	public function checkmail($data,$id=FALSE) {
	  
	   if($id)
		$sql = "SELECT * FROM " . DB_PREFIX . "subscribe WHERE email_id='".$data."' AND id!='".$id."'";
	   else	
		$sql = "SELECT * FROM " . DB_PREFIX . "subscribe WHERE email_id='".$data."'";
		
			
				
		$query = $this->db->query($sql);
		
		return $query->num_rows;
	}
	public function getCoupones($data = array()) {
	
		$sql = "SELECT coupon_id, name, code, discount, date_start, date_end, status FROM " . DB_PREFIX . "coupon WHERE status='1'";
				
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	

}
?>