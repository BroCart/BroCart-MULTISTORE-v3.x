<?php
/**
 * @package		OpenCart
 * @author		Daniel Kerr
 * @copyright	Copyright (c) 2005 - 2017, OpenCart, Ltd. (https://www.opencart.com/)
 * @license		https://opensource.org/licenses/GPL-3.0
 * @link		https://www.opencart.com
*/

/**
* Document class
*/
class Document {
	private $title;
	private $robots;
	private $description;
	private $keywords;
	private $opengraph = array();
	private $links = array();
	private $canonical = array();	
	private $styles = array();
	private $scripts = array();
	private $og_image;

	/**
	 * 
	 *
	 * @param	string	$title
	 */
	public function setTitle($title) {
		$this->title = $title;
	}

	/**
	 * 
	 * 
	 * @return	string
	 */
	public function getTitle() {
		return $this->title;
	}

	/**
	 * 
	 *
	 * @param	string	$description
	 */
	public function setDescription($description) {
		$this->description = $description;
	}

	/**
	 * 
	 *
	 * @param	string	$description
	 * 
	 * @return	string
	 */
	public function getDescription() {
		return $this->description;
	}

	/**
	 * 
	 *
	 * @param	string	$keywords
	 */
	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}

	/**
	 *
	 * 
	 * @return	string
	 */
	public function getKeywords() {
		return $this->keywords;
	}
	
	/**
	 * 
	 *
	 * @param	string	$href
	 * @param	string	$rel
	 */
	public function addLink($href, $rel) {
		$this->links[$href] = array(
			'href' => $href,
			'rel'  => $rel
		);
	}

	/**
	 * 
	 * 
	 * @return	array
	 */
	public function getLinks() {
		return $this->links;
	}

	/**
	 * 
	 *
	 * @param	string	$href
	 * @param	string	$rel
	 * @param	string	$media
	 */
	public function addStyle($href, $rel = 'stylesheet', $media = 'screen') {
		$this->styles[$href] = array(
			'href'  => $href,
			'rel'   => $rel,
			'media' => $media
		);
	}

	/**
	 * 
	 * 
	 * @return	array
	 */
	public function getStyles() {
		return $this->styles;
	}

	/**
	 * 
	 *
	 * @param	string	$href
	 * @param	string	$postion
	 */
	public function addScript($href, $postion = 'header') {
		$this->scripts[$postion][$href] = $href;
	}

	/**
	 * 
	 *
	 * @param	string	$postion
	 * 
	 * @return	array
	 */
	public function getScripts($postion = 'header') {
		if (isset($this->scripts[$postion])) {
			return $this->scripts[$postion];
		} else {
			return array();
		}
	}
	
	public function addRobots($robots) {
		$this->robots = $robots;
	} 
	
	public function getRobots() {
		return $this->robots;
	}
		
	public function setOpengraph($meta, $content = '') {
		$this->opengraph[] = array(
			'meta'   => $meta,
			'content' => $content
		 );
	}
	
	public function getOpengraph() {
		return $this->opengraph;
	}
	
	public function addCanonical($href) {
		$this->canonical[$href] = array(
			'href' => $href,
			'rel'  => 'canonical'
		);
	}

	public function getCanonical() {
		return $this->canonical;
	}
	
	/**
	 * 
	 *
	 * @param	string	$image
	 */
	public function setOgImage($image) {
		$this->og_image = $image;
	}

	/**
	 *
	 * 
	 * @return	string
	 */
	public function getOgImage() {
		return $this->og_image;
	}
}
