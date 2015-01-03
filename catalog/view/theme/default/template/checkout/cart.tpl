<?php echo $header; ?>
<?php if ($attention) { ?>
<div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>    
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?><?php echo $breadcrumb['separator']; ?>
		<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" style="display: inline"><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><?php echo $breadcrumb['text']; ?></a> <?php } else { ?><span itemprop="title"><?php echo $breadcrumb['text']; ?></span><?php } ?></div>
        <?php } ?>
  </div>
    <?php if($settings){?>   
  <h1><?php echo $heading_title; ?>
    <?php if ($weight) { ?>
    &nbsp;(<?php echo $weight; ?>)
    <?php } ?>
  </h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="cart-info">
      <table>
        <thead>
          <tr>
            <td class="image"><?php echo $column_image; ?></td>
            <td class="name"><?php echo $column_name; ?></td>
            <td class="model"><?php echo $column_model; ?></td>
            <td class="quantity"><?php echo $column_quantity; ?></td>
            <td class="price"><?php echo $column_price; ?></td>
            <td class="total"><?php echo $column_total; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="image"><?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
              <?php } ?></td>
            <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php if (!$product['stock']) { ?>
              <span class="stock">***</span>
              <?php } ?>
              <div>
                <?php foreach ($product['option'] as $option) { ?>
                - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                <?php } ?>
              </div>
              <?php if ($product['reward']) { ?>
              <small><?php echo $product['reward']; ?></small>
              <?php } ?></td>
            <td class="model"><?php echo $product['model']; ?></td>
            <td class="quantity"><input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
              &nbsp;
              <input type="image" src="catalog/view/theme/default/image/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />
              &nbsp;<a onclick="removeCart('<?php echo $product['key']; ?>');" ><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
            <td class="price"><?php echo $product['price']; ?></td>
            <td class="total"><?php echo $product['total']; ?></td>
          </tr>
          <?php } ?>
          <?php foreach ($vouchers as $vouchers) { ?>
          <tr>
            <td class="image"></td>
            <td class="name"><?php echo $vouchers['description']; ?></td>
            <td class="model"></td>
            <td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
              &nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $text_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
            <td class="price"><?php echo $vouchers['amount']; ?></td>
            <td class="total"><?php echo $vouchers['amount']; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </form> 

<?php if ($coupon_status || $voucher_status || $reward_status) { ?>
  <h2><?php echo $text_next; ?></h2>
  <div class="content">
    <p><?php //echo $text_next_choice; ?></p>
    <table class="radio">
      <?php if ($coupon_status) { ?>
      <tr class="highlight">
        <td><?php if ($next == 'coupon') { ?>
          <input type="radio" name="next" value="coupon" id="use_coupon" checked="checked" />
          <?php } else { ?>
          <input type="radio" name="next" value="coupon" id="use_coupon" />
          <?php } ?></td>
        <td><label for="use_coupon"><?php echo $text_use_coupon; ?></label></td>
      </tr>
      <?php } ?>
      <?php if ($voucher_status) { ?>
      <!--tr class="highlight">
        <td><?php if ($next == 'voucher') { ?>
          <input type="radio" name="next" value="voucher" id="use_voucher" checked="checked" />
          <?php } else { ?>
          <input type="radio" name="next" value="voucher" id="use_voucher" />
          <?php } ?></td>
        <td><label for="use_voucher"><?php echo $text_use_voucher; ?></label></td>
      </tr-->
      <?php } ?>
      <?php if ($reward_status) { ?>
      <tr class="highlight">
        <td><?php if ($next == 'reward') { ?>
          <input type="radio" name="next" value="reward" id="use_reward" checked="checked" />
          <?php } else { ?>
          <input type="radio" name="next" value="reward" id="use_reward" />
          <?php } ?></td>
        <td><label for="use_reward"><?php echo $text_use_reward; ?></label></td>
      </tr>
      <?php } ?>      
    </table>
  </div>
  <div class="cart-module">
    <div id="coupon" class="content" style="display: <?php echo ($next == 'coupon' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <?php echo $entry_coupon; ?>&nbsp;
        <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
        <input type="hidden" name="next" value="coupon" />
        &nbsp;
        <input type="submit" value="<?php echo $button_coupon; ?>" class="button" />
      </form>
    </div>
    <div id="voucher" class="content" style="display: <?php echo ($next == 'voucher' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <?php echo $entry_voucher; ?>&nbsp;
        <input type="text" name="voucher" value="<?php echo $voucher; ?>" />
        <input type="hidden" name="next" value="voucher" />
        &nbsp;
        <input type="submit" value="<?php echo $button_voucher; ?>" class="button" />
      </form>
    </div>
    <div id="reward" class="content" style="display: <?php echo ($next == 'reward' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <?php echo $entry_reward; ?>&nbsp;
        <input type="text" name="reward" value="<?php echo $reward; ?>" />
        <input type="hidden" name="next" value="reward" />
        &nbsp;
        <input type="submit" value="<?php echo $button_reward; ?>" class="button" />
      </form>
    </div>    
  </div>
  <?php } ?>
  
  <div class="content">    
	<div id="checkout-form">
        <div class="right_cart">
          <?php if($firstname_status){?>
            <?php if($firstname_required){?><span class="required">*</span> <?php } ?><?php echo $entry_firstname; ?><br />
            <input type="text" name="firstname" value="<?php echo $firstname; ?>" class="large-field" />
            <br />
            <br />
          <?php } ?>
          <?php if($lastname_status){?>
            <?php if($lastname_required){?><span class="required">*</span> <?php } ?><?php echo $entry_lastname; ?><br />
            <input type="text" name="lastname" value="<?php echo $lastname; ?>" class="large-field" />
            <br />
            <br />
          <?php } ?>
          <?php if($email_status){?>
            <?php if($email_required){?><span class="required">*</span> <?php } ?><?php echo $entry_email; ?><br />
            <input type="text" name="email" value="<?php echo $email; ?>" class="large-field" />
            <br />
            <br />
          <?php } ?>
          <?php if($telephone_status){?>
            <?php if($telephone_required){?><span class="required">*</span> <?php } ?><?php echo $entry_telephone; ?><br />
            <input type="text" name="telephone" value="<?php echo $telephone; ?>" class="large-field" />
            <br />
            <br />
          <?php } ?>
          <?php if($fax_status){?>
            <?php if($fax_required){?><span class="required">*</span> <?php } ?><?php echo $entry_fax; ?><br />
            <input type="text" name="fax" value="<?php echo $fax; ?>" class="large-field" />
            <br />
            <br />
          <?php } ?>
         <?php if($country_status){?>
         <?php if($country_required){?><span class="required">*</span> <?php }?><?php echo $entry_country; ?><br />
          <select name="country_id" id="country_id" class="large-field" onchange="$('#checkout-form select[name=\'zone_id\']').load('index.php?route=checkout/guest/zone&amp;country_id=' + this.value);">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($countries as $country) { ?>
            <?php if ($country['country_id'] == $country_id) { ?>
            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
          <br />
          <br />
		  <span class="required">*</span> <?php echo $entry_zone; ?><br />
            <select name="zone_id" onchange="updateShM($('#country_id').val(), this.value);" class="large-field">
            </select>
			<br />
          <br />
          <?php } ?>
          <?php if($city_status){?>
          <?php if($city_required){?><span class="required">*</span> <?php }?><?php echo $entry_city; ?><br />
          <input type="text" name="city" value="<?php echo $city; ?>" class="large-field" />
          <br />
          <br />
          <?php }?>
          <?php if($postcode_status){?>
          <?php if($postcode_required){?><span class="required">*</span> <?php }?><?php echo $entry_postcode; ?><br />
            <input type="text" name="postcode" value="<?php echo $postcode; ?>" class="large-field" />
            <br />
            <br />
          <?php }?>
           <?php if($company_status){?>
          <?php if($company_required){?><span class="required">*</span> <?php }?><?php echo $entry_company; ?><br />
          <input type="text" name="company" value="<?php echo $company; ?>" class="large-field" />
          <br />
          <br />
          <?php }?>
           <?php if($address_1_status){?>
           <?php if($address_1_required){?><span class="required">*</span> <?php }?><?php echo $entry_address_1; ?><br />
          <input type="text" name="address_1" value="<?php echo $address_1; ?>" class="large-field" />
          <br />
          <br />
          <?php }?>
          <?php if($address_2_status){?>
          <?php if($address_2_required){?><span class="required">*</span> <?php }?><?php echo $entry_address_2; ?><br />
          <input type="text" name="address_2" value="<?php echo $address_2; ?>" class="large-field" />
          <br />
          <br />
          <?php }?>
          <br />
        </div>
        <div class="left">
          <div class="shipping-methods">
            <div class="shipping_and_payment">
            <script type="text/javascript"><!--
                function updateShM(country_id,zone_id){
                        $('#shippmetloading, #paymetloading').html(' <img src="catalog/view/theme/default/image/loading.gif"  style="margin-top:-3px;vertical-align:middle;">');
                        $('#shipping_methods').load('index.php?route=checkout/cart/getShippingMethods&country_id=' + country_id+ '&zone_id=' + zone_id, function(){$('#shippmetloading').empty();});
                        $('#payment_methods').load('index.php?route=checkout/cart/getPaymentMethods&country_id=' + country_id+ '&zone_id=' + zone_id, function(){$('#paymetloading').empty();});
                }
                function getPaymentForm(code, callback){
                    $.ajax({
                        async: false,
                        cache: false,
                        url: 'index.php?route=checkout/cart/getPaymentForm',
                        type: 'post',
                        data: 'code='+code.split('.')[0]+'&payment_method='+code,
                        dataType: 'json',
                        success: function(json) {
                            $('#payment_form_conf').html(json['output']);
                            callback();
                        }
                    });
                }
            //--></script>
            <br />
            <br />
            <?php if ($shipping_methods) { ?>
            <h3><?php echo $text_shipping_method; ?><span id="shippmetloading"></span></h3>
            <table class="form" id="shipping_methods">
              <?php foreach ($shipping_methods as $shipping_method) { ?>
              <?php if (!$shipping_method['error']) { ?>
              <?php foreach ($shipping_method['quote'] as $quote) { ?>
              <tr>
                <td style="width: 1px;"><?php if ($quote['code'] == $code || !$code) { ?>
                  <?php $code = $quote['code']; ?>
                  <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
                  <?php } else { ?>
                  <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
                  <?php } ?></td>
                <td><label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label></td>
                <td style="text-align: right;"><label for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td colspan="3"><div class="error"><?php echo $shipping_method['error']; ?></div></td>
              </tr>
              <?php } ?>
              <?php } ?>
            </table>
            <?php } ?>
            </div>
        </div>
        <div class="payment-methods">
            <div class="shipping_and_payment">
            <h3><?php echo $text_payment_method; ?><span id="paymetloading"></span></h3>
            <table class="form" id="payment_methods">
            <?php if ($payment_methods) { ?>
            <?php foreach ($payment_methods as $payment_method) { ?>
            <tr>
            <td style="width: 1px;"><?php if ($payment_method['code'] == $p_code || !$p_code) { ?>
              <?php $p_code = $payment_method['code']; ?>
              <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
              <?php } ?></td>
            <td><label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label></td>
            </tr>
            <?php } ?>
            <?php } ?>
            </table>
            <b><?php echo $text_comments; ?></b>
            <textarea name="comment" rows="8" style="width: 98%;"><?php echo $comment; ?></textarea>
            <br />
            <br />
            </div>
            <?php if ($text_agree) { ?>
            <div class="buttons payment_form">
			<div id="payment_form">
            <span ><?php echo $text_agree; ?><input type="checkbox" name="agree" value="1" checked="checked" /></span>            
            <a id="button-checkout" class="button"><span><?php echo $button_continue; ?></span></a>
            </div>
            </div>
            <?php } else { ?>
            <div class="buttons payment_form">
                <div id="payment_form">
                <a id="button-checkout" class="button"><span><?php echo $button_continue; ?></span></a>
                </div>
            </div>
            <?php } ?>
			<div id="payment_form_conf" style="display:none"></div>
            <script type="text/javascript"><!--
            $('.colorbox').colorbox({
                overlayClose: true,
                opacity: 0.5,
                width: '600px',
                height: '400px',
                href: this.href
            });
            //--></script>
        </div>
        </div>
        <input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" style="display:none" />
        <script type="text/javascript"><!--
        $('#checkout-form select[name=\'zone_id\']').load('index.php?route=checkout/guest/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id;?>');
        //--></script>
    </div>
    </div>
  </div>
  <div class="cart-total">
    <table id="total">
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="5" class="right"><b><?php echo $total['title']; ?>:</b></td>
        <td class="right"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </table>
  </div>
    <?php }else{?>	
<h1><?php echo $heading_title; ?>
    <?php if ($weight) { ?>
    &nbsp;(<?php echo $weight; ?>)
    <?php } ?>
  </h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="cart-info">
      <table>
        <thead>
          <tr>
            <td class="image"><?php echo $column_image; ?></td>
            <td class="name"><?php echo $column_name; ?></td>
            <td class="model"><?php echo $column_model; ?></td>
            <td class="quantity"><?php echo $column_quantity; ?></td>
            <td class="price"><?php echo $column_price; ?></td>
            <td class="total"><?php echo $column_total; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="image"><?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
              <?php } ?></td>
            <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php if (!$product['stock']) { ?>
              <span class="stock">***</span>
              <?php } ?>
              <div>
                <?php foreach ($product['option'] as $option) { ?>
                - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                <?php } ?>
              </div>
              <?php if ($product['reward']) { ?>
              <small><?php echo $product['reward']; ?></small>
              <?php } ?></td>
            <td class="model"><?php echo $product['model']; ?></td>
            <td class="quantity"><input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
              &nbsp;
              <input type="image" src="catalog/view/theme/default/image/update.png" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" />
              &nbsp;<a href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
            <td class="price"><?php echo $product['price']; ?></td>
            <td class="total"><?php echo $product['total']; ?></td>
          </tr>
          <?php } ?>
          <?php foreach ($vouchers as $vouchers) { ?>
          <tr>
            <td class="image"></td>
            <td class="name"><?php echo $vouchers['description']; ?></td>
            <td class="model"></td>
            <td class="quantity"><input type="text" name="" value="1" size="1" disabled="disabled" />
              &nbsp;<a href="<?php echo $vouchers['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a></td>
            <td class="price"><?php echo $vouchers['amount']; ?></td>
            <td class="total"><?php echo $vouchers['amount']; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </form>
  <?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status) { ?>
  <h2><?php echo $text_next; ?></h2>
  <div class="content">
    <p><?php echo $text_next_choice; ?></p>
    <table class="radio">
      <?php if ($coupon_status) { ?>
      <tr class="highlight">
        <td><?php if ($next == 'coupon') { ?>
          <input type="radio" name="next" value="coupon" id="use_coupon" checked="checked" />
          <?php } else { ?>
          <input type="radio" name="next" value="coupon" id="use_coupon" />
          <?php } ?></td>
        <td><label for="use_coupon"><?php echo $text_use_coupon; ?></label></td>
      </tr>
      <?php } ?>
      <?php if ($voucher_status) { ?>
      <tr class="highlight">
        <td><?php if ($next == 'voucher') { ?>
          <input type="radio" name="next" value="voucher" id="use_voucher" checked="checked" />
          <?php } else { ?>
          <input type="radio" name="next" value="voucher" id="use_voucher" />
          <?php } ?></td>
        <td><label for="use_voucher"><?php echo $text_use_voucher; ?></label></td>
      </tr>
      <?php } ?>
      <?php if ($reward_status) { ?>
      <tr class="highlight">
        <td><?php if ($next == 'reward') { ?>
          <input type="radio" name="next" value="reward" id="use_reward" checked="checked" />
          <?php } else { ?>
          <input type="radio" name="next" value="reward" id="use_reward" />
          <?php } ?></td>
        <td><label for="use_reward"><?php echo $text_use_reward; ?></label></td>
      </tr>
      <?php } ?>
      <?php if ($shipping_status) { ?>
      <tr class="highlight">
        <td><?php if ($next == 'shipping') { ?>
          <input type="radio" name="next" value="shipping" id="shipping_estimate" checked="checked" />
          <?php } else { ?>
          <input type="radio" name="next" value="shipping" id="shipping_estimate" />
          <?php } ?></td>
        <td><label for="shipping_estimate"><?php echo $text_shipping_estimate; ?></label></td>
      </tr>
      <?php } ?>
    </table>
  </div>
  <div class="cart-module">
    <div id="coupon" class="content" style="display: <?php echo ($next == 'coupon' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <?php echo $entry_coupon; ?>&nbsp;
        <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
        <input type="hidden" name="next" value="coupon" />
        &nbsp;
        <input type="submit" value="<?php echo $button_coupon; ?>" class="button" />
      </form>
    </div>
    <div id="voucher" class="content" style="display: <?php echo ($next == 'voucher' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <?php echo $entry_voucher; ?>&nbsp;
        <input type="text" name="voucher" value="<?php echo $voucher; ?>" />
        <input type="hidden" name="next" value="voucher" />
        &nbsp;
        <input type="submit" value="<?php echo $button_voucher; ?>" class="button" />
      </form>
    </div>
    <div id="reward" class="content" style="display: <?php echo ($next == 'reward' ? 'block' : 'none'); ?>;">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <?php echo $entry_reward; ?>&nbsp;
        <input type="text" name="reward" value="<?php echo $reward; ?>" />
        <input type="hidden" name="next" value="reward" />
        &nbsp;
        <input type="submit" value="<?php echo $button_reward; ?>" class="button" />
      </form>
    </div>
    <div id="shipping" class="content" style="display: <?php echo ($next == 'shipping' ? 'block' : 'none'); ?>;">
      <p><?php echo $text_shipping_detail; ?></p>
      <table>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_country; ?></td>
          <td><select name="country_id" id="country_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
          <td><select name="zone_id">
            </select></td>
        </tr>
        <tr>
          <td><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
          <td><input type="text" name="postcode" value="<?php echo $postcode; ?>" /></td>
        </tr>
      </table>
      <input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="button" />
    </div>
  </div>
  <?php } ?>
  <div class="cart-total">
    <table id="total">
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td class="right"><b><?php echo $total['title']; ?>:</b></td>
        <td class="right"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </table>
  </div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $checkout; ?>" class="button"><?php echo $button_checkout; ?></a></div>
    <div class="center"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_shopping; ?></a></div>
  </div>
    <?php }?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('input[name=\'next\']').bind('change', function() {
	$('.cart-module > div').hide();

	$('#' + this.value).show();
});

<?php if ($next == 'coupon') { ?>
$('#use_coupon').trigger('click');
<?php } ?>
<?php if ($next == 'voucher') { ?>
$('#use_voucher').trigger('click');
<?php } ?>
<?php if ($next == 'reward') { ?>
$('#use_reward').trigger('click');
<?php } ?>
<?php if ($next == 'shipping') { ?>
$('#shipping_estimate').trigger('click');
<?php } ?>
//--></script>

<script type="text/javascript"><!--
$('#button-quote').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/quote',
		type: 'post',
		data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
		dataType: 'json',
		beforeSend: function() {
			$('#button-quote').attr('disabled', true);
			$('#button-quote').after('<span class="wait">&nbsp;<img src="image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-quote').attr('disabled', false);
			$('.wait').remove();
		},
		success: function(json) {
			$('.success, .warning, .attention, .error').remove();

			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

					$('.warning').fadeIn('slow');

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}

				if (json['error']['country']) {
					$('select[name=\'country_id\']').after('<span class="error">' + json['error']['country'] + '</span>');
				}

				if (json['error']['zone']) {
					$('select[name=\'zone_id\']').after('<span class="error">' + json['error']['zone'] + '</span>');
				}

				if (json['error']['postcode']) {
					$('input[name=\'postcode\']').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}
			}

			if (json['shipping_method']) {
				html  = '<h2><?php echo $text_shipping_method; ?></h2>';
				html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
				html += '  <table class="radio">';

				for (i in json['shipping_method']) {
					html += '<tr>';
					html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
					html += '</tr>';

					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							html += '<tr class="highlight">';

							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
								html += '<td><input type="radio" name="shipping_method1" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
							} else {
								html += '<td><input type="radio" name="shipping_method1" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
							}

							html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
							html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
							html += '</tr>';
						}
					} else {
						html += '<tr>';
						html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
						html += '</tr>';
					}
				}

				html += '  </table>';
				html += '  <br />';
				html += '  <input type="hidden" name="next" value="shipping" />';
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" class="button" />';
				html += '</form>';

				$.colorbox({
					overlayClose: true,
					opacity: 0.5,
					width: '600px',
					height: '400px',
					href: false,
					html: html
				});
			}
		}
	});
});
<?php if($settings){?>
$('#button-checkout').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart',
		type: 'post',
		data: $('#checkout-form input[type=\'text\'], #checkout-form input[type=\'checkbox\']:checked, #checkout-form select, #checkout-form input[type=\'radio\']:checked, #checkout-form textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-checkout').attr('disabled', true);
			$('#button-checkout').after('<span class="wait">&nbsp;<img src="image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-checkout').attr('disabled', false);
		},
		success: function(json) {
			$('.error').remove();
                        $('.warning').remove();
			if (json['redirect']) {
				location = json['redirect'];
			}
			if (json['error']) {
                            <?php if($firstname_required){?>
				if (json['error']['firstname']) {
					$('#checkout-form input[name=\'firstname\'] + br').after('<span class="error">' + json['error']['firstname'] + '</span>');
				}
                            <?php }?>
                            <?php if($lastname_required){?>
				if (json['error']['lastname']) {
					$('#checkout-form input[name=\'lastname\'] + br').after('<span class="error">' + json['error']['lastname'] + '</span>');
				}
                            <?php }?>
                            <?php if($email_required){?>
				if (json['error']['email']) {
					$('#checkout-form input[name=\'email\'] + br').after('<span class="error">' + json['error']['email'] + '</span>');
				}
                            <?php }?>
                            <?php if($telephone_required){?>
				if (json['error']['telephone']) {
					$('#checkout-form input[name=\'telephone\'] + br').after('<span class="error">' + json['error']['telephone'] + '</span>');
				}
                            <?php }?>
                            <?php if($fax_required){?>
				if (json['error']['fax']) {
					$('#checkout-form select[name=\'fax\'] + br').after('<span class="error">' + json['error']['fax'] + '</span>');
				}
                            <?php }?>
                            <?php if($postcode_required){?>
				if (json['error']['postcode']) {
					$('#checkout-form input[name=\'postcode\'] + br').after('<span class="error">' + json['error']['postcode'] + '</span>');
				}
                            <?php }?>
                            <?php if($company_required){?>
				if (json['error']['company']) {
					$('#checkout-form input[name=\'company\'] + br').after('<span class="error">' + json['error']['company'] + '</span>');
				}
                            <?php }?>
                            <?php if($address_1_required){?>
				if (json['error']['address_1']) {
					$('#checkout-form input[name=\'address_1\'] + br').after('<span class="error">' + json['error']['address_1'] + '</span>');
				}
                            <?php }?>
                            <?php if($address_2_required){?>
				if (json['error']['address_2']) {
					$('#checkout-form input[name=\'address_2\'] + br').after('<span class="error">' + json['error']['address_2'] + '</span>');
				}
                            <?php }?>
                            <?php if($city_required){?>
				if (json['error']['city']) {
					$('#checkout-form input[name=\'city\'] + br').after('<span class="error">' + json['error']['city'] + '</span>');
				}
                            <?php }?>
                            <?php if($country_required){?>
				if (json['error']['country']) {
					$('#checkout-form select[name=\'country_id\'] + br').after('<span class="error">' + json['error']['country'] + '</span>');
				}
                            <?php }?>
                            <?php if($fax_required){?>
				if (json['error']['fax']) {
					$('#checkout-form input[name=\'fax\'] + br').after('<span class="error">' + json['error']['fax'] + '</span>');
				}
                            <?php }?>
				if (json['error']['zone']) {
					$('#checkout-form select[name=\'zone_id\'] + br').after('<span class="error">' + json['error']['zone'] + '</span>');
				}
                                if (json['error']['warning']) {
                                        $('.warning').remove();
					$('#checkout-form h2').after('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');

					$('.warning').fadeIn('slow');
				}
                               $('.wait').remove();
			} else {
                            $.ajax({
                                    url: 'index.php?route=checkout/confirm',
                                    dataType: 'json',
                                    success: function(json) {
                                        var code = $('#checkout-form input[name=\'payment_method\']:checked').val();
                                        getPaymentForm(code,function(){

                                            if ($('p,h1,h2,h3,input[type=text],input[type=radio],input[type=checkbox],input[type=password],select', $('#payment_form_conf')).length > 0) {
                                                $('#payment_form,.payment_form').css('display','none');
                                                $('#payment_form_conf,.payment_form_conf').css('display','block');
                                                $('#checkout-form .left input[type=text], #checkout-form .left select, #shipping_methods input, #payment_methods input').attr('disabled','disabled');
                                                $('#checkout-form .shipping_and_payment').css('opacity','0.3');
                                            } else {
                                                var payment_form_conf = $('#payment_form_conf form#payment');

                                                if (payment_form_conf.length) {
                                                    payment_form_conf.submit();
                                                } else {
                                                    var href = $('#payment_form_conf div.buttons a').attr('href');
                                                    if (typeof href != 'undefined' && href != '' && href != '#') {
                                                        location = href;

                                                    } else {
                                                        $('#payment_form_conf div.buttons a,#payment_form_conf div.buttons input[type=button],#payment_form_conf div.buttons input[type=submit]').click();
                                                    }
                                                }
                                           }
                                    });
                              },
                          error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError);
                       }
                 });
			}

		}
	});
});
<?php }?>
//--></script>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php echo $footer; ?>
