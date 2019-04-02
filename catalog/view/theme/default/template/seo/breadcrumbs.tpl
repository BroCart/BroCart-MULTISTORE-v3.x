<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "BreadcrumbList",
"itemListElement": [<?php foreach ($breads as $key => $breadcrumb) { ?>
{
"@type": "ListItem",
"position": <?php echo $key; ?>,
"item": {
"@id": "<?php echo $breadcrumb['href']; ?>",
"name": "<?php echo $breadcrumb['text']; ?>"
}
}<?php if($key < count($breads) - 1){ ?>,<?php } ?>
<?php } ?>]
}	  
</script>
