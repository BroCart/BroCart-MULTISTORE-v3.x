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
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
  <div class="content">
    <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a></div>
    <div id="tab-general">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="gallery_status">
                <?php if ($gallery_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          
          <tr>
            <td><?php echo $entry_gallery_thumb; ?></td>
            <td><input type="text" name="config_gallery_thumb_width" value="<?php echo $config_gallery_thumb_width; ?>" size="3" />
              x
              <input type="text" name="config_gallery_thumb_height" value="<?php echo $config_gallery_thumb_height; ?>" size="3" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_gallery_popup; ?></td>
            <td><input type="text" name="config_gallery_popup_width" value="<?php echo $config_gallery_popup_width; ?>" size="3" />
              x
              <input type="text" name="config_gallery_popup_height" value="<?php echo $config_gallery_popup_height; ?>" size="3" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_limit; ?></td>
            <td><input type="text" name="config_gallery_limit" value="<?php echo $config_gallery_limit; ?>" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
    <div id="tab-data">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="list_form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" align="center"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php echo $column_title; ?></td>
              <td class="right"><?php echo $column_sort_order; ?></td>
              <td class="right"><?php echo $column_status; ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($galleries) { ?>
            <?php $class = 'odd'; ?>
            <?php foreach ($galleries as $gallery) { ?>
            <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
            <tr class="<?php echo $class; ?>">
              <td align="center"><?php if ($gallery['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $gallery['gallery_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $gallery['gallery_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $gallery['name']; ?></td>
              <td class="right"><?php echo $gallery['sort_order']; ?></td>
              <td class="right"><?php echo $gallery['status']; ?></td>
              <td class="right"><?php foreach ($gallery['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr class="even">
              <td class="center" colspan="5"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="buttons"><a onclick="location='<?php echo $insert; ?>'" class="button"><span><?php echo $button_insert; ?></span></a><a onclick="$('#list_form').submit();" class="button"><span><?php echo $button_delete; ?></span></a></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs();
//--></script> 
<?php echo $footer; ?>