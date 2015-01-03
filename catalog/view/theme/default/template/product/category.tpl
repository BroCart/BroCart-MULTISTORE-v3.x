<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>

 <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?><?php echo $breadcrumb['separator']; ?>
		<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" style="display: inline"><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><?php echo $breadcrumb['text']; ?></a> <?php } else { ?><span itemprop="title"><?php echo $breadcrumb['text']; ?></span><?php } ?></div>
        <?php } ?>
  </div>

  <h1><?php echo $heading_title; ?></h1>
  <?php if ($useo_heading_title2) { ?>
  <h2><?php echo $useo_heading_title2; ?></h2>
  <?php } ?>
  <?php if ($thumb || $description) { ?>
  <div class="category-info" unselectable="on" oncopy="return false" oncontextmenu="return false" onselectstart="return false">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  
  <?php if ($categories) { ?>
	<div class="box">
		<div class="box-heading"><?php echo $text_refine; ?></div>
			<div class="box-content">
				<div class="box-product">
				<?php foreach ($categories as $category) { ?>
					<div>
				<?php if ($category['thumb']) { ?>
					<div class="image" style="text-align: center">
			<a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" /></a>
				</div>
				<?php } ?>
	<div style="text-align: center"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div></div>
	<?php } ?>
	</div>
	</div>
	</div>
		<?php } ?>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="display"><b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display('grid');"><?php echo $text_grid; ?></a></div>
    <div class="limit"><b><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><b><?php echo $text_sort; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
  <div class="product-list">
    <?php foreach ($products as $product) { ?>
    <div>	
      <?php if ($product['thumb']) { ?>
      <div class="image">
		<div class="label-block">
		<a href="<?php echo $product['href']; ?>">
		<?php if ($product['label']) { ?>
			<?php foreach ($product['label'] as $sticker) { ?>
				<?php if ($sticker['pos'] == 1) { ?>
				<span class="labels" style="width:100%;height:100%;background: url('<?php echo $sticker['image']; ?>') no-repeat;background-position:top left"></span>
				<?php } elseif ($sticker['pos'] == 0) { ?>				
				<span class="labels" style="width:100%;height:100%;background: url('<?php echo $sticker['image']; ?>') no-repeat;background-position:top right"></span>
				<?php } elseif ($sticker['pos'] == 3) { ?>
				<span class="labels" style="width:100%;height:100%;background: url('<?php echo $sticker['image']; ?>') no-repeat;background-position:bottom right"></span>
				<?php } elseif ($sticker['pos'] == 2) { ?>
				<span class="labels" style="width:100%;height:100%;background: url('<?php echo $sticker['image']; ?>') no-repeat;background-position:bottom left"></span>
				<?php } ?>			
			<?php } ?>
		<?php } ?>
		<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
		</a>
		</div>
	  </div>
      <?php } ?>	  
      <h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>	  
      <div class="description" unselectable="on" oncopy="return false" oncontextmenu="return false" onselectstart="return false"><?php echo $product['description']; ?></div>
      <!--new_type_opt_Baco-->
	  <div class="options">
        <?php if ($product['options']) { ?>
		<div id="option_<?php echo $product['product_id']; ?>">
                <?php foreach ($product['options'] as $option) { ?>
				<?php if ($option['type'] == 'mixed') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
							<span class="required">*</span>
						<?php } ?>
						<b><?php echo $option['name']; ?>:</b>
						<select id="htmlselect-<?php echo $option['product_option_id']; ?>" class="<?php echo $option['type']; ?>" name="option[<?php echo $option['product_option_id']; ?>]">
							<option value="0" data-description="" data-imagesrc="" data-price="" data-prefix="" data-name=""><?php echo $text_select; ?></option>
							<?php foreach ($option['option_value'] as $option_value) {
								if (strpos($option_value['image'], 'no_image')) $option_value['image'] = ''; ?>
								<option value="<?php echo $option_value['product_option_value_id']; ?>" data-description="<?php if ($option_value['price']) { ?><?php echo $option_value['price_prefix']; ?><?php echo $option_value['fullprice']; ?><?php } ?>" data-imagesrc="<?php echo $option_value['image']; ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-name="<?php echo $option['product_option_id']; ?>" data-price="<?php echo $option_value['price']; ?>"><?php echo $option_value['name']; ?>							
								</option>	
					<?php } ?>
						</select>
					</div>
				<?php } ?>
				
<script type="text/javascript"><!--
				$(document).ready(function () {
					$('#htmlselect-<?php echo $option['product_option_id']; ?>').ddslick({
					onSelected: function(selectedData){									
						if(selectedData.selectedIndex > 0) {
							recalc (<?php echo $product['product_id']; ?>, selectedData.selectedData.price, selectedData.selectedData.prefix);
						}
					   }
					});
				});
//--></script> 
		 <?php } ?>
		 </div>
          <?php } ?>
       </div>
	<!--new_type_opt_Baco-->
	  <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <span id="formated_price_<?php echo $product['product_id']; ?>" price="<?php echo $product['price_value']; ?>"><?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <br />
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>

      <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>

      <div class="cart">
      <?php if (empty($product['key'])) { ?>
		<input id="nekupleno" type="button" value="<?php echo $button_cart; ?>" onclick="add_bc('<?php echo $product['product_id']; ?>');" class="button <?php echo $product['product_id']; ?>" />
     <?php } else { ?>
		<input id="kupleno" type="button" value="<?php echo $button_cart_already; ?>" onclick="add_bc('<?php echo $product['product_id']; ?>');" class="button" />
     <?php } ?>
      </div>
	  
      <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
      <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>
   
   </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?>
  </div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>

<script type="text/javascript"><!--
function add_bc(product_id) {
	var quantity = typeof(quantity) != 'undefined' ? quantity : 1;
	var ddData = [];
	var incr = 0;
<?php foreach ($products as $product) { ?>				
	<?php foreach ($product['options'] as $option) { ?>
		<?php if ($option['type'] == 'mixed') { ?>
		var option_id = <?php echo $option['product_option_id']; ?>;
		ddData[incr] = $('#htmlselect-' + option_id).data('ddslick');		
		incr ++;
		<?php } ?>
	<?php } ?>
<?php } ?>

	var data = '';	
	
	if (ddData !== null && ddData !== undefined) {
	$.each(ddData,function(index, optobj){	
		var name = optobj.selectedData.name;
		var value = optobj.selectedData.value;
		data += '&' + name + '='+ value;	
	});
	} else {
		data = false;
	}
	
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
			data: '&product_id=' + product_id + '&quantity=' + quantity + data ,
            dataType: 'json',
            beforeSend: function(){
            },
            success: function(json) {
                $('.success, .warning, .attention, information, .error').remove();
                    if (json['error']) {
                        if (json['error']['warning']) {
                             $('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
                        }                                                                                
                        if (json['error']['option']) {
							for (i in json['error']['option']) {
								$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>').fadeIn("slow");
							}							
							$( ".error" ).fadeOut( 1500, function() {
								$( ".error" ).remove();
							});
						}
                    }        
                                                                                                
					if (json['success']) {
						  addProductNotice(json['title'], json['thumb'], json['success'], 'success');
						  $('#cart_ding')[0].play();
						  $('#cart_menu span.s_grand_total').html(json['total_sum']);
						  $('#cart_menu div.s_cart_holder').html(json['output']);
						  $('.'+ product_id).replaceWith('<input id="kupleno" onclick="javascript:document.location.href=\'index.php?route=checkout/cart\'" type="button" value="<?php echo $button_cart_already; ?>" class="button" />');
						  $('#cart-total').html(json['total']);
						  $('#cart').load('index.php?route=module/cart #cart > *');
					}       
            }
        });
}
//--></script> 
<script type="text/javascript"><!--

function price_format(n)
{ 
    c = <?php echo (empty($currency['decimals']) ? "0" : $currency['decimals'] ); ?>;
    d = '<?php echo $currency['decimal_point']; ?>'; 
    t = '<?php echo $currency['thousand_point']; ?>';
    s_left = '<?php echo $currency['symbol_left']; ?>';
    s_right = '<?php echo $currency['symbol_right']; ?>';
      
    n = n * <?php echo $currency['value']; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 

    j = ((j = i.length) > 3) ? j % 3 : 0; 
    return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
}
function recalc (pid, price, pref)
{ 
	var main_price = Number($('#formated_price_' + pid).attr('price'));
	
	if (pref == '+') {
		
		var new_price = main_price + price;
	} else {
		
		var new_price = main_price - price;
	}	
	
    $('#formated_price_' + pid).fadeOut('100').queue(function(n){
		$(this).html(price_format(new_price));
		n();
		}).fadeIn('100');
}
//--></script>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
					
			html += '<h3 class="name">' + $(element).find('.name').html() + '</h3>';
			html += '<div class="description" unselectable="on" oncopy="return false" oncontextmenu="return false" onselectstart="return false">' + $(element).find('.description').html() + '</div>';
			
			html += '  <div class="options">' + $(element).find('.options').html() + '</div>';
				
			html += '</div>';
						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
			
			html += '<h3 class="name">' + $(element).find('.name').html() + '</h3>';
			html += '<div class="description" unselectable="on" oncopy="return false" oncontextmenu="return false" onselectstart="return false">' + $(element).find('.description').html() + '</div>';
			
			html += '<div class="options">' + $(element).find('.options').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('<?php echo $display; ?>');
}
//--></script> 
<?php echo $footer; ?>