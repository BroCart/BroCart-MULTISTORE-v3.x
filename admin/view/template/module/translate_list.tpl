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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><?php echo $heading_title; ?></h1>
      <div class="buttons">
  		<a onclick="$('form').attr('action', '<?php echo $import; ?>'); $('input[name=\'import\']').val('1'); $('form').submit();" class="button"><?php echo $button_import; ?></a>
	  	<a onclick="location = '<?php echo $insert; ?>'" class="button"><?php echo $button_insert; ?></a>
  		<a onclick="$('form').attr('action', '<?php echo $delete; ?>'); $('form').submit();" class="button"><?php echo $button_delete; ?></a>
	  </div>
    </div>
    <div class="content">
      <form action="" method="post" enctype="multipart/form-data" id="form">
      	<input type="hidden" name="import" value="0" />
        <table class="list">
          <thead>
            <tr>
              <td style="width: 1%; text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'interface') { ?>
                <a href="<?php echo $sort_interface; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_interface; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_interface; ?>"><?php echo $column_interface; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'directory') { ?>
                <a href="<?php echo $sort_directory; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_directory; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_directory; ?>"><?php echo $column_directory; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'filename') { ?>
                <a href="<?php echo $sort_filename; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_filename; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_filename; ?>"><?php echo $column_filename; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'key') { ?>
                <a href="<?php echo $sort_key; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_key; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_key; ?>"><?php echo $column_key; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'value') { ?>
                <a href="<?php echo $sort_value; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_value; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_value; ?>"><?php echo $column_value; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <td><select name="filter_interface">
              	<option value="*"><?php echo $text_all; ?></option>
              	<?php foreach($interfaces as $interface) { ?>
              		<?php if($interface == $filter_interface) { ?>
              		<option value="<?php echo $interface; ?>" selected="selected"><?php echo $interface; ?></option>
              		<?php } else { ?>
              		<option value="<?php echo $interface; ?>"><?php echo $interface; ?></option>
              		<?php } ?>
              	<?php } ?>
			  </select></td>
              <td><select name="filter_directory">
              	<option value="*"><?php echo $text_all; ?></option>
              	<?php foreach($directories as $directory) { ?>
              		<?php if($directory == $filter_directory) { ?>
              		<option value="<?php echo $directory; ?>" selected="selected"><?php echo $directory; ?></option>
              		<?php } else { ?>
              		<option value="<?php echo $directory; ?>"><?php echo $directory; ?></option>
              		<?php } ?>
              	<?php } ?>
			  </select></td>
              <td><input type="text" name="filter_filename" value="<?php echo $filter_filename; ?>" /></td>
              <td><input type="text" name="filter_key" value="<?php echo $filter_key; ?>" /></td>
              <td><input type="text" name="filter_value" value="<?php echo $filter_value; ?>" /></td>
              <td class="center"><select name="filter_status">
              	<option value="*"><?php echo $text_all; ?></option>
              	<?php foreach($statuses as $k => $v) { ?>
              		<?php if($k == $filter_status) { ?>
              		<option value="<?php echo $k; ?>" selected="selected"><?php echo $v; ?></option>
              		<?php } else { ?>
              		<option value="<?php echo $k; ?>"><?php echo $v; ?></option>
              		<?php } ?>
              	<?php } ?>
			  </select></td>
              <td class="right"><a id="filter" class="button"><?php echo $button_filter; ?></a></td>
            </tr>
            <?php if ($translations) { ?>
            <?php foreach ($translations as $translation) { ?>
            <tr>
              <td class="center"><?php if ($translation['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $translation['translation_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $translation['translation_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $translation['interface']; ?></td>
              <td class="left"><?php echo $translation['directory']; ?></td>
              <td class="left"><?php echo $translation['filename']; ?></td>
              <td class="left"><?php echo $translation['key']; ?></td>
              <td class="left"><?php echo $translation['value']; ?></td>
              <td class="center"><?php echo $translation['status']; ?></td>
              <td class="right"><?php foreach ($translation['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="9"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=module/translate&token=<?php echo $token; ?>';
	var filter_interface = $('select[name=\'filter_interface\']').attr('value');
	if (filter_interface != '*') {
		url += '&filter_interface=' + encodeURIComponent(filter_interface);
	}
	var filter_directory = $('select[name=\'filter_directory\']').attr('value');
	if (filter_directory != '*') {
		url += '&filter_directory=' + encodeURIComponent(filter_directory);
	}
	var filter_filename = $('input[name=\'filter_filename\']').attr('value');
	if (filter_filename) {
		url += '&filter_filename=' + encodeURIComponent(filter_filename);
	}
	var filter_key = $('input[name=\'filter_key\']').attr('value');
	if (filter_key) {
		url += '&filter_key=' + encodeURIComponent(filter_key);
	}
	var filter_value = $('input[name=\'filter_value\']').attr('value');
	if (filter_value) {
		url += '&filter_value=' + encodeURIComponent(filter_value);
	}
	var filter_status = $('select[name=\'filter_status\']').attr('value');
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}
	location = url;
}
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('input[type="text"]').keyup(function(e) {
		if(e.which == 13) {
			filter();
		}
	});
	$('select').change(function() {
		filter();
	});
	$('#filter').click(function() {
		filter();
	});
});
//--></script>
<?php echo $footer; ?> 