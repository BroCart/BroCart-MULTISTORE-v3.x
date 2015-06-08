<script type="text/javascript" src="catalog/view/javascript/countdown.js"></script>
<div id="category">
  <h2><?php echo $heading_title; ?></h2>
  <div class="box-content" style="text-align: center;"> 
  <div id="frm_subscribe">
  <div id="jack">
  <form name="subscribe" id="subscribe"   >
  <table border="0" cellpadding="2" cellspacing="2">
  <?php if (!empty($option_fields1)) { ?>
  <tr>
     <td align="left"><?php echo $option_fields1; ?><br /></td>	 
   </tr>
   <?php } ?>
   <?php if ($thickbox) { ?>
   <tr>
     <td align="left">
   <?php $endDate = str_replace('-',' ',$logoff);
   $ymd = explode(" ", $endDate); ?>
	<div class="countdown_sb" id="timer"></div>   
   <br /></td>
   </tr>
   <?php } ?>
    
   <tr>
     <td align="center">
	 <input placeholder="Введите <?php echo $entry_email; ?>" type="text" value="" name="subscribe_email" id="subscribe_email">
	 <span id="valid" class="error"></span>
	 </td>
   </tr>
   <tr>
     <td align="center">
	 <input placeholder="Введите Ваше <?php echo $entry_name; ?>" type="text" value="" name="subscribe_name" id="subscribe_name"> </td>
	 <input type="hidden" value="<?php echo $code; ?>" name="option1" id="option1">
   </tr>   

   <tr>
     <td align="left">
     <input type="button" class="button" id="frog" value="<?php echo $entry_button; ?>" onclick="email_subscribe()" disabled="disabled" ><?php if($option_unsubscribe) { ?>
          <a class="button" onclick="email_unsubscribe()"><span><?php echo $entry_unbutton; ?></span></a>
      <?php } ?>    
     </td>
   </tr>
   
   <!--tr>
     <td align="center" id="subscribe_result"></td>
   </tr-->
  </table>
  </form>
  </div>
  <div align="center" id="subscribe_result"></div>
  </div>
  </div>
  <div class="bottom">&nbsp;</div>
<script language="javascript">
$(document).ready(function() {
    $('#subscribe_email').live('change',function() {
        if($(this).val() != '') {
            var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
            if(pattern.test($(this).val())){
                $(this).css({'border' : '1px solid #569b44'});
                //$('#valid').text('Верно');
				$('#frog').removeAttr("disabled");
				$('#valid').hide(500);
            } else {
                $(this).css({'border' : '1px solid #ff0000'});
                $('#valid').text('E-mail введён не верно');
				// $('#frog').attr("disabled", "disabled");
            }
        } else {
            $(this).css({'border' : '1px solid #ff0000'});
            $('#valid').text('Поле e-mail не должно быть пустым');
			//$('#frog').attr("disabled", "disabled");
        }
    });
});
function email_subscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				$('#subscribe_result').html('<?php echo $ding; ?>');
				$("#jack").hide();
			}}); 
}
function email_unsubscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				$('#subscribe_result').html('<?php echo $dong; ?>');
				$("#jack").hide();
			}}); 
}
</script>
<?php if ($thickbox) { ?>
<script type="text/javascript">
            $(function () {
                $('.countdown_sb').countdown({ 
				until: new Date(<?php echo $ymd[0] ?>,
				<?php echo $ymd[1] ?>-1 ,
				<?php echo $ymd[2] ?>),
				compact: true,
				description: '<?php echo $end; ?>'
				});
            });
        
				(function($) {
					$.countdown.regional['ru'] = {
						labels: ['Лет', 'Месяцев', 'Недель', 'Дней', 'Часов', 'Минут', 'Секунд'],
						labels1: ['Год', 'Месяц', 'Неделя', 'День', 'Час', 'Минута', 'Секунда'],
						labels2: ['Года', 'Месяца', 'Недели', 'Дня', 'Часа', 'Минуты', 'Секунды'],
						compactLabels: [' л', ' м', ' н', ' д'], compactLabels1: [' г', ' м', ' н', ' д'],
						whichLabels: function(amount) {
							var units = amount % 10;
							var tens = Math.floor((amount % 100) / 10);
							return (amount == 1 ? 1 : (units >= 2 && units <= 4 && tens != 1 ? 2 :
							(units == 1 && tens != 1 ? 1 : 0)));
						},
						digits: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
						timeSeparator: ':', isRTL: false};
					$.countdown.setDefaults($.countdown.regional['ru']);
				})(jQuery);
</script>
<?php } ?>
</div>
