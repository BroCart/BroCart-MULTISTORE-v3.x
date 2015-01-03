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
      <h1><?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
        <?php if(!$edit) { ?>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_interface; ?></td>
            <td>
				<select name="interface">
	              	<option value="false"><?php echo $text_select; ?></option>
	              	<?php foreach($interfaces as $interface) { ?>
	              		<?php if($interface == $post_interface) { ?>
	              		<option value="<?php echo $interface; ?>" selected="selected"><?php echo $interface; ?></option>
	              		<?php } else { ?>
	              		<option value="<?php echo $interface; ?>"><?php echo $interface; ?></option>
	              		<?php } ?>
	              	<?php } ?>
				</select>
				<?php if ($error_interface) { ?>
				<span class="error"><?php echo $error_interface; ?></span>
				<?php } ?>
			</td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_directory; ?></td>
            <td>
				<select name="directory">
	              	<option value="false"><?php echo $text_select; ?></option>
	              	<?php foreach($directories as $directory) { ?>
	              		<?php if($directory == $post_directory) { ?>
	              		<option value="<?php echo $directory; ?>" selected="selected"><?php echo $directory; ?></option>
	              		<?php } else { ?>
	              		<option value="<?php echo $directory; ?>"><?php echo $directory; ?></option>
	              		<?php } ?>
	              	<?php } ?>
				</select>
				<?php if ($error_directory) { ?>
				<span class="error"><?php echo $error_directory; ?></span>
				<?php } ?>
			</td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_filename; ?></td>
            <td><input type="text" name="filename" value="<?php echo $post_filename; ?>" />
              <?php if ($error_filename) { ?>
              <span class="error"><?php echo $error_filename; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_key; ?></td>
            <td><input type="text" name="key" value="<?php echo $post_key; ?>" />
              <?php if ($error_key) { ?>
              <span class="error"><?php echo $error_key; ?></span>
              <?php } ?></td>
          </tr>
		<?php } else { ?>
          <tr>
            <td><?php echo $entry_interface; ?></td>
            <td><?php echo $post_interface; ?><input type="hidden" name="interface" value="<?php echo $post_interface; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_directory; ?></td>
            <td><?php echo $post_directory; ?><input type="hidden" name="directory" value="<?php echo $post_directory; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_filename; ?></td>
            <td><?php echo $post_filename; ?><input type="hidden" name="filename" value="<?php echo $post_filename; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_key; ?></td>
            <td><?php echo $post_key; ?><input type="hidden" name="key" value="<?php echo $post_key; ?>" /></td>
          </tr>
		<?php } ?>
          <tr>
            <td><?php echo $entry_value; ?></td>
            <td><textarea name="value" rows="5" cols="80"><?php echo $post_value; ?></textarea>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>