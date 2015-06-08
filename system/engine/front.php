<?php
final class Front {
	protected $registry;
	protected $pre_action = array();
	protected $error;
	
	public function __construct($registry) {
		$this->registry = $registry;
		//set_error_handler(array(&$this, 'error_handler'));
	}
	
	public function addPreAction($pre_action) {
		$this->pre_action[] = $pre_action;
	}
	
  	public function dispatch($action, $error) {
		$this->error = $error;
			
		foreach ($this->pre_action as $pre_action) {
			$result = $this->execute($pre_action);
					
			if ($result) {
				$action = $result;
				
				break;
			}
		}
			
		while ($action) {
			$action = $this->execute($action);
		}
  	}
    
	private function execute($action) {
		if (file_exists($action->getFile())) {
			require_once($action->getFile());
			
			$class = $action->getClass();

			$controller = new $class($this->registry);
			
			if (is_callable(array($controller, $action->getMethod()))) {
				$action = call_user_func_array(array($controller, $action->getMethod()), $action->getArgs());
			} else {
				$action = $this->error;
			
				$this->error = '';
			}
		} else {
			$action = $this->error;
			
			$this->error = '';
		}
		
		return $action;
	}
		
	public function error_handler($errno, $errstr, $errfile, $errline) {
		
		if (in_array($errno, array(E_WARNING, E_USER_WARNING))
				&& strpos($errstr, 'unlink(') === 0 
				&& basename($errfile) == 'cache.php') {
			return true;
		}

		switch ($errno) {
			case E_NOTICE:
			case E_USER_NOTICE:
				$error = 'Сообщение';
				break;
			case E_WARNING:
			case E_USER_WARNING:
				$error = 'Внимание';
				break;
			case E_ERROR:
			case E_USER_ERROR:
				$error = 'Критическая ошибка';
				break;
			default:
				$error = 'Неизвестная ошибка';
				break;
		}
			
		if ($this->registry->get('config')->get('config_error_display')) {
			echo '<b>' . $error . '</b>: ' . $errstr . ' в <b>' . $errfile . '</b> строке <b>' . $errline . '</b>';
		}
		
		if ($this->registry->get('config')->get('config_error_log')) {
			$this->registry->get('log')->write('PHP ' . $error . ':  ' . $errstr . ' в ' . $errfile . ' строке ' . $errline);
		}

		return true;
		
	}
}
?>