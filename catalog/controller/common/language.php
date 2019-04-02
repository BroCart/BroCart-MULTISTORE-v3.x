<?php
class ControllerCommonLanguage extends Controller {
	
	private static $redirects = array();
	private static $seo = false;
	
	public function __construct($registry) {
		parent::__construct($registry);
		$seo = $this->config->get('config_seo_url_type');
		if ($seo && $seo == 'seo_bro') {
			self::$seo = true;
		}		
	}
	
	public function index() {
		$this->load->language('common/language');
		
		$data['broker'] = false;
		
		$data['action'] = 'index.php?route=common/language/language'; //$this->url->link('common/language/language', '', $this->request->server['HTTPS']);

		$data['code'] = $this->session->data['language'];

		$data['languages'] = array();

		$data['languages'] = $this->cache->get('catalog.seolang');
		if (!$data['languages']) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "language WHERE status = '1' ORDER BY sort_order, name");
			foreach ($query->rows as $result) {
				$data['languages'][$result['code']] = array(
					'language_id'	=> $result['language_id'],
					'name'			=> $result['name'],
					'prefix'		=> $result['prefix'],
					'code'			=> $result['code']
				);				
			}
			$this->cache->set('catalog.seolang', $data['languages']);
		}
		
		if (self::$seo) {
			$data['broker'] = true;
		}
		
		if (!isset($this->request->get['route'])) {
			if (self::$seo) {
				foreach ($data['languages'] as $code => $longers) {
					$data['redirect'][$code] = $this->url->link('common/home', '', $this->request->server['HTTPS'], $longers['code']);
				}
			} else {
				$data['redirect'] = $this->url->link('common/home');
			}
		} else {
			$url_data = $this->request->get;

			unset($url_data['_route_']);

			$route = $url_data['route'];

			unset($url_data['route']);

			$url = '';

			if ($url_data) {
				$url = '&' . urldecode(http_build_query($url_data, '', '&'));
			}
			if (self::$seo) {
				foreach ($data['languages'] as $code => $longers) {
					$data['redirect'][$code] = $this->url->link($route, $url, $this->request->server['HTTPS'], $longers['code']);
				}
			} else {
				$data['redirect'] = $this->url->link($route, $url, $this->request->server['HTTPS']);
			}
		}

		return $this->load->view('common/language', $data);
	}

	public function language() {
		if (isset($this->request->post['code'])) {
			$this->session->data['language'] = $this->request->post['code'];		
		}
		if (isset($this->request->post['redirect'])) {
			if (self::$seo) {
				$this->response->redirect($this->request->post['redirect'][$this->session->data['language']]);
			} else {
				$this->response->redirect($this->request->post['redirect']);
			}
		} else {
			$this->response->redirect($this->url->link('common/home'));
		}
	}
}