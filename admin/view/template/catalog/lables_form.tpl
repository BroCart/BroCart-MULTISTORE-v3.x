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
    <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
 
      <table class="form">
	  <?php foreach ($languages as $language) { ?>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_stick_text; ?><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td>
		
          <td><input name="stick_text[<?php echo $language['language_id']; ?>][stick_text]" value="<?php echo isset($stick_text[$language['language_id']]['stick_text']) ? $stick_text[$language['language_id']]['stick_text'] : ''; ?>" size="30" />
            <?php if ($error_stick_text) { ?>
            <span class="error"><?php echo $error_stick_text; ?></span>
            <?php } ?> 
		<span><select name="stick_text[<?php echo $language['language_id']; ?>][stick_main]">
		<?php if (isset($stick_text[$language['language_id']]['stick_main'])) { ?>
			<option value="0" <?php if ($stick_text[$language['language_id']]['stick_main'] == '0') { ?> selected="selected" <?php } ?> >Сверху-Справа</option>
			<option value="1" <?php if ($stick_text[$language['language_id']]['stick_main'] == '1') { ?> selected="selected" <?php } ?> >Сверху-Слева</option>
			<option value="2" <?php if ($stick_text[$language['language_id']]['stick_main'] == '2') { ?> selected="selected" <?php } ?> >Снизу-Слева</option>
			<option value="3" <?php if ($stick_text[$language['language_id']]['stick_main'] == '3') { ?> selected="selected" <?php } ?> >Снизу-Справа</option>
		<?php } else { ?>
			<option value="0" selected="selected">Сверху-Справа</option>
			<option value="1">Сверху-Слева</option>
			<option value="2">Снизу-Слева</option>
			<option value="3">Снизу-Справа</option>
		<?php } ?>
        </select></span></td>
          <td><div class="image"><img src="<?php echo $thumb[$language['language_id']]; ?>" alt="" id="thumb<?php echo $language['language_id']; ?>" /><br />
          <input type="hidden" name="stick_text[<?php echo $language['language_id']; ?>][image]" value="<?php echo isset($stick_text[$language['language_id']]['image']) ? $stick_text[$language['language_id']]['image'] : ''; ?>" id="image<?php echo $language['language_id']; ?>" />
          <a onclick="image_upload('image<?php echo $language['language_id']; ?>', 'thumb<?php echo $language['language_id']; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $language['language_id']; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $language['language_id']; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
        </tr>
		<?php } ?>
	<tr>
          <td><?php echo $entry_sort_order; ?></td>
          <td><input name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
        </tr>
      </table>
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
<?php echo $footer; ?>