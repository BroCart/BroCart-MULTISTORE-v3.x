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
		<div class="buttons">
        <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
        <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
        </div>
	</div>

	<div class="content">    
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">        
		<div id="general_tabs" class="htabs">
			<a href="#general-tab"><?php echo $main_tab; ?></a>                                         
		</div>        

        
        <div id="general-tab">   
        
        <div id="store_tabs" class="vtabs">
             <a href="#main-menu"><?php echo $main_menu; ?></a>
			 <a href="#product"><?php echo $product; ?></a>
             <a href="#homepage"><?php echo $homepage; ?></a>
             <!--a href="#category"><?php echo $category; ?></a-->                
             <!--a href="#contact"><?php echo $contact; ?></a--> 
			<a href="#seo_block"><?php echo $seo_block; ?></a> 
        </div> 
        
        <div id="main-menu" class="vtabs-content">    
        
        <table class="form">
        
			<tr>
				<td colspan="2"><div><b><?php echo $text_homepage; ?></b></div></td>
			</tr>  
			<tr>
				<td><?php echo $text_homepage_sound; ?></td>
				<td>			
                    <select name="homepage_sound">
                            <option value="1"<?php if($homepage_sound == '1') echo ' selected="selected"';?><?php if($homepage_sound == '') echo ' selected="selected"';?>>
                            <?php echo $text_yes; ?></option>
                            <option value="0"<?php if($homepage_sound == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			        </select>
                </td>
			</tr>
                <tr>
					<td colspan="2"><div><b><?php echo $text_filter_options; ?></b></div></td>
					<tr><td ><?php echo $text_filter_man; ?></td>
					<td>
                        <select name="filter_man">    
                           <option value="1"<?php if($filter_man == '1') echo ' selected="selected"';?><?php if($filter_man == '') echo ' selected="selected"';?>>
                            <?php echo $text_yes; ?></option>
                        <option value="0"<?php if($filter_man == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                             
                        </select>
                    </td></tr>
					<tr><td ><?php echo $text_filter_opt; ?></td>
					<td>
                        <select name="filter_opt">    
                           <option value="1"<?php if($filter_opt == '1') echo ' selected="selected"';?><?php if($filter_opt == '') echo ' selected="selected"';?>>
                            <?php echo $text_yes; ?></option>
                        <option value="0"<?php if($filter_opt == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                               
                        </select>
                    </td></tr>
					<tr><td ><?php echo $text_filter_attr; ?></td>
					<td>
                        <select name="filter_attr">    
                           <option value="1"<?php if($filter_attr == '1') echo ' selected="selected"';?><?php if($filter_attr == '') echo ' selected="selected"';?>>
                            <?php echo $text_yes; ?></option>
                        <option value="0"<?php if($filter_attr == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                               
                        </select>
                    </td></tr>
					<tr><td ><?php echo $text_filter_stock; ?></td>
					<td>
                        <select name="filter_stock">    
                           <option value="1"<?php if($filter_stock == '1') echo ' selected="selected"';?><?php if($filter_stock == '') echo ' selected="selected"';?>>
                            <?php echo $text_yes; ?></option>
                        <option value="0"<?php if($filter_stock == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                                
                        </select>
                    </td></tr>
				</tr>
				
				<tr>
				<td><?php echo $text_categ_disp; ?></td>
				<td>			
                    <select name="categ_disp">
                        <option value="1"<?php if($categ_disp == '1') echo ' selected="selected"';?><?php if($categ_disp == '') echo ' selected="selected"';?>>
                            <?php echo $text_l; ?></option>
                        <option value="0"<?php if($categ_disp == '0') echo ' selected="selected"';?>><?php echo $text_g; ?></option>                        
			        </select>
                </td>
				</tr> 
				<tr>
					<td colspan="3"><div><b><?php echo $text_to_top; ?></b></div></td>
					<td>			
                    <select name="config_to_top">
                            <option value="1"<?php if($config_to_top == '1') echo ' selected="selected"';?><?php if($config_to_top == '') echo ' selected="selected"';?>>
                            <?php echo $text_yes; ?></option>
                            <option value="0"<?php if($config_to_top == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			        </select>
                </td>
				<td valign="top">
				<div class="image">
				
				<img src="<?php echo $top_image; ?>" alt="" id="thumb" />
                <input type="hidden" name="config_top_image" value="<?php echo $config_top_image; ?>" id="image" />
                <br /><a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a>
				</div>
				</td>
				</tr>
		 </table> 
        </div>               
        <div id="homepage" class="vtabs-content">  
			<table>
			<tr>
				<td><table>
					<tr>
						<th>&nbsp;</th>
						<th><?php echo $text_show; ?></th>
						<th><?php echo $text_required; ?></th>
					</tr>
					<tr>
						<td><?php echo $text_name; ?></td>
						<td><input type="checkbox" name="show_name" <?php if ($show_name)echo "checked='checked'"?>></td>
						<td><input type="checkbox" name="required_name" <?php if ($required_name)echo "checked='checked'"?>></td>
					</tr>
					<tr>
						<td><?php echo $text_email; ?></td>
						<td><input type="checkbox" name="show_email" <?php if ($show_email)echo "checked='checked'"?>></td>
						<td><input type="checkbox" name="required_email" <?php if ($required_email)echo "checked='checked'"?>></td>
					</tr>
					<tr>
						<td><?php echo $text_time; ?></td>
						<td><input type="checkbox" name="show_time" <?php if ($show_time)echo "checked='checked'"?>></td>
						<td><input type="checkbox" name="required_time" <?php if ($required_time)echo "checked='checked'"?>></td>
					</tr>
					<tr>
						<td><?php echo $text_comment; ?></td>
						<td><input type="checkbox" name="show_comment" <?php if ($show_comment)echo "checked='checked'"?>></td>
						<td><input type="checkbox" name="required_comment" <?php if ($required_comment)echo "checked='checked'"?>></td>
					</tr>
					<tr>
						<td><?php echo $text_phone; ?></td>
						<td><input type="checkbox" checked='checked' disabled></td>
						<td><input type="checkbox" name="required_phone" <?php if ($required_phone)echo "checked='checked'"?>></td>
					</tr>
				</table></td>
			</tr>        
		 </table> 
		</div>
		<div id="product" class="vtabs-content"> 
		<table>
			<tr>
			<td><table>
				<tr>
				<td><?php echo $text_comm; ?></td>
						<td><select name="comment_enabled">
                            <option value="1"<?php if($comment_enabled == '1') echo ' selected="selected"';?><?php if($comment_enabled == '') echo ' selected="selected"';?>>
                            <?php echo $text_yes; ?></option>
                            <option value="0"<?php if($comment_enabled == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			        </select>
					</td>
					</tr>
					<tr>
				<td><?php echo $text_loc_to_info; ?></td>
					<td><select name="loc_change">
                            <option value="1"<?php if($loc_change == '1') echo ' selected="selected"';?><?php if($loc_change == '') echo ' selected="selected"';?>>
                            <?php echo $text_yes; ?></option>
                            <option value="0"<?php if($loc_change == '0') echo ' selected="selected"';?>><?php echo $text_no; ?></option>                        
			        </select>
					</td>
					</tr>
					<tr>
						<td><?php echo $text_h_upc; ?></td>
						<td><input type="checkbox" name="hide_upc" <?php if ($hide_upc)echo "checked='checked'"?>></td>
						
					</tr>
					<tr>
						<td><?php echo $text_h_ean; ?></td>
						<td><input type="checkbox" name="hide_ean" <?php if ($hide_ean)echo "checked='checked'"?>></td>
						
					</tr>
					<tr>
						<td><?php echo $text_h_jan; ?></td>
						<td><input type="checkbox" name="hide_jan" <?php if ($hide_jan)echo "checked='checked'"?>></td>
						
					</tr>
					<tr>
						<td><?php echo $text_h_isbn; ?></td>
						<td><input type="checkbox" name="hide_isbn" <?php if ($hide_isbn)echo "checked='checked'"?>></td>
						
					</tr>
					<tr>
						<td><?php echo $text_h_mpn; ?></td>
						<td><input type="checkbox" name="hide_mpn" <?php if ($hide_mpn)echo "checked='checked'"?>></td>
						
					</tr>
				
				</table>
			</td>
			</tr>        
		 </table> 
		</div>
		<div id="seo_block" class="vtabs-content">
		<table>
			<tr>
			<td><table>
					<tr>						
						<th><?php echo $text_opt_name; ?></th>
						<th><?php echo $text_opt_value; ?></th>
					</tr>
					<tr>						
						<td><?php echo $text_cache_sql; ?></td>
						<td><input type="checkbox" name="config_seo_query" <?php if ($config_seo_query)echo "checked='checked'"?>></td>
					</tr>
					<tr>						
						<td><?php echo $text_url_full; ?></td>
						<td><input type="checkbox" name="config_seo_url_include_path" <?php if ($config_seo_url_include_path)echo "checked='checked'"?>></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_page; ?></td>
						<td><input type="text" name="config_seo_page" value="<?php echo $config_seo_page; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_show; ?></td>
						<td><input type="text" name="config_seo_show" value="<?php echo $config_seo_show; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_default; ?></td>
						<td><input type="text" name="config_seo_default" value="<?php echo $config_seo_default; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_priceasc; ?></td>
						<td><input type="text" name="config_seo_priceasc" value="<?php echo $config_seo_priceasc; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_pricedesc; ?></td>
						<td><input type="text" name="config_seo_pricedesc" value="<?php echo $config_seo_pricedesc; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_nameasc; ?></td>
						<td><input type="text" name="config_seo_nameasc" value="<?php echo $config_seo_nameasc; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_namedesc; ?></td>
						<td><input type="text" name="config_seo_namedesc" value="<?php echo $config_seo_namedesc; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_modelasc; ?></td>
						<td><input type="text" name="config_seo_modelasc" value="<?php echo $config_seo_modelasc; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_modeldesc; ?></td>
						<td><input type="text" name="config_seo_modeldesc" value="<?php echo $config_seo_modeldesc; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_ratingasc; ?></td>
						<td><input type="text" name="config_seo_ratingasc" value="<?php echo $config_seo_ratingasc; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
					<tr>
						<td><?php echo $text_seo_ratingdesc; ?></td>
						<td><input type="text" name="config_seo_ratingdesc" value="<?php echo $config_seo_ratingdesc; ?>" size="3" style="width: 120px;" /></td>
						
						<td></td>
					</tr>
				</table></td>
			</tr>        
		 </table>
		</div>
        </div>
  
    </form>
	</div>
		
</div>        


<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 1000,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script>  
<script type="text/javascript">
	$('#general_tabs a').tabs();  
	$('#store_tabs a').tabs();	
</script>