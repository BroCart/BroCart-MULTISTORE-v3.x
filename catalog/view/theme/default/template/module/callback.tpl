<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box" id="inline-popups" style="margin-bottom: 0px;">
        <a href="#cme_form" data-effect="mfp-newspaper" ><img width="160" alt="<?php echo $text_callback?>" src="catalog/view/theme/default/image/call2.png"></a>
    </div>
  </div>
</div>
<!--div id="test-popup" class="white-popup mfp-with-anim mfp-hide" style="border-radius: 10px 10px 10px 10px;"-->

<!--callme_start-->

<div id="cme_form" class="mfp-with-anim mfp-hide" style=" left: 524.5px; top: 35%; display: block;">
	<a id="cme_cls" onclick="callback_close();" href="javascript:void(0);">&nbsp;</a>
	<h6><?php echo $text_callback?></h6>
	
	<div id="callback_message2" style="display:none;" class="error_block">
		<span id="callback_message" class="error_message" style="text-align:center"></span>
	</div>

	<div style="display:none;" id="callback_success" class="success_block">
		<span class="success_message" style="text-align:center">
			<?php echo $text_success?>
		</span>
	</div>
	
<form id="callback_ajax_form" onsubmit="return callback_ajax();" method="POST">	
	<div class="callback_content">
	
	<input type="hidden" value="yes" name="callback"/>
	<?php if ($show_name) { ?>
	
	<span class="text_color"><?php echo $text_name; ?></span><?php if( $required_name ) {?><span class="required">*</span>&nbsp;<?php } ?>
	<span><input placeholder="Имя" class="callback_input" value="" id="user_name" name="user_name" type="text" maxlength="150"/></span>
	<div id="user_name_error" class="error_message"></div>
	<?php } ?>
	
	
	<span class="text_color"><?php echo $text_phone; ?></span><?php if( $required_phone ) {?><span class="required">*</span>&nbsp;<?php } ?>
	<span><input placeholder="Телефон" class="callback_input" value="" id="user_phone" name="user_phone" type="text" maxlength="150"/></span>
	<div id="user_phone_error" class="error_message"></div>
	
	<?php if ($show_comment) { ?>
	<span class="text_color"><?php echo $text_comment; ?></span><?php if( $required_comment ) {?><span class="required">*</span>&nbsp;<?php } ?>
	<span><textarea placeholder="Комментарий" class="callback_textarea" id="user_comment" name="user_comment"></textarea></span>
	<div id="user_comment_error" class="error_message"></div>
	<?php } ?>
	
	
	<?php if ($show_email) { ?>
	<span class="text_color"><?php echo $text_email; ?></span>
	<span><input placeholder="E-mail" class="callback_input" value="" id="user_email" name="user_email" type="text" maxlength="150"/></span>
	<div id="user_email_error" class="error_message"></div>
	<?php } ?>
	
	<?php if ($show_time) { ?>
	<span class="cme_ct">
	<div><?php echo $text_time; ?></div>
	<div>&nbsp;с&nbsp;&nbsp;</div>
	<div><select id="recommend_to_call" name="recommend_to_call">
		<option>~</option>
		<option value="8">08</option>
		<option value="9">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
		<option value="13">13</option>
		<option value="14">14</option>
		<option value="15">15</option>
		<option value="16">16</option>
		<option value="17">17</option>
		<option value="18">18</option>
		<option value="19">19</option>
	</select>
	</div>
	<div>&nbsp;до&nbsp;</div>
	<div>
	<select id="recommend_to_call" name="cme_ct_finish">
		<option>~</option>
		<option value="9">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
		<option value="13">13</option>
		<option value="14">14</option>
		<option value="15">15</option>
		<option value="16">16</option>
		<option value="17">17</option>
		<option value="18">18</option>
		<option value="19">19</option>
		<option value="20">20</option>
	</select>
	</div>
	<div>час.</div>
	</span>
	<?php } ?>
	
		<input class="cme_btn" id="submit_callback" type="submit" value="<?php echo $text_request?>" style="opacity: 1;">
	
	<div id="callme_result"></div>
	</div>
</form>
</div>

<!--callme_end-->

<!--/div-->
<script>
$('#inline-popups').magnificPopup({
  delegate: 'a',
  removalDelay: 500, 
  callbacks: {
    beforeOpen: function() {
       this.st.mainClass = this.st.el.attr('data-effect');
    }
  },
  midClick: true 
});


	function callback_close(){
		$('#callback_form').hide();
		return false;
	}

	function callback_show(){
        margin_top = -$('#callback_form').height()/2;
        margin_left= -$('#callback_form').width()/2;
        $('#callback_form').css({'margin-left': margin_left, 'margin-top': margin_top });
		$('#callback_form').show();

		$('#callback_ajax_form').show();
		$('#callback_success').hide();

		$('#user_name').val('');
		$('#user_phone').val('');
		$('#recommend_to_call').val('');
		$('#user_comment').val('');
		$('#callback_code').val('');
		return false;
	}

	function show_message_callback(id_message, message){
		$('#'+id_message+'_error').html(message).show();
		$("#"+id_message).focus();
		$("#"+id_message).addClass('input_error');
		return false;
	}

	function callback_ajax(){
		var vars = $('#callback_ajax_form').serialize();
		$('#load_callback').show();
		$('#submit_callback').hide();
		$.ajax({
			type: "POST",
			data: 'callback=yes&'+vars,
			url:'index.php?route=module/callback/ajax',
			dataType:'json',
			success: function(json){
				$('#load_callback').hide();
				$('#submit_callback').show();
				$('.callback_input').removeClass('input_error');
				$('.error_message').html('').hide();
				switch (json['result']) {
					case 'success':
						$('#callback_message2').hide();
						$('#callback_ajax_form').hide();
						$('#callback_success').show();
					break;
					case 'error':
					    $.each(json['errors'], 
						function(index, value){
							show_message_callback(index, value);
						});

					break;
				}
			}
			});
		return false;
	}
</script>
