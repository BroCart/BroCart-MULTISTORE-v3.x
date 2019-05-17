<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
    <ul class="payment_methods methods">
		<?php foreach ($payment_methods as $payment_method) { ?>
        <li class="payment_method_bro">	
			<?php if ($payment_method['code'] == $code || !$code) { ?>
				<?php $code = $payment_method['code']; ?>
				<input id="payment-method-<?php echo $payment_method['code']; ?>" type="radio" class="input-radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
				<?php } else { ?>
				<input id="payment-method-<?php echo $payment_method['code']; ?>" type="radio" class="input-radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
			<?php } ?>
			<label for="payment-method-<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label>			
            <?php if ($payment_method['terms']) { ?>
			<div class="payment_box payment_method_bro">
				<p><?php echo $payment_method['terms']; ?></p>
			</div>
			<?php } ?>        
        </li>  
		<?php } ?>
    </ul>
<div class="clear"></div>
<?php } ?>