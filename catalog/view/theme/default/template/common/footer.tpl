</div>
<div class="layout">
<!--start layout -->			
	<div id="footer_top">
	<!--start footer-top -->				
		<?php echo $footer_top_left; ?>
		<?php echo $footer_top_right; ?>		
		<?php echo $footer_top; ?>
	</div>
	<!--end footer-top -->
</div>
<!--end layout -->
<div id="footer">
<div id="powered">
<!-- Language -->
<?php echo $language; ?>
</div>
<!--start-->
<div class="foot">
  <?php if ($informations) { ?>
  <div class="column">
   <!-- <h3><?php echo $text_information; ?></h3>-->
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <div class="column">
    <!--<h3><?php echo $text_service; ?></h3>-->
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column">
   <!-- <h3><?php echo $text_extra; ?></h3>-->
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  <div class="column">
   <!-- <h3><?php echo $text_account; ?></h3>-->
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
</div>
<div class="copy"><?php echo $powered; ?></div>
</div><!--end-->
<div class="layout">
	<!--start layout -->			
	<div id="footer_bottom">
		<!--start footer-bottom -->				
		<?php echo $footer_bottom_left; ?>
		<?php echo $footer_bottom_right; ?>				
		<?php echo $footer_bottom; ?>
	</div>
	<!--end footer-bottom -->
</div>
<!--end layout -->
<?php echo $yandex_metrika; ?>
<script type="text/javascript"><!--

function svetlofor() {
	$("#special")
		.animate({color: "red"}, 2500)
		.animate({color: "orange"}, 2500)
		.animate({color: "yellow"}, 2500)
		.animate({color: "white"}, 2500)
		.animate({color: "green"}, 2500)
		.animate({color: "blue"}, 2500);
setTimeout("svetlofor()", 2500);
}
svetlofor();
<?php if ($this->config->get('config_to_top') == '1') { ?>
 $(window).scroll(function () {
        if ($(this).scrollTop() > 200) {
            if ($("#back-top a").length<1) {
                $('body').append('<div id="back-top"><a href="#top"><span class="arrow" style="background:url(<?php echo $to_top; ?>);"></span></a></div>')
                $("#back-top a").click(function () {$("body,html").animate({scrollTop: 0}, 800);return false;});
            }
            $("#back-top").fadeIn();
        } else {
            $("#back-top").fadeOut();}
});
<?php } ?>
//--></script>
<script type="application/ld+json">
	{ "@context" : "http://schema.org",
	  "@type" : "Organization",
	  "name" : "<?php echo $org_name; ?>",
	  "url" : "<?php echo $org_url; ?>",
	  "logo": "<?php echo $org_logo; ?>",
	  "contactPoint" : [
		{ "@type" : "ContactPoint",
		  "telephone" : "+<?php echo $org_tel; ?>",
		  "contactType" : "customer service"
		} ] }
	</script>
</body></html>