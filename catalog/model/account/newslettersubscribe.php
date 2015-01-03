<?php
class ModelAccountnewslettersubscribe extends Model {
	public function checkmailid($data) {
  	   
	   $query=$this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe where email_id='".$data['subscribe_email']."'");
	   return $query->num_rows;
	}
	
	public function checkRegisteredUser($data) {
  	   
	   $query=$this->db->query("SELECT * FROM " . DB_PREFIX . "customer where email='".$data['subscribe_email']."'");
	   return $query->num_rows;
	}
	
	public function UpdateRegisterUsers($data,$status) {
  	   
	   $query=$this->db->query("UPDATE  " . DB_PREFIX . "customer SET newsletter ='".$status."' where email='".$data['subscribe_email']."'");

	}
	
	public function subscribe($data) {
	
		$this->db->query("INSERT INTO " . DB_PREFIX . "subscribe SET email_id='".$data['subscribe_email']."',name='".$data['subscribe_name']."',option1='".$this->db->escape(isset($data['option1'])?$data['option1']:'')."'");
	}
	
	public function unsubscribe($data) {
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "subscribe WHERE email_id='".$data['subscribe_email']."'");
	}
   public function check_db(){
	   
	 $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "subscribe (
	  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	  `email_id` varchar(225) NOT NULL,
	  `name` varchar(225) NOT NULL,
	  `option1` varchar(225) NOT NULL,
	  PRIMARY KEY (`id`),
	  UNIQUE KEY `Index_2` (`email_id`)
	) ENGINE=MyISAM  DEFAULT CHARSET=utf8;");

   }
   public function getCoupones($data = array()) {
	
		$sql = "SELECT coupon_id, name, code, discount, date_start, date_end, status FROM " . DB_PREFIX . "coupon WHERE coupon_id='".$this->config->get('newslettersubscribe_option_field')."'";
				
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
}
?>
