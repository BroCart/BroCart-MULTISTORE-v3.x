<?php echo $header; ?>
<?php if ($heading_title && $home_descroption) { ?>
<div id="seo_main">
<?php if ($heading_title) { ?>
<h1><?php echo $heading_title; ?></h1>
<?php } ?>
<?php echo $home_descroption; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?></div>
<?php echo $content_bottom; ?>
<?php echo $footer; ?>