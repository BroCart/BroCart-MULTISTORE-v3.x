<?php
/**
 * @package		OpenCart
 * @author		Daniel Kerr
 * @copyright	Copyright (c) 2005 - 2017, OpenCart, Ltd. (https://www.opencart.com/)
 * @license		https://opensource.org/licenses/GPL-3.0
 * @link		https://www.opencart.com
*/

/**
* URL class
*/

if (trait_exists('seoBroker')) {
	class Url {
		private $url;
		private $ssl;
		private $rewrite = array();	
		use seoBroker {
			seoBroker::__construct as private __urlConstruct;
		}
		public function __construct($url, $ssl = '') {
			$this->url = $url;
			$this->ssl = $ssl;
			if (trait_exists('seoBroker')) {
				$this->__urlConstruct();
			}
		}
		public function addRewrite($rewrite) {
			$this->rewrite = $rewrite;
		}
		public function link($route, $args = '', $secure = false, $code = false) {
			if ($this->ssl && $secure) {
				$url = $this->ssl . 'index.php?route=' . $route;
			} else {
				$url = $this->url . 'index.php?route=' . $route;
			}			
			if ($args) {
				if (is_array($args)) {
					$url .= '&amp;' . http_build_query($args);
				} else {
					$url .= str_replace('&', '&amp;', '&' . ltrim($args, '&'));
				}
			}
			if (isset($this->rewrite)) {
				$url = $this->rewriter($url, $this->rewrite, $code);		
			}			
			return $url; 
		}
	}
} else {
	class Url {
		private $url;
		private $ssl;
		private $rewrite = array();
		
		/**
		 * Constructor
		 *
		 * @param	string	$url
		 * @param	string	$ssl
		 *
		*/
		public function __construct($url, $ssl = '') {
			$this->url = $url;
			$this->ssl = $ssl;		
		}
		/**
		 *
		 *
		 * @param	object	$rewrite
		*/	
		public function addRewrite($rewrite) {
			$this->rewrite[] = $rewrite;
		}

		/**
		 * 
		 *
		 * @param	string		$route
		 * @param	mixed		$args
		 * @param	bool		$secure
		 *
		 * @return	string
		*/
		public function link($route, $args = '', $secure = false, $code = false) {
			if ($this->ssl && $secure) {
				$url = $this->ssl . 'index.php?route=' . $route;
			} else {
				$url = $this->url . 'index.php?route=' . $route;
			}
			
			if ($args) {
				if (is_array($args)) {
					$url .= '&amp;' . http_build_query($args);
				} else {
					$url .= str_replace('&', '&amp;', '&' . ltrim($args, '&'));
				}
			}
			
			foreach ($this->rewrite as $rewrite) {
				$url = $rewrite->rewrite($url);
			}
			
			return $url; 
		}
	}
}