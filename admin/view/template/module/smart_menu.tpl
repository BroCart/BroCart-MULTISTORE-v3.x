<?php echo $header; ?>
<script type="text/javascript" src="view/javascript/jquery/farbtastic/farbtastic.js"></script>
<link type="text/css" href="view/javascript/jquery/farbtastic/farbtastic.css" rel="stylesheet" />
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
<div id="picker"></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
	      <td class="left"><?php echo $entry_config; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php $color_row = ''; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><select name="smart_menu_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="smart_menu_module[<?php echo $module_row; ?>][position]">
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
              <td class="left">
                  <label for="color1"><?php echo $text_color_Main; ?>:</label><input type="text" id="color<?php echo $module_row; ?>" name="smart_menu_module[<?php echo $module_row; ?>][config][color_Main]" class="colorwell" value="<?php echo $module['config']['color_Main']; ?>" />
                  </br><label for="color1"><?php echo $text_color_Text_main; ?>:</label><input type="text" id="color<?php echo $module_row; ?>" name="smart_menu_module[<?php echo $module_row; ?>][config][text_main]" class="colorwell" value="<?php echo $module['config']['text_main']; ?>" />
                  </br><label for="color1"><?php echo $text_color_sub; ?>:</label><input type="text" id="color<?php echo $module_row; ?>" name="smart_menu_module[<?php echo $module_row; ?>][config][color_sub]" class="colorwell" value="<?php echo $module['config']['color_sub']; ?>" />
                  </br><label for="color1"><?php echo $text_color_Text_sub; ?>:</label><input type="text" id="color<?php echo $module_row; ?>" name="smart_menu_module[<?php echo $module_row; ?>][config][Text_sub]" class="colorwell" value="<?php echo $module['config']['Text_sub']; ?>" />
				  </br><label for="color1"><?php echo $text_color_Active_cat; ?>:</label><input type="text" id="color<?php echo $module_row; ?>" name="smart_menu_module[<?php echo $module_row; ?>][config][Active_cat]" class="colorwell" value="<?php echo $module['config']['Active_cat']; ?>" />
	<div class="config_form-item">
                </td>

              <td class="left"><select name="smart_menu_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="smart_menu_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="5"></td>
              <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="smart_menu_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="smart_menu_module[' + module_row + '][position]">';
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
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';        
	html += '    <td class="left">';
	html += '<label for="color[' + module_row + ']"><?php echo $text_color_Main; ?>:</label>';
	html += '<input type="text" id="color<?php echo $module_row; ?>" name="smart_menu_module[' + module_row + '][config][color_Main]" class="colorwell" value="#11b631" />';
	html += '</br><label for="color1"><?php echo $text_color_Text_main; ?>:</label><input type="text" id="color<?php echo $module_row; ?>" name="smart_menu_module[<?php echo $module_row; ?>][config][text_main]" class="colorwell" value="#424342" />';        
    html += '</br><label for="color1"><?php echo $text_color_sub; ?>:</label><input type="text" id="color<?php echo $module_row; ?>" name="smart_menu_module[<?php echo $module_row; ?>][config][color_sub]" class="colorwell" value="#11b631" />';        
	html += '</br><label for="color1"><?php echo $text_color_Text_sub; ?>:</label><input type="text" id="color<?php echo $module_row; ?>" name="smart_menu_module[<?php echo $module_row; ?>][config][Text_sub]" class="colorwell" value="#424342" />';
	html += '</br><label for="color1"><?php echo $text_color_Active_cat; ?>:</label><input type="text" id="color<?php echo $module_row; ?>" name="smart_menu_module[<?php echo $module_row; ?>][config][Active_cat]" class="colorwell" value="#424342" />';
	html += '</td>'; 
	html += '    <td class="left"><select name="smart_menu_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="smart_menu_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	addcolor();	
	module_row++;
}
function addcolor(){
$(".colorwell").click( function(event) {
  var div = $("#picker");
  div.css( {
      position:"absolute", 
      display: "inline",
      top:event.pageY-150, 
      left: event.pageX+50});

  var delayTimer = setTimeout( function( ) {
        div.fadeIn( "slow");
     }, 100);

  div.mouseover( function( event) {
     if (delayTimer)
         clearTimeout( delayTimer);
  }).mouseout( function(){
     if (delayTimer)
         clearTimeout( delayTimer);
     var $that = $(this);
     delayTimer = setTimeout( function( ) {
        $that.fadeOut( "slow");
     }, 500)         
  });
});


    var f = $.farbtastic('#picker');
    var p = $('#picker').css('opacity', 0.25);
    var selected;
 $('.colorwell')
      .each(function () { f.linkTo(this); $(this).css('opacity', 0.75); })
      .focus(function() {
        if (selected) {
          $(selected).css('opacity', 0.75).removeClass('colorwell-selected');
        }
        f.linkTo(this);
        p.css('opacity', 1);
        $(selected = this).css('opacity', 1).addClass('colorwell-selected');
      });
      }
//--></script> 
 <script type="text/javascript" charset="utf-8">
  $(document).ready(function() {
     addcolor();
  });
 </script>
<?php echo $footer; ?>
<div id="picker" style="float: right;"></div>