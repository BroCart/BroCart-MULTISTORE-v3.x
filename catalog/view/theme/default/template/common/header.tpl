<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if (is_array($this->document->getOpengraph())) { ?>
<?php foreach ($this->document->getOpengraph() as $opengraph) { ?>
<meta property="<?php echo $opengraph['meta'] ?>" content="<?php echo $opengraph['content']; ?>" />
<?php } ?>
<?php } ?>
<?php if ($robots) { ?>
<meta name="Robots" content="<?php echo $robots; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<!--[ CSS ]-->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/positions_pro.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/livesearch.css" />

<!-- jQuery ]-->
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script async type="text/javascript" src="catalog/view/javascript/commonproof.js"></script>
<script async type="text/javascript" src="catalog/view/javascript/livesearch.js"></script>
<script async type="text/javascript" src="catalog/view/javascript/notify.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<audio id="cart_ding" controls preload="auto" hidden="hidden">
<?php if ($audio) { ?>
<source src="image/ding.wav" controls></source>
<?php } ?>
</audio>
<noindex>
<a id="real" href="<?php echo $real; ?>" style="visibility: hidden;" rel="nofollow"></a>
</noindex>
<!--start layout -->
<div class="layout">
<!--start header-top -->
	<div id="header_top">
	
		<div class="clear"></div>
		
		<?php echo $header_top; ?>
		
		<div class="clear"></div>				
		<?php echo $header_top_left; ?><?php echo $header_top_right; ?>	
		
		<div class="clear"></div>	
		
	</div>
	<!--end header-top -->
</div>
<!--end layout -->
		
<?php if ($categories) { ?>
<div id="menu" style="position: fixed;">

  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
	<!--li><a href="<?php echo $gallery; ?>"><?php echo $text_gallery; ?></a></li-->

	<li> 
	</li>
	
  </ul>	
  

		
</div>
<?php } ?>


<div id="header">

		<?php if ($logo) { ?>
			<?php if (strlen ($_SERVER['REQUEST_URI']) > 1 ){ ?>
				<div id="logo" itemscope="" itemtype="http://schema.org/Organization"><a itemprop="url" href="<?php echo $home; ?>"><img itemprop="logo" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
			<?php } else  { ?>
				<div id="logo" itemscope="" itemtype="http://schema.org/Organization"><img itemprop="logo" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></div>
			<?php } ?>
		<?php } ?>

		<div id="welcome">
			<?php if (!$logged) { ?>
			<?php echo $text_welcome; ?>
			<?php } else { ?>
			<?php echo $text_logged; ?>
			<?php } ?>
		</div>
		
	<div id="search">
			<div class="button-search"></div>
			<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
	</div>
</div>


	
<div id="container">

	<div class="topmenu">
	
		<div class="linkstop">
		
			<a href="<?php echo $special; ?>" id="special" class="special"><?php echo $text_special; ?></a>
			<a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
			<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
			<?php if(!$settings){?>
			<a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
			<?php } ?>
			<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
			<a href="<?php echo $gallery; ?>"><?php echo $text_gallery; ?></a>
		</div>	
		
		<?php echo $currency; ?>
		<?php echo $cart; ?>
	</div>
	


<div id="notification"></div>

<!--start layout -->
<div class="layout">
<!--start slider -->
	<div id="slider">
	
		<div class="clear"></div>
		
		<?php echo $slider_top; ?>
			
		<div class="clear"></div>
		
		<?php echo $slider_content_left; ?><?php echo $slider_content_right; ?>
		
		<div id="slider_content"><?php echo $slider_content; ?></div>
		
		<div class="clear"></div>
		
		<?php echo $slider_left; ?><?php echo $slider_right; ?>
		
		<div class="clear"></div>
	</div>
	<!--end slider -->
</div>
<!--end layout -->