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
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div class="vtabs">
          <?php $module_row = 1; ?>
          <?php foreach ($modules as $module) { ?>
          <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
          <?php $module_row++; ?>
          <?php } ?>
          <span id="module-add"><?php echo $button_add_module; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> </div>
        <?php $module_row = 1; ?>
        <?php foreach ($modules as $module) { ?>
        <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
          <table class="list">
            <tr>
              <td><?php echo $entry_layout; ?></td>
              <td><select name="filters_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_position; ?></td>
              <td><select name="filters_module[<?php echo $module_row; ?>][position]">
			  <?php if ($module['position'] == 'header_top') { ?>
			<option value="header_top" selected="selected"><?php echo $text_header_top; ?></option>
			<?php } else { ?>
			<option value="header_top"><?php echo $text_header_top; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'header_top_left') { ?>
			<option value="header_top_left" selected="selected"><?php echo $text_header_top_left; ?></option>
			<?php } else { ?>
			<option value="header_top_left"><?php echo $text_header_top_left; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'header_top_right') { ?>
			<option value="header_top_right" selected="selected"><?php echo $text_header_top_right; ?></option>
			<?php } else { ?>
			<option value="header_top_right"><?php echo $text_header_top_right; ?></option>
			<?php } ?>			
			
			<?php if ($module['position'] == 'slider_top') { ?>
			<option value="slider_top" selected="selected"><?php echo $text_slider_top; ?></option>
			<?php } else { ?>
			<option value="slider_top"><?php echo $text_slider_top; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'slider_left') { ?>
			<option value="slider_left" selected="selected"><?php echo $text_slider_left; ?></option>
			<?php } else { ?>
			<option value="slider_left"><?php echo $text_slider_left; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'slider_right') { ?>
			<option value="slider_right" selected="selected"><?php echo $text_slider_right; ?></option>
			<?php } else { ?>
			<option value="slider_right"><?php echo $text_slider_right; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'slider_content') { ?>
			<option value="slider_content" selected="selected"><?php echo $text_slider_content; ?></option>
			<?php } else { ?>
			<option value="slider_content"><?php echo $text_slider_content; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'slider_content_left') { ?>
			<option value="slider_content_left" selected="selected"><?php echo $text_slider_content_left; ?></option>
			<?php } else { ?>
			<option value="slider_content_left"><?php echo $text_slider_content_left; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'slider_content_right') { ?>
			<option value="slider_content_right" selected="selected"><?php echo $text_slider_content_right; ?></option>
			<?php } else { ?>
			<option value="slider_content_right"><?php echo $text_slider_content_right; ?></option>
			<?php } ?>			
			
			<?php if ($module['position'] == 'footer_top') { ?>
			<option value="footer_top" selected="selected"><?php echo $text_footer_top; ?></option>
			<?php } else { ?>
			<option value="footer_top"><?php echo $text_footer_top; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'footer_top_left') { ?>
			<option value="footer_top_left" selected="selected"><?php echo $text_footer_top_left; ?></option>
			<?php } else { ?>
			<option value="footer_top_left"><?php echo $text_footer_top_left; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'footer_top_right') { ?>
			<option value="footer_top_right" selected="selected"><?php echo $text_footer_top_right; ?></option>
			<?php } else { ?>
			<option value="footer_top_right"><?php echo $text_footer_top_right; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'footer_bottom') { ?>
			<option value="footer_bottom" selected="selected"><?php echo $text_footer_bottom; ?></option>
			<?php } else { ?>
			<option value="footer_bottom"><?php echo $text_footer_bottom; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'footer_bottom_left') { ?>
			<option value="footer_bottom_left" selected="selected"><?php echo $text_footer_bottom_left; ?></option>
			<?php } else { ?>
			<option value="footer_bottom_left"><?php echo $text_footer_bottom_left; ?></option>
			<?php } ?>
			
			<?php if ($module['position'] == 'footer_bottom_right') { ?>
			<option value="footer_bottom_right" selected="selected"><?php echo $text_footer_bottom_right; ?></option>
			<?php } else { ?>
			<option value="footer_bottom_right"><?php echo $text_footer_bottom_right; ?></option>
			<?php } ?>
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="filters_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="filters_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            </tr>

          </table>
        </div>
        <?php $module_row++; ?>
        <?php } ?>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
	
	html += '  <table class="list">';
	html += '    <tr>';
	html += '      <td><?php echo $entry_layout; ?></td>';
	html += '      <td><select name="filters_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_position; ?></td>';
	html += '      <td><select name="filters_module[' + module_row + '][position]">';
	html += '      <option value="header_top"><?php echo $text_header_top; ?></option>';
	html += '      <option value="header_top_left"><?php echo $text_header_top_left; ?></option>';
	html += '      <option value="header_top_right"><?php echo $text_header_top_right; ?></option>';
	html += '      <option value="slider_top"><?php echo $text_slider_top; ?></option>';
	html += '      <option value="slider_left"><?php echo $text_slider_left; ?></option>';
	html += '      <option value="slider_right"><?php echo $text_slider_right; ?></option>';			
	html += '      <option value="slider_content"><?php echo $text_slider_content; ?></option>';
	html += '      <option value="slider_content_left"><?php echo $text_slider_content_left; ?></option>';
	html += '      <option value="slider_content_right"><?php echo $text_slider_content_right; ?></option>';
	html += '      <option value="footer_top"><?php echo $text_footer_top; ?></option>';
	html += '      <option value="footer_top_left"><?php echo $text_footer_top_left; ?></option>';
	html += '      <option value="footer_top_right"><?php echo $text_footer_top_right; ?></option>';
	html += '      <option value="footer_bottom"><?php echo $text_footer_bottom; ?></option>';
	html += '      <option value="footer_bottom_left"><?php echo $text_footer_bottom_left; ?></option>';
	html += '      <option value="footer_bottom_right"><?php echo $text_footer_bottom_right; ?></option>';
	html += '        <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '        <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '        <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '        <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_status; ?></td>';
	html += '      <td><select name="filters_module[' + module_row + '][status]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_sort_order; ?></td>';
	html += '      <td><input type="text" name="filters_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    </tr>';

	

	html += '  </table>'; 
	html += '</div>';
	
	$('#form').append(html);
	
	//$('#language-' + module_row + ' a').tabs();
	
	$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
	
	$('.vtabs a').tabs();
	
	$('#module-' + module_row).trigger('click');
	
	module_row++;
}
//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?> 
//--></script> 
<?php echo $footer; ?>