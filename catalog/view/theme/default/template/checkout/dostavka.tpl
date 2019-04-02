<?php if ($error_warning) { ?>
<span><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></span>
<?php } ?>
<?php if ($shipping_methods) { ?>
<i><?php echo $text_shipping_method; ?></i>
<select name="shipping_method" id="shipping-method-select" class="form-control large-field">
<?php foreach ($shipping_methods as $shipping_method) { ?>
	<?php if ($code == $shipping_method['value']) { ?>
	<option value="<?php echo $shipping_method['value']; ?>" selected="selected" ><?php echo $shipping_method['title']; ?></option>
	<?php } else { ?>
	<option value="<?php echo $shipping_method['value']; ?>"><?php echo $shipping_method['title']; ?></option>
	<?php } ?>
<?php } ?>
</select>
</br>
<strong><?php echo $text_comments; ?></strong>
<input type="checkbox" id="need-comment" value="1" style="vertical-align: top;" />
<script type="text/javascript"><!--
$(document).ready(function() {	
    $('#need-comment').change(function() {
        if(this.checked) {            
            $('#comments').removeClass('hidden');
        } else {
			$('#comments').addClass('hidden');
		}   
    });	
});
//--></script>
<?php } ?>