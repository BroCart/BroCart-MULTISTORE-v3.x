<script type="application/ld+json"> {
"@context": "http://schema.org",
"@type": "LocalBusiness",
"name": "<?php echo $microdata['name']; ?>",
"url": "<?php echo $microdata['href']; ?>",
"image": "<?php echo $microdata['image']; ?>",
"telephone" : "<?php echo $microdata['telephone']; ?>",
"email": "<?php echo $microdata['email']; ?>",
"priceRange": "<?php echo $microdata['pricerange']; ?>",
"address": {
"@type": "PostalAddress",
"addressLocality": "<?php echo $microdata['address_locality']; ?>",
"postalCode": "<?php echo $microdata['postal_code']; ?>",
"streetAddress": "<?php echo $microdata['street_address']; ?>"
},
"location": {
"@type": "Place",
"address": {
"@type": "PostalAddress",
"addressLocality": "<?php echo $microdata['address_locality']; ?>",
"postalCode": "<?php echo $microdata['postal_code']; ?>",
"streetAddress": "<?php echo $microdata['street_address']; ?>"
},
"geo": {
"@type": "GeoCoordinates",
"latitude": "<?php echo $microdata['latitude']; ?>",
"longitude": "<?php echo $microdata['longitude']; ?>"
}
},
"potentialAction": {
"@type": "SearchAction",
"target": "<?php echo $microdata['href']; ?>index.php?route=product/search&search={search_term_string}",
"query-input": "required name=search_term_string"
},	  
"contactPoint" : [
{
"@type" : "ContactPoint",
"telephone" : "<?php echo $microdata['telephone']; ?>",
"contactType" : "customer service"
}],
"openingHoursSpecification":[

{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Monday",
"opens": "<?php echo $microdata['monday_o']; ?>",
"closes": "<?php echo $microdata['monday_c']; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Tuesday",
"opens": "<?php echo $microdata['tuesday_o']; ?>",
"closes": "<?php echo $microdata['tuesday_c']; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Wednesday",
"opens": "<?php echo $microdata['wednesday_o']; ?>",
"closes": "<?php echo $microdata['wednesday_c']; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Thursday",
"opens": "<?php echo $microdata['thursday_o']; ?>",
"closes": "<?php echo $microdata['thursday_c']; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Friday",
"opens": "<?php echo $microdata['friday_o']; ?>",
"closes": "<?php echo $microdata['friday_c']; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Saturday",
"opens": "<?php echo $microdata['saturday_o']; ?>",
"closes": "<?php echo $microdata['saturday_c']; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Sunday",
"opens": "<?php echo $microdata['sunday_o']; ?>",
"closes": "<?php echo $microdata['sunday_c']; ?>"
}]}
</script>