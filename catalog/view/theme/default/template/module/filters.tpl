<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/filters.css" />
<div id="category">
    <h2><?php echo $heading_title; ?></h2>
    <div class="box-content">
        <div class="box-filters">
		<!-- Product Price Filters -->	
		<!-- Price Range -->
                    <?php if (!empty($priceRangeArray) && $pricemin != $pricemax) { ?>
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
			<div id="manufes">
            <div class="box-heading-checkbox"><?php echo $text_manufacturer_select_option; ?> </div>
                 <div class="checkboxDiv">
                <?php foreach ($manufacturers as $value) { ?>
                    <div>
                    <div class="checkbox product-options" id="">
                    <input id="<?php echo $value['manufacturer_id']; ?>" type="checkbox" class="myinput large custom" param="manufacturer" name="manufacturers[]" value="<?php echo $value['manufacturer_id']; ?>">
                    
					</div>
                    <label id="<?php echo $value['manufacturer_id']; ?>" for="<?php echo $value['manufacturer_id']; ?>" class="ma"><?php echo $value['name']; ?></label>
                    </div>
                    
                    <?php } ?>
					</div>
				</div>
			<?php } ?>			
			<!-- Product Attributes Filters -->            
                <?php if($productAttributes) { ?>
				<div id="attributes">
                <?php foreach($productAttributes as $attribute_group_id=>$attribute) { ?>

                <div class="box-heading-checkbox"><?php echo  $attribute['name']; ?> </div>
                <div class="checkboxDiv">
                    <?php foreach($attribute['attribute_values'] as $attribute_id => $attribute_value) { ?>
                    <fieldset>
                        <legend><?php echo  $attribute_value['name']; ?></legend>
                        <?php foreach($attribute_value['values'] as $pa_id => $text) { ?>

                        <div>
                            <div class="checkbox product-options" id="">
                                <input id="<?php echo $pa_id; ?>" type="checkbox" class="myinput large custom" param="product-attribute" name="product-attribute[]" value="<?php echo  $pa_id; ?>">								
                            </div>
                            <label id="pa-<?php echo $pa_id; ?>" for="<?php echo $pa_id; ?>" class="pa"><?php echo  $text; ?></label>
                        </div>
                        <?php } ?>
                    </fieldset>
                    <br />
                    <?php } ?>
                </div>
                <?php } ?>
				</div>
                <?php } ?>             
				<!-- Product Option Filters -->				
				<?php if($productOptions) { ?>
				<div id="opt">
					<?php foreach($productOptions as $value) { ?>
						<div class="box-heading-checkbox"><?php echo  $value['name']; ?> </div>
						<div class="checkboxDiv">
						<?php unset($value['name']); foreach($value as $child) { ?>
							<div>
								<div class="checkbox product-options" id="">
									<input  id="<?php echo $child['child_id']; ?>" type="checkbox" class="myinput large custom" param="product-option" name="product-option[]" value="<?php echo $child['child_id']; ?>">
									
								</div>
								<label id="<?php echo $child['child_id']; ?>" for="<?php echo $child['child_id']; ?>" class="op"><?php echo  $child['child_name']; ?></label>
							</div>
						<?php } ?>
						</div>
					<?php } ?>
					</div>
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
          
            function getSortingParams(){
                var getParams;
            //    $("input:checked").each(function() {

            //        var val = $(this).val();
			//		var spin = $(this).attr('param');
        //console.log("spin = "+spin);
			//		if(spin == 'manufacturer' && val != null){
			//			getParams = "&brand="+val;
			//		}
			//		if(spin == 'product-attribute' && val != null){
			//			getParams = "&pat="+val;
			//		}
            //        if(getParams == null && val != null){
            //                getParams = val;
             //       } else {
            //            if(getParams != null && val != null){
            //                getParams = "&"+getParams+"="+val;
            //            }
            //        }
                    //console.log(getParams);
            //    });
                return getParams;
            }
            
            function getFilterParams(){
				var arrData = new Array();
				
				$('.price-slide').each(function() {
                    var item = {};
                    item.param = 'price';
                    item.val = document.getElementById('price-min').value + '-' + document.getElementById('price-max').value;
                    arrData.push(item);
                });
			
                //Iterating over all the check boxes
                $("input:checked").each(function() {
                    var item = {};
                    item.param = $(this).attr('param');
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
		//console.log(url);
            $.ajax({
                url: url,
                type: "POST",
				//type: "GET",
                data: {filters : arrData},
                dataType: "json"
            }).done(function( data ) {
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
                $(data.html_output).insertAfter('.product-compare');
				
					updateManufes(data.manufes);
				
					updateAttibutes(data.attributes);
					
					updateOptions(data.opt);
				
				//if (data.manufes) {
					
				//}
            });
        }

		function updateOptions(opt){
            //if(opt.length!=0) {
                $('#opt :input').attr('disabled', true);
                $('#opt .op').addClass('disabled');
                $.each(opt, function (index, element) {
                    $('#' + element).prop('disabled', false);
                    $('#' + element).removeClass('disabled');
					$("label[for=" + element + "]").removeClass('disabled');
                });
            //}else{
			//	$('#opt :input').attr('disabled', false);
            //    $('#opt .op').removeClass('disabled');
            //}

        }
		
        function updateAttibutes(attributes){
            //if(attributes.length!=0) {
                $('#attributes :input').attr('disabled', true);
                $('#attributes .pa').addClass('disabled');
                $.each(attributes, function (index, element) {
				   $('#' + element).prop('disabled', false);
				   $('#pa-' + element).removeClass('disabled');
				   $("label[for=" + element + "]").removeClass('disabled');
                });
            //}else{
			//	$('#attributes :input').attr('disabled', false);
            //    $('#attributes .pa').removeClass('disabled');
            //}

        }

		function updateManufes(manufes){
            //if(manufes.length!=0) {
                $('#manufes :input').attr('disabled', true);
                $('#manufes .ma').addClass('disabled');
                $.each(manufes, function (index, element) {
                    $('#' + element).prop('disabled', false);
                    $('#' + element).removeClass('disabled');
					$("label[for=" + element + "]").removeClass('disabled');
                });
            //}else{
			//	$('#manufes :input').attr('disabled', false);
            //    $('#manufes .ma').removeClass('disabled');
            //}

        }

        //--></script>