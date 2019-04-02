<?php
class ControllerExtensionModuleStorageCleaner extends Controller {
	private $error = array();
	private $maintenance  = 0;
	private $dirs = array();
	
	public function __construct($registry){
		parent::__construct($registry);		
		$this->dirs['system']       = DIR_CACHE;
		$this->dirs['twig']         = DIR_CACHE;
		$this->dirs['modif']        = DIR_MODIFICATION;
		$this->dirs['image']        = DIR_IMAGE . 'cache/';
		$this->dirs['error']        = DIR_LOGS . 'error.log';
		$this->dirs['modification'] = DIR_LOGS . 'ocmod.log';
		$this->dirs['any_log']      = DIR_LOGS;
		$this->dirs['ALL']          = 'ALL';
		if (class_exists('VQMod')) {
			$this->dirs['vqmod_cache']      = dirname(DIR_APPLICATION) . '/vqmod/vqcache';
			$this->dirs['vqmod_log']      = dirname(DIR_APPLICATION) . '/vqmod/logs';
		}
	}

	public function widget() {
		if ($this->config->get('storage_cleaner_status') && $this->user->hasPermission('access', 'extension/module/storage_cleaner') && $this->user->hasPermission('modify', 'extension/module/storage_cleaner')) {
			$this->load->language('extension/module/storage_cleaner');

			$data['text_clear']              = $this->language->get('text_clear');
			$data['text_any_error']          = $this->language->get('text_any_error');
			
			$data['storage_cleaner_hidden_opencart'] = $this->config->get('storage_cleaner_hidden_opencart');

			$data['clear_url']  = str_replace('&amp;','&',$this->url->link('extension/module/storage_cleaner/clear', 'user_token=' . $this->session->data['user_token'], 'SSL'));

			$this->load->model('extension/module/storage_cleaner');

			if ($this->config->get('storage_cleaner_size')) {
				$size = $data['text_cleaner_size'] = $this->model_extension_module_storage_cleaner->getSize($this->dirs);
			} else {
				$size = $data['text_cleaner_size'] = false;
			}
			$data['menu'] = array();
			$system = array(
				'text' => $this->language->get('text_cache_system'),
				'size' => $size?$size['system']:false,
			);
			$twig = array(
				'text' => $this->language->get('text_cache_twig'),
				'size' => $size?$size['twig']:false,
			);
			$modif = array(
				'text' => $this->language->get('text_cache_modification'),
				'size' => false,
			);
			$image = array(
				'text' => $this->language->get('text_cache_image'),
				'size' => $size?$size['image']:false,
			);
			$data['menu']['cache'] = array(
				'text' => $this->language->get('text_cache'),
				'child' => array(
					'system' => $system,
					'twig'   => $twig,
					'modif'  => $modif,
					'image'  => $image
				)
			);
			$error = array(
				'text' => $this->language->get('text_log_error'),
				'size' => $size?$size['error']:false,
			);
			$modification = array(
				'text' => $this->language->get('text_log_modification'),
				'size' => $size?$size['modification']:false,
			);
			$any_log = array(
				'text' => $this->language->get('text_any_error'),
				'size' => $size?$size['any_log']:false,
			);
			
			$data['menu']['error'] = array(
				'text' => $this->language->get('text_log'),
				'child' => array(
					'error'        => $error,
					'modification' => $modification,
					'any_log'      => $any_log
				)
			);
			if (class_exists('VQMod')) {
				$vqmod_cache = array(
					'text' => $this->language->get('text_cache_vqmod'),
					'size' => $size?$size['vqmod_cache']:false,
				);
				$vqmod_log = array(
					'text' => $this->language->get('text_log_vqmod'),
					'size' => $size?$size['vqmod_log']:false,
				);
				$data['menu']['vqmod'] = array(
					'text' => $this->language->get('text_vqmod'),
					'child' => array(
						'vqmod_cache' => $vqmod_cache,
						'vqmod_log'   => $vqmod_log
					)
				);
			}
			$all = array(
				'text' => $this->language->get('text_clear_all'),
				'size' => false,
			);
			$data['menu']['ALL'] = array(
				'text' => $this->language->get('text_all'),
				'child' => array(
					'all' => $all,
				)
			);
			
			$result = $this->load->view('extension/module/storage_cleaner/widget',$data);
		} else {
			$result = false;
		}
		return $result;
	}

	public function index() {
		$this->load->language('extension/module/storage_cleaner');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('storage_cleaner', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('marketplace/extension', 'type=module&user_token=' . $this->session->data['user_token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['tab_settings'] = $this->language->get('tab_settings');
		$data['tab_help'] = $this->language->get('tab_help');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_size'] = $this->language->get('entry_size');
		$data['entry_hidden_opencart'] = $this->language->get('entry_hidden_opencart');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('marketplace/extension', 'type=module&user_token=' . $this->session->data['user_token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/storage_cleaner', 'user_token=' . $this->session->data['user_token'], 'SSL')
		);

		$data['action'] = $this->url->link('extension/module/storage_cleaner', 'user_token=' . $this->session->data['user_token'], 'SSL');
		$data['cancel'] = $this->url->link('marketplace/extension', 'type=module&user_token=' . $this->session->data['user_token'], 'SSL');

		if (isset($this->request->post['storage_cleaner_status'])) {
			$data['storage_cleaner_status'] = $this->request->post['storage_cleaner_status'];
		} else {
			$data['storage_cleaner_status'] = $this->config->get('storage_cleaner_status');
		}

		if (isset($this->request->post['storage_cleaner_size'])) {
			$data['storage_cleaner_size'] = $this->request->post['storage_cleaner_size'];
		} else {
			$data['storage_cleaner_size'] = $this->config->get('storage_cleaner_size');
		}
		if (isset($this->request->post['storage_cleaner_hidden_opencart'])) {
			$data['storage_cleaner_hidden_opencart'] = $this->request->post['storage_cleaner_hidden_opencart'];
		} else {
			$data['storage_cleaner_hidden_opencart'] = $this->config->get('storage_cleaner_hidden_opencart');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/storage_cleaner', $data));
	}

	public function clearCache($dir) {
		$this->load->language('extension/module/storage_cleaner');

		$json = array();

		if (!$this->user->hasPermission('modify', 'extension/module/storage_cleaner')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			if ($dir) {
				$this->cleanDirectory($dir);
				$json['success'] = $this->language->get('text_success_clear');
			}
		}
		return $json;
	}

    protected function cleanDirectory($directory){
        if (file_exists($directory)) {
            $result = '';
            $it = new RecursiveDirectoryIterator($directory);
            $files = new RecursiveIteratorIterator($it, RecursiveIteratorIterator::CHILD_FIRST);

            foreach($files as $file) {
                if (($file->getFilename() === '.') 
					|| ($file->getFilename() === '..')
					|| ($file->getFilename() === '.htaccess')
					|| ($file->getFilename() === 'index.html') 
					|| ($file->getFilename() === 'index.htm')) {
                    continue;
                }

                if ($file->isDir()){
                    @rmdir($file->getRealPath());
                    $result .= 'Remove folder: ' . $file . PHP_EOL;
                } else {
                    @unlink($file->getRealPath());
                    $result .= 'Remove file: ' . $file . PHP_EOL;
                }
            }
        } else {
            $result = $directory . ' not found';
        }

        return $result;
    }

	public function clear() {
		$this->load->language('extension/module/storage_cleaner');
		if (isset($this->request->post['type'])) {
			switch ($this->request->post['type']){
				case 'vqmod':
				case 'cache':
					$key = $this->request->post['key'];
					if ($key == 'system') {
						$files = glob(DIR_CACHE . '*');
						if ($files) {
							foreach ($files as $file) {
								$p_info = pathinfo($file);
								if (is_dir($file) && strlen($p_info['filename']) != 2) {
									$json = $this->clearCache($file);
									@rmdir($file);
								} elseif (is_file($file)) {
									@unlink($file);
								}
							}
						}
					break;
					}
					if ($key == 'twig') {
						$directories = glob(DIR_CACHE . '*', GLOB_ONLYDIR);
						if ($directories) {
							foreach ($directories as $directory) {
								$p_info = pathinfo($directory);
								if (strlen($p_info['filename']) == 2) {
									$json = $this->clearCache($directory);	
									@rmdir($directory);
								}
							}
						}
						break;
					}
					if ($key == 'modif') {
						$files = array();
						$path = array(DIR_MODIFICATION . '*');
						while (count($path) != 0) {
							$next = array_shift($path);
							foreach (glob($next) as $file) {
								if (is_dir($file)) {
									$path[] = $file . '/*';
								}
								$files[] = $file;
							}
						}
						rsort($files);
						foreach ($files as $file) {
							if ($file != DIR_MODIFICATION . 'index.html') {
								if (is_file($file)) {
									@unlink($file);
								} elseif (is_dir($file)) {
									@rmdir($file);
								}
							}
						}
						break;
					}
					if ($key == 'image') {
						$dir = DIR_IMAGE . 'cache/';
					} elseif ($key == 'vqmod_cache') {
						$dir = dirname(DIR_APPLICATION) . '/vqmod/vqcache';
					} elseif ($key == 'vqmod_log') {
						$dir = dirname(DIR_APPLICATION) . '/vqmod/logs';
					} elseif ($key == 'any_log') {
						$dir = DIR_LOGS;
					} else {
						$dir = false;
					}
					$json = $this->clearCache($dir);
					break;
				case 'error':
				case 'log':
					$json = $this->clearLog();
					break;
				case 'ALL':
					$dir = DIR_CACHE;
					$json = $this->clearCache($dir);
					$dir = DIR_IMAGE . 'cache/';
					$json = $this->clearCache($dir);
					$dir = DIR_LOGS;
					$json = $this->clearCache($dir);
					if (class_exists('VQMod')) {
						$dir = dirname(DIR_APPLICATION) . '/vqmod/vqcache';
						$json = $this->clearCache($dir);
						$dir = dirname(DIR_APPLICATION) . '/vqmod/logs';
						$json = $this->clearCache($dir);
					}
					break;
			}
		}

		if ($this->config->get('storage_cleaner_size')) {
			$this->load->model('extension/module/storage_cleaner');
			$json['size'] = $this->model_extension_module_storage_cleaner->getSize($this->dirs);
		} else {
			$json['size'] = array();
		}
		$json['success'] = $this->language->get('text_success_clear');
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}

	public function clearLog() {
		$this->load->language('extension/module/storage_cleaner');

		$json = array();
		if (!$this->user->hasPermission('modify', 'extension/module/storage_cleaner')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			$key = $this->request->post['key'];
			$files = false;
			switch ($key) {
				case 'error' :
					$files[] = DIR_LOGS . $this->config->get('config_error_filename');
					break;
				case 'modification' :
					$files[] = DIR_LOGS . 'ocmod.log';
					break;
				case 'any_log' :
					$directory = DIR_LOGS;
					$fs = glob( $directory . "*");
					$files = array();
					foreach ( $fs as $filename) {
						if (
							($filename === $directory . 'ocmod.log')
						|| 	($filename === $directory . $this->config->get('config_error_filename'))
						||	($filename === $directory . 'index.html') 
						||	($filename === $directory . 'index.html') 
						||	($filename === $directory . '.htaccess') ) {
							continue;
						} else {
							$files[] = $filename;	
						}
					}
					break;
			}

			if ($files) {
				foreach ($files as $file) {
					$handle = fopen($file, 'w+');
					fclose($handle);
				}
			}
		}
		return $json;
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/storage_cleaner')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}