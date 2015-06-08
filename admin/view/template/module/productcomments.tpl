<?php echo $header; ?>

<style type='text/css'>
table.form > tbody > tr > td:first-child {
	width: 300px;
}

.q-heading {
	margin-bottom: 10px;
	padding: 10px 10px 10px 33px;
	color: #555555;
	cursor: pointer;
}

.q-heading.red {
	border: 1px solid #F8ACAC;
	background-color: #FFD1D1;
}

.q-heading.green {
   background-color: #EAF7D9;
   border: 1px solid #BBDF8D;
}

.q-heading .lt {
	text-align: left;
	display: inline-block;
	width: 80%;
}

.q-heading .rt {
	text-align: right;
	display: inline-block;	
	width: 20%;
}

.q-content {
	margin-bottom: 5px;
	padding: 10px;
	display: none;
}

.q-content.red {
	border: 1px solid #F8ACAC;
}

.q-content.green {
	border: 1px solid #BBDF8D;
}

table.form > tbody > tr {
	border-bottom: 1px dotted #CCCCCC;
	color: #000000;
	padding: 10px;
}

table.form > tbody > tr > td:first-child {
	width: 200px;
}

table.form {
	width: 100%;
	text-align: left;
}

</style>

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
			<h1><img src="view/image/module.png"/><?php echo $heading_title; ?></h1>
			<div class="buttons">
				<a class="button" id="saveSettings"><?php echo $button_save; ?></a>
				<a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a>
			</div>
	  	</div>
	  	<div class="content">
		 	<div id="tabs" class="htabs">
		 		<a href="#tab-comments"><?php echo $pc_comments; ?></a>
		 		<a href="#tab-settings"><?php echo $pc_settings; ?></a>
		 	</div>
		 	
		 	<!-- BEGIN COMMENTS TAB -->
		 	<div id="tab-comments">
				<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
				<?php if (!empty($pcComments)) {
					foreach($pcComments as $q) {
						$checked = ($q['display']) ? "checked = 'checked'" : '';  ?>
						<div>
							<?php
								if (strlen($q['comment']) > 80)
									$theComment = substr(strip_tags($q['comment']), 0, 80) . "...";
								else 
									$theComment = strip_tags($q['comment']);
							?>
							<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="pcForm<?php echo $q['id']; ?>">
							<div class="q-heading <?php echo (!($q['display']) ? 'red' : 'green'); ?>"><span class="lt"><?php echo '<b>' . $q['id'] . '. ' . $q['product_name'] . '.</b> ' . $theComment; ?></span><span class="rt"><?php echo date('d-m-Y, H:i:s', $q['create_time']); ?></span></div>
							<div class="q-content <?php echo (!($q['display']) ? 'red' : 'green'); ?>">
							<div class="buttons" style="float: right"><a onclick="saveComment(<?php echo $q['id']; ?>)" class="button"><?php echo $text_save; ?></a><a onclick="delComment(<?php echo $q['id']; ?>)" class="button"><?php echo $text_delete; ?></a></div>
							<input type='hidden' name='comment_id' value='<?php echo $q['id']; ?>'/></td>
							<input type="hidden" name="product_id" value="<?php echo $q['product_id']; ?>" />
							<table class="form">
							<tr>					
								<td><?php echo $text_display; ?></td>
								<td><input type='checkbox' name='display' <?php echo $checked; ?> /></td>
							</tr>		
							<tr>
								<td><?php echo $text_name; ?></td>
								<td><input type='text' name='name' value='<?php echo $q['name']; ?>' /></td>
							</tr>
							<tr>
								<td><?php echo $text_email; ?></td>
								<td><input type='text' name='email' value='<?php echo $q['email']; ?>' /></td>
							</tr>
							<tr>					
								<td><?php echo $text_product; ?></td>
								<td><?php echo $q['product_name']; ?></td>
							</tr>
							<tr>
								<td><?php echo $text_comment; ?></td>
								<td><textarea class="ckeditor" name='comment' id='<?php echo "pcComment" . $q['id']; ?>'><?php echo nl2br(htmlspecialchars($q['comment'])); ?></textarea></td>
							</tr>
							</table>
							</form>
							</div>
						</div>
						<script type="text/javascript">
							CKEDITOR.replaceClass = 'ckeditor';
						</script>						
					<?php } ?>
				<?php } else {
					echo "$text_no_comments_added";
				} ?>
				<div class="pagination"><?php echo $pagination; ?></div>
		 	</div>
		 	
		 	<!-- BEGIN COMMENTS TAB -->
		 	<div id="tab-settings">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-settings">
					<table class="form">
						<tr>
							<td>
								<span><?php echo $pc_config_email; ?></span>
								<span class="help"><?php echo $pc_config_email_note; ?></span>
							</td>
							<td>
								<input size="20" type="text" name="pcconf_email" value="<?php echo $pcconf_email; ?>" />
							</td>
						</tr>

						<tr>
							<td>
								<span><?php echo $pc_config_allow_guests; ?></span>
								<span class="help"><?php echo $pc_config_allow_guests_note; ?></span>
							</td>
							<td>
				                <input type="radio" name="pcconf_allow_guests" value="1" <?php if($pcconf_allow_guests == 1) { ?> checked="checked" <?php } ?>  />
				                <?php echo $text_yes; ?>
				                <input type="radio" name="pcconf_allow_guests" value="0" <?php if($pcconf_allow_guests == 0) { ?> checked="checked" <?php } ?>  />
				                <?php echo $text_no; ?>
							</td>
						</tr>

						<tr>
							<td>
								<span><?php echo $pc_config_enforce_customer_data; ?></span>
								<span class="help"><?php echo $pc_config_enforce_customer_data_note; ?></span>
							</td>
							<td>
				                <input type="radio" name="pcconf_enforce_customer_data" value="1" <?php if($pcconf_enforce_customer_data == 1) { ?> checked="checked" <?php } ?>  />
				                <?php echo $text_yes; ?>
				                <input type="radio" name="pcconf_enforce_customer_data" value="0" <?php if($pcconf_enforce_customer_data == 0) { ?> checked="checked" <?php } ?>  />
				                <?php echo $text_no; ?>
							</td>
						</tr>

						<tr>
							<td>
								<span><?php echo $pc_config_enable_customer_captcha; ?></span>
								<span class="help"><?php echo $pc_config_enable_customer_captcha_note; ?></span>
							</td>
							<td>
				                <input type="radio" name="pcconf_enable_customer_captcha" value="1" <?php if($pcconf_enable_customer_captcha == 1) { ?> checked="checked" <?php } ?>  />
				                <?php echo $text_yes; ?>
				                <input type="radio" name="pcconf_enable_customer_captcha" value="0" <?php if($pcconf_enable_customer_captcha == 0) { ?> checked="checked" <?php } ?>  />
				                <?php echo $text_no; ?>
							</td>
						</tr>

						<tr>
							<td>
								<span><?php echo $pc_config_maxlen; ?></span>
								<span class="help"><?php echo $pc_config_maxlen; ?></span>
							</td>
							<td>
								<input size="2" type="text" name="pcconf_maxlen" value="<?php echo $pcconf_maxlen; ?>" />
							</td>
						</tr>
											
						<tr>
							<td>
								<span><?php echo $pc_config_perpage; ?></span>
								<span class="help"><?php echo $pc_config_perpage_note; ?></span>
							</td>
							<td>
								<input size="2" type="text" name="pcconf_perpage" value="<?php echo $pcconf_perpage; ?>" />
							</td>
						</tr>
					</table>
				</form>
		 	</div>		 	
	</div>
	
  </div>
</div>

<script type="text/javascript">
function saveComment(comment_id) {
	$("#pcForm" + comment_id + ' textarea.ckeditor').each(function () {
		$(this).val(CKEDITOR.instances[$(this).attr('id')].getData());
	});

    $.ajax({
    	type: "POST",
      	url: 'index.php?route=module/productcomments/editComment&token=<?php echo $token; ?>',
      	data: $("#pcForm"+comment_id).serialize(),
      	dataType: 'json',
      	beforeSend: function() {
	      	$("#pcForm" + comment_id).find('.q-content').slideToggle('fast');
	      	$("#pcForm" + comment_id).find('.q-heading').addClass("loading");
      	},
      	complete: function() {
      		$("#pcForm" + comment_id).find('.q-heading').removeClass("loading").removeClass("red").addClass("green");
      		$("#pcForm" + comment_id).find('.q-content').removeClass("red").addClass("green");
      		$("#pcForm" + comment_id).find('.q-heading').effect("highlight", {color: '#BBDF8D'}, 2000);
      	},
      	success: function(json) {
      	}
    });
}

function delComment(comment_id) {
    $.ajax({
    	type: "GET",
      	url: 'index.php?route=module/productcomments/deleteComment&comment_id='+ comment_id +'&token=<?php echo $token; ?>',
      	beforeSend: function() {
	      	$("#pcForm" + comment_id).find('.q-content').slideToggle('fast');
	      	$("#pcForm" + comment_id).find('.q-heading').addClass("loading");
      	},
      	complete: function() {
      		$("#pcForm" + comment_id).parent().fadeOut(500, function() { $("#pcForm" + comment_id).parent().remove(); });
      	},
      	success: function(json) {
      	}
    });
}

$('.q-heading').bind('click', function() {
	if ($(this).hasClass('active')) {
		$(this).removeClass('active');
	} else {
		$(this).addClass('active');
	}
		
	$(this).parent().find('.q-content').slideToggle('slow');
});

$('#tabs a').tabs();

$(function() {
	$("#saveSettings").click(function() {
		$("#error").html('').hide();
		$.ajax({
			type: "POST",
			dataType: "json",
			url: 'index.php?route=module/productcomments/savesettings&token=<?php echo $token; ?>',
			data: $('#form-settings,#form-sidebar').serialize(),
			success: function(jsonData) {
				if (!$.isEmptyObject(jsonData.errors)) {
					jQuery.each(jsonData.errors, function(index, item) {
						$("#error").append('<p>'+jsonData.errors[error]+'</p>').show();
					});
				} else {
					window.location.reload();
				}			
			}
		});
	});
});
</script> 


<?php echo $footer; ?>	
</div>