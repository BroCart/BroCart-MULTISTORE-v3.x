<script type="application/ld+json"> 
<?php foreach ($crmbs as $key => $microdata){ ?>
{
"@context": "http://schema.org",
"@type": "Product",
"url": "<?php echo $microdata['href']; ?>",
"category": "<?php echo $microdata['category']; ?>",
"image": "<?php echo $microdata['image']; ?>",
"brand": "<?php echo $microdata['manufacturer']; ?>",
"manufacturer": "<?php echo $microdata['manufacturer']; ?>",
"model": "<?php echo $microdata['model']; ?>",
"sku": "<?php echo $microdata['sku']; ?>",
<?php if ($microdata['ratingval']) { ?>
"aggregateRating": {
"@type": "AggregateRating",
"ratingValue": "<?php echo $microdata['ratingval']; ?>",
"reviewCount": "<?php echo $microdata['reviews']; ?>"
},
<?php } ?>

"description": "<?php echo $microdata['description']; ?>",
"name": "<?php echo $microdata['name']; ?>",
"offers": {
"@type": "Offer",
"url": "<?php echo $microdata['href']; ?>",
"priceValidUntil": "<?php echo $microdata['pricevaliduntil']; ?>",
"availability": "http://schema.org/<?php echo $microdata['stock']; ?>",
"price": "<?php echo $microdata['price']; ?>",
"priceCurrency": "<?php echo $microdata['pricecurrency']; ?>",
"itemCondition": "http://schema.org/NewCondition"
}<?php if ($microdata['totalreviews']){ ?>,
"review": [
<?php foreach ($microdata['totalreviews'] as $key => $review_item){ ?>
{
"@type": "Review",
"author": "<?php echo $review_item['author']; ?>",
"datePublished": "<?php echo $review_item['date_added']; ?>",
"description": "<?php echo $review_item['text']; ?>",
"reviewRating": {
"@type": "Rating",
"bestRating": "5",
"ratingValue": "<?php echo $review_item['rating']; ?>",
"worstRating": "1"
}
}<?php if($key != count($microdata['totalreviews'])){ ?>,<?php } ?><?php } ?>
]<?php } ?>
}
<?php } ?>
</script>