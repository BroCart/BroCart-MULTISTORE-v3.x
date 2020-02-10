<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <?php if ($attention) { ?>
        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<div class="row">
                <div class="col-md-6">
                    <h1 class="page-title"><?php echo $heading_title2; ?><?php if ($weight) { ?>&nbsp;(<?php echo $weight; ?>)<?php } ?></h1>
						<form>
							<div class="shop-billing-fields" id="checkout-form">
								<h3><?php echo $text_checkout_option; ?></h3>                            
								<p class="form-row form-row-first">
									<label for="input-payment-firstname" class=""><?php echo $entry_firstname; ?> <span class="required">*</span></label>
									<input type="text" class="input-text " name="firstname" id="input-payment-firstname" placeholder="<?php echo $entry_place_firstname; ?>" value="<?php echo $firstname; ?>">
								</p>
								<p class="form-row form-row-last">
									<label for="input-payment-lastname" class=""><?php echo $entry_lastname; ?> <span class="required">*</span></label>
									<input type="text" class="input-text " name="lastname" id="input-payment-lastname" placeholder="<?php echo $entry_place_lastname; ?>" value="<?php echo $lastname; ?>">
								</p>
								<div class="clear"></div>
								<p class="form-row form-row-first">
									<label for="input-payment-email"><?php echo $entry_email; ?><span class="required">*</span></label>
									<input type="text" class="input-text " name="email" id="input-payment-email" placeholder="<?php echo $entry_email_address; ?>" value="<?php echo $email; ?>">
								</p>
								<p class="form-row form-row-last">
									<label for="input-payment-telephone"><?php echo $entry_telephone; ?>  <span class="required">*</span></label>
									<input type="text" class="input-text " name="telephone" id="input-payment-telephone" placeholder="<?php echo $entry_place_telephone; ?>" value="<?php echo $telephone; ?>">
								</p>
								<div class="clear"></div>
								
								<p class="form-row">
									<label for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
									<input type="text" class="input-text " name="address_1" id="input-payment-address-1" placeholder="<?php echo $entry_place_address_1; ?>" value="<?php echo $address_1; ?>">
								</p>
								
								<p class="form-row form-row-first">
									<label class="control-label" for="input-payment-country"><?php echo $entry_country; ?> <span class="required">*</span></label>
									<select name="country_id" id="input-payment-country" class="form-control">
										<option value=""><?php echo $text_select; ?></option>
										<?php foreach ($countries as $country) { ?>
											<?php if ($country['country_id'] == $country_id) { ?>
												<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</p>							
								
								<p class="form-row form-row-last" id="payment-zone">
									<label class="control-label" for="input-payment-zone"><?php echo $entry_zone; ?> <span class="required">*</span></label>
									<select name="zone_id" id="input-payment-zone" class="form-control" onchange="updateTotal();">
										<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($zones as $zone) { ?>
												<?php if ($zone['zone_id'] == $zone_id) { ?>
													<option value="<?php echo $zone['zone_id']; ?>" selected="selected"><?php echo $zone['name']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $zone['zone_id']; ?>"><?php echo $zone['name']; ?></option>
												<?php } ?>
											<?php } ?>											
									</select>
								</p>							
								
								<div class="clear"></div>
								
								<p class="form-row form-row-first">
									<label for="input-payment-city"><?php echo $entry_city; ?> <span class="required">*</span></label>
									<input type="text" class="input-text " name="city" id="input-payment-city" placeholder="<?php echo $entry_place_city; ?>" value="<?php echo $city; ?>">
								</p>
								<p class="form-row form-row-last">
									<label for="input-payment-postcode"><?php echo $entry_postcode; ?>  <span class="required">*</span></label>
									<input type="text" class="input-text " name="postcode" id="input-payment-postcode" placeholder="<?php echo $entry_place_postcode; ?>" value="<?php echo $postcode; ?>">
								</p>
								<div class="clear"></div>
								
								<p class="form-row" id="shipping-method"></p>
								
								<p class="hidden form-row notes" id="comments">
									<textarea name="comment" class="input-text " id="order_comments" placeholder="<?php echo $entry_place_comment; ?>" rows="1" cols="5"></textarea>
								</p>
							</div>
						</form>
					</div>
					<div class="col-md-6">
						<div id="order_review">
							<h3><?php echo $text_you_cart; ?> <span class="badge" style="float: right;"><?php echo $tovarov; ?></span></h3>	
							<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
							<table id="bro-cart" class="shop_table">
								<?php if ($products) { ?>	
									<thead>
										<tr>
											<th class="product-name"><?php echo $column_name; ?></th>
											<th class="product-total"><?php echo $column_total; ?></th>
										</tr>
									</thead>
									<tbody>
										<?php foreach ($products as $product) { ?>
											<tr class="cart_item">												
												<td class="product-name">
												<?php if ($product['thumb']) { ?>
													<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
												<?php } ?>
												<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a> 
												<?php if (!$product['stock']) { ?>
													<span class="text-danger">***</span>
												<?php } ?>
													<?php if ($product['option']) { ?>
														<?php foreach ($product['option'] as $option) { ?>
															<br />
															- <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
														<?php } ?>
													<?php } ?>
													<strong class="product-quantity">× <?php echo $product['quantity']; ?></strong>
												</td>								  
												<td class="product-total"><span class="amount"><?php echo $product['total']; ?></span></td>								  
											</tr>
										<?php } ?>                                
									</tbody>
									<tfoot id="totality">
									<?php foreach ($totals as $total) { ?>
										<tr class="order-total">
											<th><?php echo $total['title']; ?></th>
											<td><span class="amount"><?php echo $total['text']; ?></span></td>
										</tr>
									<?php } ?>
									</tfoot>    
							<?php } ?>
							</table>
							</form>
							<h3><?php echo $text_checkout_payment_method; ?></h3>
							<div id="payment-method" class="checkout-payment"></div>
							<button id="button-order" class="update-cart"><?php echo $text_oformlenie_zakaza; ?></button>
							<div id="payment-form"></div>
						</div>				
					</div>		
				</div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
	$(document).ready(function() {		
		$('input, textarea').focus(function(){
			$(this).attr('placeholder','');
		});
		$('#payment-method').on('change', function(e) {
			updateTotal();
		});
		$('#shipping-method').on('change', function() {
			updateTotal();
		});
	});	
	$('#shipping-method').load('index.php?route=checkout/zakaz/getShipping');
	$('#payment-method').load('index.php?route=checkout/zakaz/getPayment');
	
    $('#checkout-form select[name=\'country_id\']').on('change', function() {
        $.ajax({
            url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function() {
                $('#checkout-form #payment-zone').append('<span class="form-control-feedback"><i class="fa fa-circle-o-notch fa-spin"></i></span>');
            },
            complete: function() {
                $('#checkout-form #payment-zone .form-control-feedback').remove();
            },
            success: function(json) {
                if (json['postcode_required'] == '1') {
                    $('#checkout-form input[name=\'postcode\']').parent().addClass('required');
                } else {
                    $('#checkout-form input[name=\'postcode\']').parent().removeClass('required');
                }

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone']) {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';
                        if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                            html += ' selected="selected"';
                        }
                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_select; ?></option>';
                }

                $('#checkout-form select[name=\'zone_id\']').html(html);
                var zone_id = $('#checkout-form select[name=\'zone_id\']').val();
                if (zone_id) {
                    updateTotal();
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
	$('#checkout-form select[name=\'country_id\']').trigger('change');
    $('#button-order').click(function() {
        $.ajax({
            url: 'index.php?route=checkout/zakaz/save',
            type: 'post',
            data: $('#checkout-form input[type=\'text\'], #checkout-form input[type=\'checkbox\']:checked, #checkout-form select, #order_review input[type=\'radio\']:checked, #checkout-form input[type=\'radio\']:checked, #checkout-form textarea, #checkout-form input[type=\'hidden\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-order').button('loading');
            },
            complete: function() {
                $('#button-order').button('reset');
            },
            success: function(json) {
				$('.alert, .text-danger').remove();
                if (json['redirect']) {
                    location = json['redirect'];
                }
                if (json['error']) {
                    if (json['error']['warning']) {
						$('#checkout-form').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}
					for (i in json['error']) {
						var element = $('#input-payment-' + i.replace('_', '-'));
						console.log(element);
						if (typeof(element) !== 'undefined'){
							if ($(element).parent().hasClass('input-group')) {
							$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
							} else {
								$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
							}
							$('html, body').animate({
								scrollTop: ($(element).offset().top - 300)
							}, 2000);
						} else {
							addWarning(json['error'][i]);						
						}
						
					}					
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/zakaz/confirm',
                        type: 'get',
                        dataType: 'json',
                        success: function() {
                            var method = $('#order_review input[name=\'payment_method\']:checked').val();							
                            confirmation(method, function() {
                                if ($('p, h1, h2, h3, input[type=text], input[type=radio], input[type=checkbox], input[type=password], select', $('#payment-form')).length > 0) {
									$('#button-order').hide('fast');
									$('#button-confirm').addClass('update-cart');
									$('#payment-form').show('slow');
									$('html, body').animate({
										scrollTop: ($('#payment-form').offset().top - 300)
									}, 2000);
                                } else {
									$('#button-confirm').addClass('hidden');
                                    var payment_form = $('#payment-form form#payment');
                                    if (payment_form.length) {
                                        payment_form.submit();
                                    } else {								
                                        var href = $('#payment-form div.buttons a').attr('href');
                                        if (typeof href != 'undefined' && href != '' && href != '#') {
                                            location = href;
                                        } else {
											$('#payment-form input[type=button]').trigger("click");											
                                        }
                                    }
                                }
                            });
                        },
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}                        
                    });
                }
            }
        });
    });
	
    function confirmation(method, callback) {
        $.ajax({
            url: 'index.php?route=checkout/zakaz/reConfirmed',
            type: 'post',
            data: 'method=' + method.split('.')[0] + '&payment_method=' + method,
            dataType: 'json',
            success: function(json) {		
                $('#payment-form').html(json['output']);
                callback();
            }
        });
    }    
    function updateTotal(){	
        if (typeof($('#shipping-method-select').val()) !== 'undefined'){
            $.ajax({
                url: 'index.php?route=checkout/zakaz/updateTotal',
                type: 'post',
                data: 'method=' + $('#shipping-method-select').val(),
                dataType: 'json',
                success: function(json) {
                    if (json['totals']) {
						$('#totality').hide(300, function() {
							$(this).html(json['totals']).show(500);
						});                        
                    }
                }
            });
        }
    }    
//--></script>
<?php echo $footer; ?>
