<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/filters.css" />
<div id="category">
    <h2><?php echo $heading_title; ?></h2>
    <div class="box-content">
        <div class="box-filters">
		<!-- Product Price Filters -->	
		<!-- Price Range -->
                    <?php if (!empty($priceRangeArray)) { ?>
                    <div class="box-heading-checkbox"><?php echo  $text_price_filter; ?> </div>
                    <div class="checkboxSli">
                    <div>	 
                       <p><span class="price-range" id="price"><?php echo $pricemin; ?>&nbsp;(<?php echo $symbol; ?>)&nbsp;&nbsp;-&nbsp;&nbsp;<?php echo $pricemax; ?>&nbsp;(<?php echo $symbol; ?>)</span></p>
                        <div class="price-slide"></div>
                        <input type="hidden" class="price-min" id="price-min" value="<?php echo $pricemin; ?>" />
                        <input type="hidden" class="price-max" id="price-max" value="<?php echo $pricemax; ?>" />  
                            </div>
                            </div>
							<div>
                    </div>
                    <?php } ?>
		<!-- End Product Price Filters -->
		<!--Manufactures -->
            <?php if (!empty($manufacturers)) { ?>
            <div class="box-heading-checkbox"><?php echo $text_manufacturer_select_option; ?> </div>
                 <div class="checkboxDiv">
                <?php foreach ($manufacturers as $value) { ?>
                    <div>
                    <div class="checkbox product-options" id="">
                    <input  type="checkbox" id="manufacturer" name="manufacturers[]" value="<?php echo $value['manufacturer_id']; ?>">
                    </div>
                    <label for="<?php echo $value['name']; ?>"><?php echo $value['name']; ?></label>
                    </div>
                    
                    <?php } ?>
					</div>
				<?php } ?>	
			<!-- Product Attributes Filters -->			
				<?php if($productAttributes) { ?>
					<?php foreach($productAttributes as $attribute) { ?>
						<div class="box-heading-checkbox"><?php echo  $attribute['name']; ?> </div>
						<div class="checkboxDiv">
						<?php foreach($attribute['attribute_values'] as $attribute_id=>$attribute_value) { ?>
							<div>
								<div class="checkbox product-options" id="">
									<input  type="checkbox" id="product-attribute" name="product-attribute[]" value="<?php echo $attribute_id; ?>">
								</div>
								<label for="<?php echo  $attribute_value['name']; ?>"><?php echo  $attribute_value['name']; ?></label>
							</div>
						<?php } ?>
						</div>
					<?php } ?>
				<?php } ?>
				<!-- Product Option Filters -->
				<?php if($productOptions) { ?>
					<?php foreach($productOptions as $value) { ?>
						<div class="box-heading-checkbox"><?php echo  $value['name']; ?> </div>
						<div class="checkboxDiv">
						<?php unset($value['name']); foreach($value as $child) { ?>
							<div>
								<div class="checkbox product-options" id="">
									<input  type="checkbox" id="product-option" name="product-option[]" value="<?php echo $child['child_id']; ?>">
								</div>
								<label for="<?php echo  $child['child_name']; ?>"><?php echo  $child['child_name']; ?></label>
							</div>
						<?php } ?>
						</div>
					<?php } ?>
				<?php } ?>
				
                </div>
        </div>
    </div>
	
    <script type="text/javascript" src="catalog/view/javascript/jquery/jquery.custom_radio_checkbox.js"></script>
<script type="text/javascript"><!-- 

(function () {
        
		var priceMin = <?php echo $pricemin; ?>,
					priceMax = <?php echo $pricemax; ?>,
					$priceSlide = $('.price-slide'),
					$range = $('.price-range'),
					$priceMin = $('.price-min'),
					$priceMax = $('.price-max');
					fog = '';
		
		$priceSlide.slider({
						animate: false,
						min: <?php echo $pricemin; ?>,
						max: <?php echo $pricemax; ?>,
						values: [priceMin, priceMax],
						range: true,
						slide: function (event, ui) {
							var rangeHtml = '';

							rangeHtml = ui.values[0] + '-' + ui.values[1];

							$priceMin.val(ui.values[0]);
							$priceMax.val(ui.values[1]);

							$range.html(rangeHtml);
							fog = rangeHtml;		
						},
						 
						  stop  : function () {
						  
							var arrData = getFilterParams();
							var getParams = getSortingParams();
							sendRequest(arrData, getParams);
							
						} 
					});				
        
    })();
          
            $(document).ready(function(){
                //	$(".radio").dgStyle();
                $(".checkbox").dgStyle();
            });

            function getSortingParams(){
                var getParams;
                $("select option:selected").each(function() {

                    var val = $(this).val();
                    //console.log("Value = "+val);
                    if(getParams == null && val != null){
                            getParams = val;
                    } else {
                        if(getParams != null && val != null){
                            getParams = "&"+getParams+"="+val;
                        }
                    }
                    //console.log(getParams);
                });
                return getParams;
            }
            function dropdown(dp){             
                var arrData = getFilterParams();
                var getParams = getSortingParams();                
                sendRequest(arrData, getParams);
            }
            function getFilterParams(){
				var arrData = new Array();
					
                $('.checkboxDiv > checkbox:selected').each(function() {
                    var item = {};
                    item.param = $(this).parent().attr('id');
                    item.val = $(this).val();    
                    arrData.push(item);
                });
					
				
				$('.price-slide').each(function() {
                    var item = {};
                    item.param = 'price';
                    item.val = document.getElementById('price-min').value + '-' + document.getElementById('price-max').value;
                    arrData.push(item);
                });
			
                //Iterating over all the check boxes
                $("input:checked").each(function() {
                    var item = {};
                    item.param = $(this).attr('id');
                    item.val = $(this).val();
                    arrData.push(item);
                });
                return arrData;
            }
//console.log(fog);
            $('.product-options').click(function(e) {
                //Iterating over multiple select boxes
                var arrData = getFilterParams();
                var getParams = getSortingParams();
                sendRequest(arrData, getParams);                
            });

        function sendRequest(arrData, getParams){
                var url = "index.php?route=module/filters/applyFilter&path="+<?php echo $categoryId ?>;
                if(getParams != null){
                    url = url+"&"+getParams;
                }
            $.ajax({
                url: url,
                type: "POST",
                data: {filters : arrData},
                dataType: "html"
            }).done(function( msg ) {   
                $('div').remove('.pagination');            
                var productDiv;
                if($('.product-list').length){
                    productDiv = '.product-list';
                } else {
                    productDiv = '.product-grid';
                }             
                $('div').remove(productDiv);
                $('div').remove('.pagination');
                $('div').remove('.buttons');
                $(msg).insertAfter('.product-compare');
            });
        }

        //--></script>