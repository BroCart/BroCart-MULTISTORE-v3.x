<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?><?php echo $breadcrumb['separator']; ?>
		<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" style="display: inline"><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><?php echo $breadcrumb['text']; ?></a> <?php } else { ?><span itemprop="title"><?php echo $breadcrumb['text']; ?></span><?php } ?></div>
        <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div unselectable="on" oncopy="return false" oncontextmenu="return false" onselectstart="return false">
  <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
  <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>