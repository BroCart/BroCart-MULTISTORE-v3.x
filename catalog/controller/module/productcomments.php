<?php
class ControllerModuleProductComments extends Controller {
	public function __construct($registry) {
		parent::__construct($registry);		
		$this->data = array_merge($this->data, $this->load->language('module/productcomments'));
		$this->load->model('module/productcomments');
		$this->language->load('module/productcomments');		
	}
	
	public function renderComments() {
		$product_id = $this->request->get['product_id'];
		$comments_per_page = $this->config->get('pcconf_perpage');
		if ((int)$comments_per_page == 0)
			$comments_per_page = 10;
			
		$page = (isset($this->request->get['page'])) ? (int)$this->request->get['page'] : 1;
		
		$this->data['product_id'] = $product_id;
		$this->data['pcComments'] = $this->model_module_productcomments->getComments(
			array(
				'product_id' => $product_id,
				'displayed' => 1,
			),
			array(
				'order_by' => 'pc.create_time',
				'order_way' => 'DESC',
				'offset' => ($page - 1) * $comments_per_page,
				'limit' => $comments_per_page
			)
		);
		
		$total_comments = $this->model_module_productcomments->getTotalComments(
			array(
				'displayed' => 1,
				'product_id' => $product_id
			)
		);
		$pagination = new Pagination();
		$pagination->total = $total_comments;
		$pagination->page = $page;
		$pagination->limit = $comments_per_page; 
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('module/productcomments/renderComments', '&page={page}' . '&product_id=' . $product_id);
		$this->data['pagination'] = $pagination->render();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/productcomments_comments.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/productcomments_comments.tpl';
		} else {
			$this->template = 'default/template/module/productcomments_comments.tpl';
		}			
		$this->response->setOutput($this->render());		
		//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));	
	}
	
	public function renderForm() {
		$product_id = isset($this->request->get['product_id']) ? (int)$this->request->get['product_id'] : 0;
		if  (!$product_id) return;

		if  (!$this->customer->isLogged() && !$this->config->get('pcconf_allow_guests')) {
			echo sprintf($this->language->get('pc_login_register'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		} else {
			$this->data['pcName'] = $this->customer->getFirstname();
			$this->data['pcEmail'] = $this->customer->getEmail();
			$this->data['pcLogged'] = $this->customer->isLogged();
			
			$this->data['pcconf_maxlen'] = $this->config->get('pcconf_maxlen');
			$this->data['pcconf_enforce_customer_data'] = $this->config->get('pcconf_enforce_customer_data');
			$this->data['product_id'] = $product_id;
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/productcomments_form.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/productcomments_form.tpl';
			} else {
				$this->template = 'default/template/module/productcomments_form.tpl';
			}
			$this->response->setOutput($this->render());		
			//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));		
		}
	}
	
	public function submitComment() {
		if (!isset($this->request->get['product_id']))
			return;
			
		$comment['product_id'] = $this->request->get['product_id'];
		
		$json = array();
		
		//if (is admin) {
			//admin logged in
		//} else 	
		if ($this->customer->isLogged()) {
			//customer logged in
			$comment['customer_id'] = $this->customer->getId();
			if  ($this->config->get('pcconf_enforce_customer_data')) {
				$comment['name'] = $this->customer->getFirstName();
	    		$comment['email'] = $this->customer->getEmail();
			} else {
	    		$comment['name'] = trim(strip_tags(htmlspecialchars_decode($this->request->post['pcName'])));
	    		$comment['email'] = trim(strip_tags(htmlspecialchars_decode($this->request->post['pcEmail'])));
			}			
		} else {
			// guest
			$comment['customer_id'] = 0;
			if (!$this->config->get('pcconf_allow_guests')) {
				//$json['errors'][] = 'Not allowed to post';
				return;			
			} else {
	    		$comment['name'] = trim(strip_tags(htmlspecialchars_decode($this->request->post['pcName'])));
	    		$comment['email'] = trim(strip_tags(htmlspecialchars_decode($this->request->post['pcEmail'])));
			}
		}

	    $comment['comment'] = trim(strip_tags(htmlspecialchars_decode($this->request->post['pcText'])));

		if (mb_strlen($comment['name'],'UTF-8') < 3 || mb_strlen($comment['name'],'UTF-8') > 25) {
			$json['errors'][] = sprintf($this->language->get('pc_error_name'), 3, 25);
		}

		if (!filter_var($comment['email'], FILTER_VALIDATE_EMAIL) || mb_strlen($comment['email'], 'UTF-8') > 128) {
			$json['errors'][] = $this->language->get('pc_error_email');
		}

		if (mb_strlen($comment['comment']) < 10) {
			$json['errors'][] = sprintf($this->language->get('pc_error_comment_short'), 10);
		}

		if (mb_strlen($comment['comment']) > $this->config->get('pcconf_maxlen') && $this->config->get('pcconf_maxlen') > 0) {
			$json['errors'][] = sprintf($this->language->get('pc_error_comment_long'), $this->config->get('pcconf_maxlen'));
		}

		if (!$this->customer->isLogged() || ($this->customer->isLogged() && $this->config->get('pcconf_enable_customer_captcha'))) {
			if (!isset($this->request->post['pcCaptcha']) || ($this->session->data['captcha'] != $this->request->post['pcCaptcha'])) {
				$json['errors'][] = $this->language->get('pc_error_captcha');
			}
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !isset($json['errors'])) {
			$this->model_module_productcomments->addComment($comment);
			$json['success'] = $this->language->get('pc_success');
		}
		
		if (strcmp(VERSION,'1.5.1.3') >= 0) {
			$this->response->setOutput(json_encode($json));
		} else {
			$this->load->library('json');
			$this->response->setOutput(Json::encode($json));
		}
	}	
}
?>