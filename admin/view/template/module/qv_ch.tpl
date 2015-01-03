<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
	<div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a></div>
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	<div id="tab-general">
	<table class="form">
	
	<!--conf_cust-->
		 <tr>
             <td><?php echo $entry_firstname; ?></td>
              <td><?php if ($config_firstname_disp) { ?>
                <input type="radio" name="config_firstname_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_firstname_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_firstname_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_firstname_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
				 <td><?php echo $entry_firstname_req; ?></td>
              <td><?php if ($config_firstname_req) { ?>
                <input type="radio" name="config_firstname_req" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_firstname_req" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_firstname_req" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_firstname_req" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
		  <tr>             
			<td><?php echo $entry_lastname; ?></td>
              <td><?php if ($config_lastname_disp) { ?>
                <input type="radio" name="config_lastname_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_lastname_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_lastname_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_lastname_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
				<td><?php echo $entry_lastname_req; ?></td>
              <td><?php if ($config_lastname_req) { ?>
                <input type="radio" name="config_lastname_req" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_lastname_req" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_lastname_req" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_lastname_req" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			
			<tr>              
				<td><?php echo $entry_telephone; ?></td>
              <td><?php if ($config_tel_disp) { ?>
                <input type="radio" name="config_tel_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_tel_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_tel_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_tel_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
				<td><?php echo $entry_telephone_req; ?></td>
              <td><?php if ($config_tel_req) { ?>
                <input type="radio" name="config_tel_req" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_tel_req" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_tel_req" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_tel_req" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>              
				<td><?php echo $entry_fax; ?></td>
              <td><?php if ($config_fax_disp) { ?>
                <input type="radio" name="config_fax_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_fax_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_fax_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_fax_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
				<td><?php echo $entry_fax_req; ?></td>
              <td><?php if ($config_fax_req) { ?>
                <input type="radio" name="config_fax_req" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_fax_req" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_fax_req" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_fax_req" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
		</table>
		<hr>
		<table class="form">			
			<tr>
              <td><?php echo $entry_company; ?></td>
              <td><?php if ($config_comp_disp) { ?>
                <input type="radio" name="config_comp_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_comp_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_comp_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_comp_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
				<td><?php echo $entry_company_req; ?></td>
              <td><?php if ($config_comp_req) { ?>
                <input type="radio" name="config_comp_req" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_comp_req" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_comp_req" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_comp_req" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_address_1; ?></td>
              <td><?php if ($config_addr_disp) { ?>
                <input type="radio" name="config_addr_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_addr_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_addr_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_addr_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
				<td><?php echo $entry_address_1_req; ?></td>
              <td><?php if ($config_addr_req) { ?>
                <input type="radio" name="config_addr_req" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_addr_req" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_addr_req" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_addr_req" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_address_2; ?></td>
              <td><?php if ($config_addr2_disp) { ?>
                <input type="radio" name="config_addr2_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_addr2_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_addr2_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_addr2_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
				<td><?php echo $entry_address_2_req; ?></td>
              <td>
			  <?php if ($config_addr2_req) { ?>
                <input type="radio" name="config_addr2_req" value="1" checked="checked" />
                <?php echo $text_yes; ?>
				<input type="radio" name="config_addr2_req" value="0" />
				<?php echo $text_no; ?>
				<?php } else { ?>
				<input type="radio" name="config_addr2_req" value="1" checked="checked" />
                <?php echo $text_yes; ?>
				<input type="radio" name="config_addr2_req" value="0" />
				<?php echo $text_no; ?>
				<?php } ?>
                </td>
            </tr>
			<tr>
              <td><?php echo $entry_city; ?></td>
              <td><?php if ($config_city_disp) { ?>
                <input type="radio" name="config_city_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_city_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_city_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_city_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
				<td><?php echo $entry_city_req; ?></td>
              <td><?php if ($config_city_req) { ?>
                <input type="radio" name="config_city_req" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_city_req" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_city_req" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_city_req" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_postcode; ?></td>
              <td><?php if ($config_post_disp) { ?>
                <input type="radio" name="config_post_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_post_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_post_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_post_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
				<td><?php echo $entry_postcode_req; ?></td>
              <td><?php if ($config_post_req) { ?>
                <input type="radio" name="config_post_req" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_post_req" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_post_req" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_post_req" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>
			<tr>
              <td><?php echo $entry_country; ?></td>
              <td><?php if ($config_co_disp) { ?>
                <input type="radio" name="config_co_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_co_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_co_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_co_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
				<td><?php echo $entry_confirm; ?></td>
              <td><?php if ($config_conf_disp) { ?>
                <input type="radio" name="config_conf_disp" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_conf_disp" value="0" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="config_conf_disp" value="1" />
                <?php echo $text_yes; ?>
                <input type="radio" name="config_conf_disp" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } ?></td>
            </tr>			
		<!--end_conf_cust-->
	</table>
	
	</div>
	<div id="tab-data">
     
         <table>
              <tr>
                  <td><?php echo $entry_status; ?></td>
                  <td>
                    <select name="status">
                        <option value="0"<?php if(!isset($settings['status']) || $settings['status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                        <option value="1"<?php if(isset($settings['status']) && $settings['status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                    </select>
                  </td>
              </tr>              
          </table>
          <br />
          <script type="text/javascript">
              $('.status').live('change',function(){
                  var name = (this.name).split('_');
                  if(this.value == 0){
                      if(name[0] == 'address') name[0] = name[0]+'_'+name[1];
                      $('select[name=\''+name[0]+'_required\']').val('0');
                  }

              });
          </script>
          <fieldset>
            <table class="form">
                <tr>
                    <td><b><?php echo $entry_firstname;?></b></td>
                    <td>
                        <select name="firstname_status" class="status">
                            <option value="0"<?php if(isset($settings['firstname_status']) && $settings['firstname_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['firstname_status']) && $settings['firstname_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="firstname_required">
                            <option value="0"<?php if(!isset($settings['firstname_required']) || $settings['firstname_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['firstname_required']) && $settings['firstname_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $entry_lastname;?></b></td>
                    <td>
                        <select name="lastname_status" class="status">
                            <option value="0"<?php if(isset($settings['lastname_status']) && $settings['lastname_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['lastname_status']) && $settings['lastname_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="lastname_required">
                            <option value="0"<?php if(!isset($settings['lastname_required']) || $settings['lastname_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['lastname_required']) && $settings['lastname_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $entry_email;?></b></td>
                    <td>
                        <select name="email_status" class="status">
                            <option value="0"<?php if(isset($settings['email_status']) && $settings['email_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['email_status']) && $settings['email_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="email_required">
                            <option value="0"<?php if(!isset($settings['email_required']) || $settings['email_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['email_required']) && $settings['email_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $entry_telephone;?></b></td>
                    <td>
                        <select name="telephone_status" class="status">
                            <option value="0"<?php if(isset($settings['telephone_status']) && $settings['telephone_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['telephone_status']) && $settings['telephone_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="telephone_required">
                            <option value="0"<?php if(!isset($settings['telephone_required']) || $settings['telephone_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['telephone_required']) && $settings['telephone_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $entry_fax;?></b></td>
                    <td>
                        <select name="fax_status" class="status">
                            <option value="0"<?php if(isset($settings['fax_status']) && $settings['fax_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['fax_status']) && $settings['fax_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="fax_required">
                            <option value="0"<?php if(!isset($settings['fax_required']) || $settings['fax_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['fax_required']) && $settings['fax_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $entry_company;?></b></td>
                    <td>
                        <select name="company_status" class="status">
                            <option value="0"<?php if(isset($settings['company_status']) && $settings['company_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['company_status']) && $settings['company_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="company_required">
                            <option value="0"<?php if(!isset($settings['company_required']) || $settings['company_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['company_required']) && $settings['company_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $entry_address_1;?></b></td>
                    <td>
                        <select name="address_1_status" class="status">
                            <option value="0"<?php if(isset($settings['address_1_status']) && $settings['address_1_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['address_1_status']) && $settings['address_1_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="address_1_required">
                            <option value="0"<?php if(!isset($settings['address_1_required']) || $settings['address_1_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['address_1_required']) && $settings['address_1_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $entry_address_2;?></b></td>
                    <td>
                        <select name="address_2_status" class="status">
                            <option value="0"<?php if(isset($settings['address_2_status']) && $settings['address_2_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['address_2_status']) && $settings['address_2_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="address_2_required">
                            <option value="0"<?php if(!isset($settings['address_2_required']) || $settings['address_2_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['address_2_required']) && $settings['address_2_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $entry_city;?></b></td>
                    <td>
                        <select name="city_status" class="status">
                            <option value="0"<?php if(isset($settings['city_status']) && $settings['city_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['city_status']) && $settings['city_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="city_required">
                            <option value="0"<?php if(!isset($settings['city_required']) || $settings['city_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['city_required']) && $settings['city_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $entry_postcode;?></b></td>
                    <td>
                        <select name="postcode_status" class="status">
                            <option value="0"<?php if(isset($settings['postcode_status']) && $settings['postcode_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['postcode_status']) && $settings['postcode_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="postcode_required">
                            <option value="0"<?php if(!isset($settings['postcode_required']) || $settings['postcode_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['postcode_required']) && $settings['postcode_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b><?php echo $entry_country;?></b></td>
                    <td>
                        <select name="country_status" class="status">
                            <option value="0"<?php if(isset($settings['country_status']) && $settings['country_status'] == 0){?> selected="selected"<?php }?>><?php echo $text_disabled;?></option>
                            <option value="1"<?php if(isset($settings['country_status']) && $settings['country_status'] == 1){?> selected="selected"<?php }?>><?php echo $text_enabled;?></option>
                        </select>
                        <select name="country_required">
                            <option value="0"<?php if(!isset($settings['country_required']) || $settings['country_required'] == 0){?> selected="selected"<?php }?>><?php echo $text_not_required;?></option>
                            <option value="1"<?php if(isset($settings['country_required']) && $settings['country_required'] == 1){?> selected="selected"<?php }?>><?php echo $text_required;?></option>
                        </select>
                    </td>
                </tr>
            </table>
          </fieldset>

      </form>
	  </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs(); 
//--></script> 
<?php echo $footer; ?>