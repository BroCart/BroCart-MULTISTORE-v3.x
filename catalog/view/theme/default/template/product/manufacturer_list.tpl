<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
 <div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?><?php echo $breadcrumb['separator']; ?>
		<div style="display: inline" typeof="v:Breadcrumb">
			<?php if($i+1<count($breadcrumbs)) { ?>
				<a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a> 
			<?php } else { ?>
				<span rel="v:url" href="<?php echo $breadcrumb['href']; ?>" property="v:title"><?php echo $breadcrumb['text']; ?></span>
			<?php } ?>
		</div>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($categories) { ?>
  <p><b><?php echo $text_index; ?></b>
    <?php foreach ($categories as $category) { ?>
    &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><b><?php echo $category['name']; ?></b></a>
    <?php } ?>
  </p>
  <?php foreach ($categories as $category) { ?>
  <div class="manufacturer-list">
    <div class="manufacturer-heading"><?php echo $category['name']; ?><a id="<?php echo $category['name']; ?>"></a></div>
    <div class="manufacturer-content">
      <?php if ($category['manufacturer']) { ?>
      <?php for ($i = 0; $i < count($category['manufacturer']);) { ?>
      <ul>
        <?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>
        <?php for (; $i < $j; $i++) { ?>
        <?php if (isset($category['manufacturer'][$i])) { ?>
        <li><a href="<?php echo $category['manufacturer'][$i]['href']; ?>"><?php if (!empty($category['manufacturer'][$i]['thumb'])){ ?>
		<img src='<?php echo $category['manufacturer'][$i]['thumb']; ?>' alt='<?php echo $category['manufacturer'][$i]['name']; ?>' style='vertical-align:middle; padding-right:10px;'/><br/><?php } ?>
		<?php echo $category['manufacturer'][$i]['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
      <?php } ?>
      <?php } ?>
    </div>
  </div>
  <?php } ?>  
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>