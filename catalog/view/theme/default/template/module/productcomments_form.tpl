<h2 id="comment-title"><?php echo $text_post_comment; ?></h2>

<form id="pcForm">
<b><?php echo $text_name; ?></b><br />
<input type="text" name="pcName" value="<?php echo $pcName; ?>" <?php if ($this->customer->isLogged() && $pcconf_enforce_customer_data) { ?> disabled="disabled" <?php } ?> /><br /><br />

<b><?php echo $text_email; ?></b><br />
<input type="text" name="pcEmail" value="<?php echo $pcEmail; ?>" <?php if ($this->customer->isLogged() && $pcconf_enforce_customer_data) { ?> disabled="disabled" <?php } ?> /><br /> <br /> <br />

<b><?php echo $text_comment; ?></b>
<textarea name="pcText" cols="40" rows="8" style="width: 98%;" <?php if ($pcconf_maxlen > 0) echo "maxlength='$pcconf_maxlen'" ?>></textarea>
<span style="font-size: 11px;"><?php echo $text_note; ?></span><br /> <br />

<?php if (!$this->customer->isLogged() || ($this->customer->isLogged() && $this->config->get('pcconf_enable_customer_captcha'))) { ?>
<b><?php echo $pc_enter_captcha; ?></b><br />
<input type="text" name="pcCaptcha" value="" />
<br />
<img src="index.php?route=product/product/captcha2" alt="" id="pcCaptcha" /><br />
<br />
<?php } ?>
</form>
<div class="buttons">
	<div class="right"><a id="pcSubmitBtn" class="button"><span><?php echo $button_continue; ?></span></a></div>
</div>

<script type="text/javascript">
	var pc_product_id = <?php echo $product_id; ?>;
	var pc_wait = '<?php echo $pc_wait; ?>';
</script>