$(function() {
	$(document).delegate("#tab-comments .links a", 'click', function() {
		var page = $(this).attr('href').match(/\d*$/);
		$('#tab-comments .pcComments').load($(this).attr('href'));
		return false;
	});

	$(document).delegate('#pcSubmitBtn:not(.disabled)', 'click', function() {
		$.ajax({
			type: "POST",
			dataType: "json",
			url: 'index.php?route=module/productcomments/submitComment&product_id='+pc_product_id,
			data: $('#pcForm').serialize(),
			beforeSend: function() {
				$('#tab-comments .success, #tab-comments .warning').remove();
				$('#pcSubmitBtn').addClass('disabled');
				$('#comment-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> ' + pc_wait + '</div>');
			},		
			complete: function() {
				$('#pcSubmitBtn').removeClass('disabled');
				$('#tab-comments .attention').remove();
			},
			success: function(jsonData) {
				if (!$.isEmptyObject(jsonData.errors)) {
					var errors = '';
					jQuery.each(jsonData.errors, function(index, item) {
					    errors += '<li>' + item + '</li>';
					});
					
					$('#comment-title').after('<div class="warning"><ul>' + errors + '</ul></div>');
				} else {
					$('#comment-title').after('<div class="success">' + jsonData.success + '</div>');
					$('#tab-comments input[type="text"], #tab-comments textarea').val('');
					$('#tab-comments .pcComments').load('index.php?route=module/productcomments/renderComments&product_id='+pc_product_id);
				}
			}
		});
	});
	
	$('#pcText[maxlength]').keyup(function(){
		var limit = parseInt($(this).attr('maxlength'));
		if($(this).val().length > limit){
			$(this).val($(this).val().substr(0, limit));
		}
	});
});
