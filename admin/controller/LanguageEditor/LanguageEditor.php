<?php

class ControllerLanguageEditorLanguageEditor extends Controller {
    private $error = array();

    public function setSection($section){
    
        if($section == "admin"){
            Define('USE_DIR', DIR_APPLICATION);
            $this->data['section'] = $this->language->get('menu_backend');
            return "&section=admin";
        }else{
            Define('USE_DIR', DIR_CATALOG);
            $this->data['section'] = $this->language->get('menu_frontend');
            return "";
        }
    
    }

    public function index() {

        //Loads language
        $this->load->language('le/le');
        //Loads model
        $this->load->model('LanguageEditor/LanguageEditor');

        //Sets the <title> </ title> of the page
        $this->document->setTitle($this->language->get('heading_title'));
        //Capture Title
        $this->data['heading_title'] = $this->language->get('heading_title');
        //Select the language
        $this->data['entry_selectLang'] = $this->language->get('entry_selectLang');
        //Edit
        $this->data['entry_edit'] = $this->language->get('entry_edit');
        //Cancel button text
        $this->data['btn_cancel'] = $this->language->get('btn_cancel');
        //Select button text
        $this->data['btn_select'] = $this->language->get('btn_select');
        //Save button text
        $this->data['btn_save'] = $this->language->get('btn_save');
        //Back button text
        $this->data['btn_back'] = $this->language->get('btn_back');
        //Variable menu text
        $this->data['menu_variable'] = $this->language->get('menu_variable');
        //Value menu text
        $this->data['menu_value'] = $this->language->get('menu_value');
        //Edit menu text
        $this->data['menu_edit'] = $this->language->get('menu_edit');
        //Action menu text
        $this->data['menu_action'] = $this->language->get('menu_action');
        //No file warning
        $this->data['msg_nofile'] = $this->language->get('msg_nofile');
        //Successfully written message
        $this->data['msg_success'] = $this->language->get('msg_success');
        //Couldn't write to the file message
        $this->data['msg_error'] = $this->language->get('msg_error');
        //Back end listing
        $this->data['menu_backend'] = $this->language->get('menu_backend');
        //Front end listing
        $this->data['menu_frontend'] = $this->language->get('menu_frontend');
        //Select a section
        $this->data['entry_selectSection'] = $this->language->get('entry_selectSection');

        //Default language
        $def_lang_id = $this->config->get('config_language_id');
        $edit_lang = $this->model_LanguageEditor_LanguageEditor->getLanguage($def_lang_id);
        $this->data['name_language'] = $edit_lang;

        //Stop notices from showing.
        $file_param = null;
        $file_param_pass = null;
        $string = null;
        $link_param_section = null;
        $section = null;
        $sectionlist = null;
        $sectionget = null;

        //Get the value of the STRING parameter
        if(isset($this->request->get['string'])){
            $this->data['string'] = $this->request->get['string'];
        }

        //Get the value of the posted or URL SECTION parameter
        $setup_section = "catalog";
        if(isset($this->request->get['section'])){
            $setup_section = $this->request->get['section'];
        }
        if(isset($this->request->post['sectionlist'])){
            $setup_section = $this->request->post['sectionlist'];
        }
        $link_param_section = $this->setSection($setup_section);

        //Error
        $this->data['error_warning'] = null;

        //Passing files
        if(isset($this->request->get['file'])){
            $file_param = $this->request->get['file'];
            $file_param_pass = "&file=".$file_param;
        }

        //Cancel button
        $this->data['action_cancel'] = $this->url->link('common/home', 'token=' . $this->session->data['token']);

        //Checks if the parameter name_language is being passed via URL and sets it up if it is.
        if (isset($this->request->get['name_language'])){
            $edit_lang = $this->request->get['name_language'];
            $this->data['files'] = $this->dirListings($edit_lang);
            $this->data['name_language'] = $edit_lang;
        }else{
            $this->data['files'] = $this->dirListings();
        };

        //Checks if the parameter name_language is being passed via POST and sets it up if it is.
        if (isset($this->request->post['listlanguages'])){
            $edit_lang = $this->request->post['listlanguages'];
            $this->data['files'] = $this->dirListings($edit_lang);
            $this->data['name_language'] = $edit_lang;
        };

        //Checks if the FILE parameter is being passed via URL for editing the file.
        if (isset($file_param)){
            $data = explode('/', $file_param);
            $this->data['file_vars'] = $this->get_file_vars($data[1], $edit_lang, $data[0]);
        }else{
            $this->data['file_vars'] = $this->get_file_vars(USE_DIR . 'language/'.$edit_lang.'/'.$edit_lang.'.php');
        };

        if(isset($this->request->get['file'])){
            $edit_file = $this->request->get['file'];
        }else{
            $edit_file = "./".$edit_lang;
        }

        //Check if the user updated an entry.
        if(isset($this->request->post['strvalue']) && isset($this->request->post['poststr'])){
            $str = $this->request->post['poststr'];
            $strval = $this->request->post['strvalue'];
            $this->data['showmsg'] = $this->update_value($str, $strval, $edit_lang, $edit_file); //This will set the $showmsg to either "success" or "error".

            //We need to re-pull the values in the files.
            $data = explode('/', $file_param);
            $this->data['file_vars'] = $this->get_file_vars($data[1], $edit_lang, $data[0]);

        }

        $this->data['action_select'] = $this->url->link('LanguageEditor/LanguageEditor', 'token=' . $this->session->data['token'] . $file_param_pass);
        $this->data['file_link'] = $this->url->link('LanguageEditor/LanguageEditor', 'token=' . $this->session->data['token'] . $link_param_section . "&name_language=".$edit_lang . "&file=");
        $this->data['action_edit'] = $this->url->link('LanguageEditor/LanguageEditor', 'token=' . $this->session->data['token'] . $link_param_section . "&name_language=".$edit_lang . "&file=".$edit_file . "&string=");
        $this->data['viewing_file_link'] = $this->url->link('LanguageEditor/LanguageEditor', 'token=' . $this->session->data['token'] . $link_param_section . "&name_language=".$edit_lang . "&file=".$edit_file);

        //Breadcrumbs
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token']),
            'text' => $this->language->get('entry_home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'href' => $this->url->link('LanguageEditor/LanguageEditor', 'token=' . $this->session->data['token']),
            'text' => $this->language->get('heading_title'),
            'separator' => '  ::  '
        );

        $this->template = 'LanguageEditor/LanguageEditor.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    //Update a string value
    public function update_value($str, $strval, $edit_lang, $edit_file){

        $filename = USE_DIR.'language/'.$edit_lang."/".$edit_file.".php";
        $current_vars = $this->get_file_vars($filename);
        $current_var_value = $current_vars[$str];

        $file_array = file($filename);

        for($i=0;$i<count($file_array);$i++){
            $line = $file_array[$i];

            $editing_var = '$_[\''.$str.'\']';

            if(substr($line, 0, strlen($str)+6) == $editing_var){
                $line_spacing = explode("=", str_replace($editing_var, "", $line));
                $line_spacing = $line_spacing[0];

                $replacement_entry = $editing_var.$line_spacing."= '".addslashes($strval)."';";
                break;
            }
        }

        $current_entry = '$_[\''.$str.'\']'.$line_spacing."= '".addslashes($current_var_value)."';";
        $content = implode($file_array);

        $content = str_replace($current_entry, $replacement_entry, $content);
        $handler = fopen($filename, 'w+');

        if (fwrite($handler, html_entity_decode($content, ENT_QUOTES, "UTF-8"))){
            return "success";
        }else{
            return "error";
        };

    }

    //Capture all the link files.
    public function dirListings($lang = 'english'){

        $nArray = array();

        $nArray['name_language'] = $lang;

        $array = $this->list_files(USE_DIR . 'language/'.$lang);

        sort($array);

        $first_run = 1;
        $last_dir = null;
        foreach ($array as $value){

            $files_exp = explode("/", $value);
            if($files_exp[0] == $lang){

                if($last_dir != $files_exp[1] && !$first_run){

                    $dir_listings[] = array($last_dir => $filenames);
                    $filenames = null;
                }

                if(strpos($files_exp[1], ".php")){
                    $files_exp[2] = $files_exp[1];
                    $files_exp[1] = ".";
                    $filenames[] = str_replace(".php", "", $files_exp[2]);
                }else{
                    $filenames[] = str_replace(".php", "", $files_exp[2]);
                }

                $last_dir = $files_exp[1];
                $first_run = null;
            }
        };

        //We need to do it one more time so the last directory gets picked up.
        $dir_listings[] = array($last_dir => $filenames);

        return $dir_listings;
    }

    //Capture source code of a file
    public function get_file_vars($filename = '', $language = '', $folder = ''){

        if(empty($language) || empty($folder)){
            if(is_file($filename)){
                include($filename);
            }else{
                return false;
            }
        }else{
            $filename = USE_DIR . 'language/'.$language.'/'.$folder.'/'.$filename.'.php';
            if(is_file($filename)){
                include($filename);
            }else{
                return false;
            }
        };

        $all_vars = get_defined_vars();
        $all_file_vars = $all_vars['_'];

        ksort($all_file_vars);

        return $all_file_vars;
    }

    //Lists all files
    public function list_files( $folder = '') {

        if ( empty($folder) )
            return false;

        $files = array();
        if ( $dir = @opendir( $folder ) ) {
            while (($file = readdir( $dir ) ) !== false ) {
                if ( in_array($file, array('.', '..') ) )
                    continue;
                if ( is_dir( $folder . '/' . $file ) ) {
                    $files2 = $this->list_files( $folder . '/' . $file);
                    if ( $files2 )
                        $files = array_merge($files, $files2 );
                } else {
                    $extension = substr($file, strlen($file)-3, 3);
                    if ($extension == 'php'){
                        $folder_out = str_replace(USE_DIR."language/", "", $folder);
                        $files[] = $folder_out . '/' . $file;
                    }
                }
            }
        }
        @closedir( $dir );
        return $files;
    }

} ?>
