<?php 
class ModelExtensionModuleStorageCleaner extends Model {
	public function getSize($dirs=array()) {
		$sizes = array();
		$sizeAll = 0;
		$size = 0;
		
		foreach ($dirs as $key=>$dir) {
			$files = array();
			$path = array($dir . '*');
			$first = false;
			while (count($path) != 0) {
				$next = array_shift($path);
				if ($first) {
					$p_info = pathinfo(str_replace('*','',$next));
					if ($key =='system') {
						if (strlen($p_info['filename'])== 2) continue;
					} elseif ($key == 'twig') {
						if (strlen($p_info['filename'])!= 2) continue;
					}
				}
				$first = true;

				if (is_array(glob($next))) {
					foreach (glob($next) as $file) {
						if (is_dir($file)) {
							$path[] = $file . '/*';
						}

						$files[] = $file;
					}
				}
			}

			if (!empty($files)) {
				foreach ($files as $file) {
					if ($file != $dir . 'index.html' && $file != $dir . '.htaccess') {
						if ($key != 'any_log') {
							if (is_file($file)) {
								$size += filesize($file);
							}	
						} else {
							if ($file != $dir . 'ocmod.log' && $file != $dir . $this->config->get('config_error_filename')) {
								if (is_file($file)) {
									$size += filesize($file);
								}
							}
						}
					}
				}
			}
			$sizes[$key] = $this->formatSize($size);
			$sizeAll = $sizeAll + $size;
			$size = 0;
		}
		$sizes['all'] = $this->formatSize($sizeAll);
		return $sizes;
	}

	protected function formatSize($size) {
		$sizenames = array(' B', ' KB', ' MB', ' GB', ' TB', ' PB', ' EB', ' ZB', 'YB');
		$item = 0;
		while ($size >= 1024) {
			$size /= 1024;
			$item++;
		}
		return round($size, 0) . $sizenames[$item];
	}
}