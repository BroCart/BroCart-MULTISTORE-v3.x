<?php  
class ControllerModuleCallback extends Controller {
	private $json = array();
	protected function index() {
	
	    $this->document->addScript('catalog/view/javascript/callback/prefixfree.min.js');
	    $this->document->addScript('catalog/view/javascript/callback/jquery.magnific-popup.min.js');
		$this->document->addStyle('catalog/view/javascript/callback/magnific-popup.css');
		$this->document->addStyle('catalog/view/javascript/callback/callback.css');

		$this->language->load('module/callback');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
    	$this->data['email_request_subject'] = $this->language->get('email_request_subject');
    	$this->data['user_name'] = $this->language->get('user_name');
    	$this->data['user_phone'] = $this->language->get('user_phone');
    	$this->data['recommend_to_call'] = $this->language->get('recommend_to_call');
    	$this->data['user_comment'] = $this->language->get('user_comment');
    	$this->data['text_callback'] = $this->language->get('text_callback');
    	$this->data['close_window'] = $this->language->get('close_window');
    	$this->data['text_success'] = $this->language->get('text_success');
    	$this->data['text_name'] = $this->language->get('text_name');
    	$this->data['text_phone'] = $this->language->get('text_phone');
    	$this->data['text_email'] = $this->language->get('text_email');
    	$this->data['text_time'] = $this->language->get('text_time');
    	$this->data['text_comment'] = $this->language->get('text_comment');
    	$this->data['text_request'] = $this->language->get('text_request');
    	$this->data['text_error'] = $this->language->get('text_error');
    	$this->data['text_wrong_email'] = $this->language->get('text_wrong_email');
    	$this->data['show_email'] = $this->config->get('show_email');
    	$this->data['show_comment'] = $this->config->get('show_comment');
    	$this->data['show_time'] = $this->config->get('show_time');
    	$this->data['show_name'] = $this->config->get('show_name');
    	$this->data['required_email'] = $this->config->get('required_email');
    	$this->data['required_comment'] = $this->config->get('required_comment');
    	$this->data['required_time'] = $this->config->get('required_time');
    	$this->data['required_name'] = $this->config->get('required_name');
    	$this->data['required_phone'] = $this->config->get('required_phone');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/callback.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/callback.tpl';
		} else {
			$this->template = 'default/template/module/callback.tpl';
		}
		
		$this->render();
  	}

	public function ajax() {
		$this->language->load('module/callback');
//$buf = print_r($_POST ,true);$this->log->write('POST:'.$buf);
		$errors = $this->validate($this->request->post);
		if (count($errors)) {
			$this->json['errors'] = $errors;
			$this->json['result'] = 'error';
		} else {
			$subject = $this->language->get('email_request_subject');
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');
			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			if ($this->config->get('show_email')) {
				$email = trim($this->request->post['user_email']);
				if (strlen($email) > 0) {
					$mail->setFrom($email);
				}
			}
			$mail->setSender($this->config->get('config_name'));
			if ($this->config->get('show_name')) {
				$name = trim($this->request->post['user_name']);
				if (strlen($name) > 0) {
					$mail->setSender(html_entity_decode($name, ENT_QUOTES, 'UTF-8'));
				}
			}
			$mail->setSubject($subject);

			$user_phone = $this->language->get('user_phone');

			$message = $user_phone . html_entity_decode($this->request->post['user_phone'], ENT_QUOTES, 'UTF-8') . "\r\n";

			if ($this->config->get('show_name')) {
				$user_name = $this->language->get('user_name');
				$message .= $user_name . html_entity_decode($this->request->post['user_name'], ENT_QUOTES, 'UTF-8') . "\r\n";
			}
			if ($this->config->get('show_time')) {
				$recommend_to_call = $this->language->get('recommend_to_call');
				$message .= $recommend_to_call . html_entity_decode($this->request->post['recommend_to_call'], ENT_QUOTES, 'UTF-8').'-' . html_entity_decode($this->request->post['cme_ct_finish'], ENT_QUOTES, 'UTF-8'). "\r\n";
			}
			if ($this->config->get('show_comment')) {
				$user_comment = $this->language->get('user_comment');
				$message .= $user_comment . html_entity_decode($this->request->post['user_comment'], ENT_QUOTES, 'UTF-8') . "\r\n";
			}

			$text = $message;
			$mail->setText($text);
			$mail->send();
			
			$this->json['result'] = 'success';
		}
		$this->response->setOutput(json_encode($this->json));
	}

	private function validate($data) {
		$errors = array();
		if ($this->config->get('show_email') && $this->config->get('required_email')) {
			$regexp = '/^[A-Z0-9._%-]+@[A-Z0-9][A-Z0-9.-]{0,61}[A-Z0-9]\.[A-Z]{2,6}$/i';
			if (!preg_match($regexp, $data['user_email'])) {
				$errors['user_email'] = $this->language->get("error_email");
			}
		}
		if ($this->config->get('show_name') && $this->config->get('required_name')) {
			if (!isset($data['user_name']) || utf8_strlen($data['user_name']) < 1 || utf8_strlen($data['user_name']) > 32) {
				$errors['user_name'] = $this->language->get("error_user_name");
			}
		}
		if ($this->config->get('show_time') && $this->config->get('required_time')) {
			if (!isset($data['recommend_to_call']) || utf8_strlen($data['recommend_to_call']) < 1 || utf8_strlen($data['recommend_to_call']) > 32) {
				$errors['recommend_to_call'] = $this->language->get("error_recommend_to_call");
			}
		}
		if ($this->config->get('show_comment') && $this->config->get('required_comment')) {
			if (!isset($data['user_comment']) || utf8_strlen($data['user_comment']) < 1 || utf8_strlen($data['user_comment']) > 128) {
				$errors['user_comment'] = $this->language->get("error_user_comment");
			}
		}
		if ($this->config->get('required_phone')) {
			$regexp = '/^[0-9]{4,11}$/i';
			if (!preg_match($regexp, $data['user_phone'])) {
				$errors['user_phone'] = $this->language->get("error_user_phone");
			}
		}
		return $errors;
	}

}
?>