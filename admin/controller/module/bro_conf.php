<?php
class ControllerModuleBroconf extends Controller {
	private $error = array();	
	
	public function index() {
		$language = $this->language->load('module/bro_conf');
       		
        $this->document->setTitle($this->language->get('heading_title'));
		
        $this->load->model('setting/setting');
        $this->load->model('tool/image');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('bro_conf', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');		
		
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
        
        $this->data['token'] = $this->session->data['token'];			
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_l'] = $this->language->get('text_l');	
		$this->data['text_g'] = $this->language->get('text_g');	
		$this->data['text_yes'] = $this->language->get('text_yes');	
		$this->data['text_no'] = $this->language->get('text_no');
		//tabs
		$this->data['main_tab'] = $this->language->get('main_tab');
		$this->data['main_menu'] = $this->language->get('main_menu');	
		$this->data['homepage'] = $this->language->get('homepage');	
		$this->data['category'] = $this->language->get('category');	
		$this->data['product'] = $this->language->get('product');	
		$this->data['contact'] = $this->language->get('contact');
		//variables
		$this->data['text_homepage'] = $this->language->get('text_homepage');
		$this->data['text_homepage_sound'] = $this->language->get('text_homepage_sound');	
		$this->data['text_filter_options'] = $this->language->get('text_filter_options');
		$this->data['text_filter_attr'] = $this->language->get('text_filter_attr');
		$this->data['text_filter_man'] = $this->language->get('text_filter_man');
		$this->data['text_filter_stock'] = $this->language->get('text_filter_stock');
		$this->data['text_filter_opt'] = $this->language->get('text_filter_opt');
		$this->data['text_categ_disp'] = $this->language->get('text_categ_disp');
		
		$this->data['text_fields'] = $this->language->get('text_fields');
		$this->data['text_show'] = $this->language->get('text_show');
		$this->data['text_required'] = $this->language->get('text_required');
		$this->data['text_name'] = $this->language->get('text_name');
		$this->data['text_email'] = $this->language->get('text_email');
		$this->data['text_time'] = $this->language->get('text_time');
		$this->data['text_comment'] = $this->language->get('text_comment');
		$this->data['text_phone'] = $this->language->get('text_phone');
		$this->data['seo_block'] = $this->language->get('seo_block');
		$this->data['text_to_top'] = $this->language->get('text_to_top');
		$this->data['text_comm'] = $this->language->get('text_comm');
		$this->data['text_loc_to_info'] = $this->language->get('text_loc_to_info');
		$this->data['text_h_upc'] = $this->language->get('text_h_upc');
		$this->data['text_h_ean'] = $this->language->get('text_h_ean');
		$this->data['text_h_jan'] = $this->language->get('text_h_jan');
		$this->data['text_h_isbn'] = $this->language->get('text_h_isbn');
		$this->data['text_h_mpn'] = $this->language->get('text_h_mpn');
//////////////////////////////////////
		$this->data['text_opt_name'] = $this->language->get('text_opt_name');
		$this->data['text_opt_value'] = $this->language->get('text_opt_value');
		$this->data['text_cache_sql'] = $this->language->get('text_cache_sql');
		$this->data['text_url_full'] = $this->language->get('text_url_full');
		$this->data['text_seo_page'] = $this->language->get('text_seo_page');
		$this->data['text_seo_show'] = $this->language->get('text_seo_show');
		$this->data['text_seo_default'] = $this->language->get('text_seo_default');
		$this->data['text_seo_priceasc'] = $this->language->get('text_seo_priceasc');
		$this->data['text_seo_pricedesc'] = $this->language->get('text_seo_pricedesc');
		$this->data['text_seo_nameasc'] = $this->language->get('text_seo_nameasc');
		$this->data['text_seo_namedesc'] = $this->language->get('text_seo_namedesc');
		$this->data['text_seo_modelasc'] = $this->language->get('text_seo_modelasc');
		$this->data['text_seo_modeldesc'] = $this->language->get('text_seo_modeldesc');
		$this->data['text_seo_ratingasc'] = $this->language->get('text_seo_ratingasc');
		$this->data['text_seo_ratingdesc'] = $this->language->get('text_seo_ratingdesc');
///////////////////////////////////
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');		
		$this->data['entry_status'] = $this->language->get('entry_status');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');		
        

        $config_data = array(
			'homepage_sound',
			'filter_man',
			'filter_opt',
			'filter_attr',				
			'filter_stock',		
			'categ_disp',	
			'show_name',
			'required_name',
			'show_email',
			'required_email',
			'show_time',
			'required_time',
			'show_comment',
			'required_comment',
			'required_phone',
			'comment_enabled',
			'loc_change',
			'hide_upc',
			'hide_ean',
			'hide_jan',
			'hide_isbn',
			'hide_mpn',			
			'config_to_top',
			'config_top_image',
			'config_seo_query',//Кеширование результатов запроса
			'config_seo_page',//string
			'config_seo_show',//string
			'config_seo_default',//string
			'config_seo_priceasc',//string
			'config_seo_pricedesc',//string
			'config_seo_nameasc',//string
			'config_seo_namedesc',//string
			'config_seo_modelasc',//string
			'config_seo_modeldesc',//string
			'config_seo_ratingasc',//string
			'config_seo_ratingdesc',//string
			'config_seo_url_include_path',//on_off product include path			
        );
        
        foreach ($config_data as $conf) {
            if (isset($this->request->post[$conf])) {
                $this->data[$conf] = $this->request->post[$conf];
            } else {
                $this->data[$conf] = $this->config->get($conf);
            }
        } 
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/bro_conf', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/bro_conf', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');	
		
		 
	 	
		$this->load->model('tool/image');

		if (isset($this->request->post['config_top_image'])) {
			$this->data['config_top_image'] = $this->request->post['config_top_image'];
		} else {
			$this->data['config_top_image'] = $this->config->get('config_top_image');			
		}
		
		if ($this->config->get('config_top_image') && file_exists(DIR_IMAGE . $this->config->get('config_top_image')) && is_file(DIR_IMAGE . $this->config->get('config_top_image'))) {
			$this->data['top_image'] = $this->model_tool_image->resize($this->config->get('config_top_image'), 100, 100);		
		} else {
			$this->data['top_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		//$this->log->write('Ppost:'. print_r($this->config->get('config_top_image'),true));
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		$this->template = 'module/bro_conf.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
		
		$this->response->setOutput($this->render());
	}
		
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/bro_conf')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>