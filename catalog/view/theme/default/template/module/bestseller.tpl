<div id="bestseller">
  <h2><?php echo $heading_title; ?></h2>
  <div class="contentover">
    <div class="products">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="image"><div class="label-block">
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
		</div></div>
        <?php } ?>
		
		<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        
		
        <h3><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
      
  

			<div id="quantity">
			<span class="wrap-quantity">
    	    <a class="add" onclick="addquantity('<?php echo $product['product_id']; ?>')"></a>
    	    <a class="clear" onclick="clrquantity('<?php echo $product['product_id']; ?>')" ></a>
    	     </span>
    		 <span class="number">
    			<input type="text" id="quantity-<?php echo $product['product_id']; ?>" name="quantity" size="2" value="<?php echo $product['minimum']; ?>" />
				<input type="hidden" id="quantity-<?php echo $product['product_id']; ?>-minimum" value="<?php echo $product['minimum']; ?>" />
    		 </span>
    		</div>
   
        <div class="cart">
		<?php if (empty($product['key'])) { ?>
			<input id="nekupleno" type="button" value="<?php echo $button_cart; ?>" onclick="PlusToCart('<?php echo $product['product_id']; ?>');this.value='<?php echo $button_cart_already; ?>'" class="button" />
     <?php } else { ?>
		<input id="kupleno" type="button" value="<?php echo $button_cart_already; ?>" onclick="PlusToCart('<?php echo $product['product_id']; ?>');" class="button" />
     <?php } ?>
		</div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
<script type="text/javascript">//-->
function PlusToCart(product_id) {
var quantity = $('#quantity-'+product_id).val();
	$.ajax({
	url: 'index.php?route=checkout/cart/add',
	type: 'post',
	data: 'product_id=' + product_id + '&quantity=' + quantity,
	dataType: 'json',
	success: function(json) {
				$('.success, .warning, .attention, .information, .error').remove();
					if (json['redirect']) {
						location = json['redirect'];
					}
					if (json['error']) {
						if (json['error']['warning']) {
						$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
						}
					}
			if (json['success']) {
              addProductNotice(json['title'], json['thumb'], json['success'], 'success');
              $('#cart_menu span.s_grand_total').html(json['total_sum']);
              $('#cart_menu div.s_cart_holder').html(json['output']);
			  $('#cart-total').html(json['total']);
          }
					}
					});
				} 
			function addquantity(product_id){
						var quantity = parseInt($('#quantity-'+product_id).val()) + 1;
						$('#quantity-'+product_id).val(quantity);
					}
			function clrquantity(product_id){
						var quantity = parseInt($('#quantity-'+product_id).val()) - 1;
						var minimum = parseInt($('#quantity-'+product_id+'-minimum').val());
						if(quantity < minimum){quantity = minimum}
						$('#quantity-'+product_id).val(quantity);
}//--></script>