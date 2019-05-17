<script type="application/ld+json"> {
"@context": "http://schema.org",
"@type": "LocalBusiness",
"name": "<?php echo $name; ?>",
"url": "<?php echo $href; ?>",
"image": "<?php echo $image; ?>",
"telephone" : "<?php echo $telephone; ?>",
"email": "<?php echo $email; ?>",
"priceRange": "<?php echo $pricerange; ?>",
"address": {
"@type": "PostalAddress",
"addressLocality": "<?php echo $address_locality; ?>",
"postalCode": "<?php echo $postal_code; ?>",
"streetAddress": "<?php echo $street_address; ?>"
},
"location": {
"@type": "Place",
"address": {
"@type": "PostalAddress",
"addressLocality": "<?php echo $address_locality; ?>",
"postalCode": "<?php echo $postal_code; ?>",
"streetAddress": "<?php echo $street_address; ?>"
},
"geo": {
"@type": "GeoCoordinates",
"latitude": "<?php echo $latitude; ?>",
"longitude": "<?php echo $longitude; ?>"
}
},
"potentialAction": {
"@type": "SearchAction",
"target": "<?php echo $search; ?>?search={search_term_string}",
"query-input": "required name=search_term_string"
},	  
"contactPoint" : [
{
"@type" : "ContactPoint",
"telephone" : "<?php echo $telephone; ?>",
"contactType" : "customer service"
}],
"openingHoursSpecification":[

{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Monday",
"opens": "<?php echo $monday_o; ?>",
"closes": "<?php echo $monday_c; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Tuesday",
"opens": "<?php echo $tuesday_o; ?>",
"closes": "<?php echo $tuesday_c; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Wednesday",
"opens": "<?php echo $wednesday_o; ?>",
"closes": "<?php echo $wednesday_c; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Thursday",
"opens": "<?php echo $thursday_o; ?>",
"closes": "<?php echo $thursday_c; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Friday",
"opens": "<?php echo $friday_o; ?>",
"closes": "<?php echo $friday_c; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Saturday",
"opens": "<?php echo $saturday_o; ?>",
"closes": "<?php echo $saturday_c; ?>"
},
{
"@type": "OpeningHoursSpecification",
"dayOfWeek": "Sunday",
"opens": "<?php echo $sunday_o; ?>",
"closes": "<?php echo $sunday_c; ?>"
}]}
</script>