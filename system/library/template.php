<?php
class Template {
	public $data = array();
	
	public function fetch($filename) {
		$file = DIR_TEMPLATE . $filename;
    
		if (file_exists($file)) {
			extract($this->data);
			
      		ob_start();
      
	  		include($file);
      
	  		$content = ob_get_contents();

      		ob_end_clean();

      		return $content;
    	} else {
			trigger_error('Ошибка: Невозможно загрузить шаблон магазина ' . $file . '!');
			exit();				
    	}	
	}
}
?>