<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?><?php echo $breadcrumb['separator']; ?>
		<div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" style="display: inline"><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><?php echo $breadcrumb['text']; ?></a> <?php } else { ?><span itemprop="title"><?php echo $breadcrumb['text']; ?></span><?php } ?></div>
        <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="middle">
    <div class="textblock">
      <div style="margin-top: 10px; margin-bottom: 10px;"><?php echo $description; ?></div>
      <?php if (isset($galleries)) { ?>
        <div class="heading"><?php echo $text_gallery; ?></div>
        <table class="list" style="padding-top: 8px;">
          <?php for ($i = 0; $i < sizeof($galleries); $i = $i + 4) { ?>
          <tr>
            <?php for ($j = $i; $j < ($i + 4); $j++) { ?>
            <td width="25%"><?php if (isset($galleries[$j])) { ?>
              <a href="<?php echo $galleries[$j]['href']; ?>"><img src="<?php echo $galleries[$j]['thumb']; ?>" title="<?php echo $galleries[$j]['name']; ?>" alt="<?php echo $galleries[$j]['name']; ?>" /></a><br />
              <a href="<?php echo $galleries[$j]['href']; ?>"><?php echo $galleries[$j]['name']; ?></a><br />
              <?php } ?></td>
            <?php } ?>
          </tr>
          <?php } ?>
        </table>
      <?php } ?>
      <?php if (isset($images)) { ?>
        <div class="heading"><?php echo $text_images; ?></div>
        <div style="text-align: center; margin-bottom: 10px;"><?php echo $text_enlarge; ?></div>
        <table class="list" style="padding-top: 8px;">
          <?php for ($i = 0; $i < sizeof($images); $i = $i + 4) { ?>
          <tr>
            <?php for ($j = $i; $j < ($i + 4); $j++) { ?>
            <td width="25%"><?php if (isset($images[$j])) { ?>
              <a href="<?php echo $images[$j]['popup']; ?>" title="<?php echo $images[$j]['title']; ?>" rel="prettyPhoto[pp_gal]"><img src="<?php echo $images[$j]['thumb']; ?>" title="<?php echo $images[$j]['title']; ?>" alt="<?php echo $images[$j]['title']; ?>" /></a><br />
              <?php echo $images[$j]['title']; ?><br />
              <?php } ?></td>
            <?php } ?>
          </tr>
          <?php } ?>
        </table>
        <div class="pagination"><?php echo $pagination; ?></div>
      <?php } ?>
    </div>
    <div class="copyblock"><?php echo $text_copyright; ?></div>
  </div>
 
</div>
<script type="text/javascript" charset="utf-8">
  $(document).ready(function(){
    $("a[rel^='prettyPhoto']").prettyPhoto({animation_speed: 'fast', /* fast/slow/normal */
			slideshow: 5000, /* false OR interval time in ms */
			autoplay_slideshow: false, /* true/false */
			opacity: 0.80, /* Value between 0 and 1 */
			show_title: true, /* true/false */
			allow_resize: true, /* Resize the photos bigger than viewport. true/false */
			default_width: 500,
			default_height: 344,
			counter_separator_label: "/", /* The separator for the gallery counter 1 "of" 2 */
			theme: 'dark_rounded', /* light_rounded / dark_rounded / light_square / dark_square / facebook */
			horizontal_padding: 20, /* The padding on each side of the picture */
			hideflash: false, /* Hides all the flash object on a page, set to TRUE if flash appears over prettyPhoto */
			wmode: 'opaque', /* Set the flash wmode attribute */
			autoplay: true, /* Automatically start videos: True/False */
			modal: false, /* If set to true, only the close button will close the window */
			deeplinking: true, /* Allow prettyPhoto to update the url to enable deeplinking. */
			overlay_gallery: true, /* If set to true, a gallery will overlay the fullscreen image on mouse over */
			keyboard_shortcuts: true, /* Set to false if you open forms inside prettyPhoto */
			changepicturecallback: function(){}, /* Called everytime an item is shown/changed */
			callback: function(){}, /* Called when prettyPhoto is closed */
			ie6_fallback: true
      });
});
</script>
<?php echo $footer; ?>