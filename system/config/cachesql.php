<?php
final class CACHEsql {
	private $link;
	private $expires = 900;
	private $cname;
	private $filename;
	private $cdir;
	
	public function __construct($hostname, $username, $password, $database) {
		if (!$this->link = mysql_connect($hostname, $username, $password)) {
      		trigger_error('Ошибка: Невозможно создать соединение, используя ' . $username . '@' . $hostname);
		}

    	if (!mysql_select_db($database, $this->link)) {
      		trigger_error('Ошибка: Невозможно создать подключение ' . $database);
    	}
		
		mysql_query("SET NAMES 'utf8'", $this->link);
		mysql_query("SET CHARACTER SET utf8", $this->link);
		mysql_query("SET CHARACTER_SET_CONNECTION=utf8", $this->link);
		mysql_query("SET SQL_MODE = ''", $this->link);		
	}
		
  	public function seoquery($sql) {
		$this->cdir = DIR_CACHE . 'sql/';
		$this->cname = md5($sql);
		$this->filename = $this->cdir . 'sqls.' . $this->cname;

		if (!$this->cacheExists()) {
			$resource = mysql_query($sql, $this->link);
			if ($resource) {
				if (is_resource($resource)) {
					$i = 0;
			
					$data = array();
			
					while ($result = mysql_fetch_assoc($resource)) {
						$data[$i] = $result;
						$i++;
					}
					
					mysql_free_result($resource);
					
					$query = new stdClass();
					$query->row = isset($data[0]) ? $data[0] : array();
					$query->rows = $data;
					$query->num_rows = $i;
					
					unset($data);
					
					$this->saveCache($query);
					
					return $query;	
				} else {
					return true;
				}
			} else {
				trigger_error('Ошибка: ' . mysql_error($this->link) . '<br />Ошибка в: ' . mysql_errno($this->link) . '<br />' . $sql);
				exit();
			}
		} else {
			$cache = $this->getCache();
			$query = new stdClass();
			$query->row  = !isset($cache['row']) ? array() : $cache['row'];
			$query->rows = !isset($cache['rows']) ? array() : $cache['rows'];
			$query->num_rows = !isset($cache['num_rows']) ? 0 : $cache['num_rows'];
			return $query;		
		}
  	}
	
	public function proquery($sql) {
		$this->cdir = DIR_CACHE . 'pro/';
		$this->cname = md5($sql);
		$this->filename = $this->cdir . 'sqlp.' . $this->cname;

		if (!$this->cacheExists()) {
			$resource = mysql_query($sql, $this->link);
			if ($resource) {
				if (is_resource($resource)) {
					$i = 0;
			
					$data = array();
			
					while ($result = mysql_fetch_assoc($resource)) {
						$data[$i] = $result;
						$i++;
					}
					
					mysql_free_result($resource);
					
					$query = new stdClass();
					$query->row = isset($data[0]) ? $data[0] : array();
					$query->rows = $data;
					$query->num_rows = $i;
					
					unset($data);
					
					$this->saveCache($query);
					
					return $query;	
				} else {
					return true;
				}
			} else {
				trigger_error('Ошибка: ' . mysql_error($this->link) . '<br />Ошибка в: ' . mysql_errno($this->link) . '<br />' . $sql);
				exit();
			}
		} else {
			$cache = $this->getCache();
			$query = new stdClass();
			$query->row  = !isset($cache['row']) ? array() : $cache['row'];
			$query->rows = !isset($cache['rows']) ? array() : $cache['rows'];
			$query->num_rows = !isset($cache['num_rows']) ? 0 : $cache['num_rows'];
			return $query;		
		}
  	}
	
	public function filquery($sql) {
		$this->cdir = DIR_CACHE . 'fil/';
		$this->cname = md5($sql);
		$this->filename = $this->cdir . 'sqlf.' . $this->cname;

		if (!$this->cacheExists()) {
			$resource = mysql_query($sql, $this->link);
			if ($resource) {
				if (is_resource($resource)) {
					$i = 0;
			
					$data = array();
			
					while ($result = mysql_fetch_assoc($resource)) {
						$data[$i] = $result;
						$i++;
					}
					
					mysql_free_result($resource);
					
					$query = new stdClass();
					$query->row = isset($data[0]) ? $data[0] : array();
					$query->rows = $data;
					$query->num_rows = $i;
					
					unset($data);
					
					$this->saveCache($query);
					
					return $query;	
				} else {
					return true;
				}
			} else {
				trigger_error('Ошибка: ' . mysql_error($this->link) . '<br />Ошибка в: ' . mysql_errno($this->link) . '<br />' . $sql);
				exit();
			}
		} else {
			$cache = $this->getCache();
			$query = new stdClass();
			$query->row  = !isset($cache['row']) ? array() : $cache['row'];
			$query->rows = !isset($cache['rows']) ? array() : $cache['rows'];
			$query->num_rows = !isset($cache['num_rows']) ? 0 : $cache['num_rows'];
			return $query;		
		}
  	}
	
	protected function cacheExists() {
		if (!file_exists($this->filename)) {
			return false;
		} else {
			return true;
		}
	}
	
	protected function getCache() {
		if (!$data = json_decode(file_get_contents($this->filename), true)) {
			return false;
		}
		return $data;
	}

	protected function saveCache($data) {
		if (!file_put_contents($this->filename, json_encode($data))) {
			return false;
		}
		return true;
	}
	
	public function deleteCache($filename, $allcache = false) {
		$filename = $this->dir . $filename;
		if ($allcache) {
			foreach (glob($filename.'*') as $file) {
				unlink($file);
			}
		} else { 
			if (file_exists($filename)) {
				unlink($filename);
			}
		}
	}
		
	public function escape($value) {
		return mysql_real_escape_string($value, $this->link);
	}
	
  	public function countAffected() {
    	return mysql_affected_rows($this->link);
  	}

  	public function getLastId() {
    	return mysql_insert_id($this->link);
  	}	
	
	public function __destruct() {
		mysql_close($this->link);
	}
}
?>