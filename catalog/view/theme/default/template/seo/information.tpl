<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "NewsArticle",
"mainEntityOfPage":{
"@type":"WebPage",
"@id": "<?php echo $url; ?>"
},
"headline": "<?php echo $name; ?>",
"image": {
"@type": "ImageObject",
"url": "<?php echo $logo; ?>",
"width": "<?php echo $image_width; ?>",
"height": "<?php echo $image_height; ?>"
},
"datePublished": "<?php echo $date; ?>",
"dateModified": "<?php echo $date; ?>",
"author": "<?php echo $author; ?>",					  
"publisher": {
"@type": "Organization",
"name": "<?php echo $author; ?>",
"logo": {
"@type": "ImageObject",
"url": "<?php echo $logo; ?>"
}
},
"description":"<?php echo $description; ?>"
}
</script>