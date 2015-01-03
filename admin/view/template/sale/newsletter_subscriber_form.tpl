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
    <h1><img src="view/image/customer.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_name; ?></td>
          <td><input type="text" name="email_name" value="<?php echo isset($email_name)?$email_name:""; ?>" />
            </td>
        </tr>
        <tr>
          <td valign="top" style="padding-top:20px;"><span class="required">*</span> <?php echo $entry_code; ?></td>
          <td>
          <input type="text" name="email_id" id="email_id" value="<?php echo isset($email_id)?$email_id:''; ?>" >
          </textarea> 
          	<?php if (isset($error_email_name)) { ?>
            <span class="error"><?php echo $error_email_name; ?></span>
            <?php  } ?>
			<?php if (isset($error_email_exist)) { ?>
            <span class="error"><?php echo $error_email_exist; ?></span>
            <?php  } ?>
            
            </td>
        </tr>
		<tr>
          <td> <?php echo $entry_code2; ?></td>
          <td><input type="text" name="option1" value="<?php echo isset($option1)?$option1:""; ?>" />
            </td>
        </tr>
      </table>
    </form>
  </div>
</div>
<?php echo $footer; ?>

