<?php echo $text_received; ?>

<?php echo $text_order_id; ?> <?php echo $order_id; ?>
<?php echo $text_date_added; ?> <?php echo $date_added; ?>
<?php echo $text_order_status; ?> <?php echo $order_status; ?>

<?php echo $text_product; ?>
<?php foreach ($products as $product) { ?>
<?php echo $product['quantity']; ?>x <?php echo $product['name']; ?> (<?php echo $product['model']; ?>) <?php echo $product['total']; ?>
<?php if ($product['option']) { ?>
<?php foreach ($product['option'] as $option) { ?>
	- <?php echo $option['name']; ?> <?php echo $option['value']; ?>
<?php } ?>
<?php } ?>
<?php } ?>
<?php if ($vouchers) { ?>
<?php foreach ($vouchers as $voucher) { ?>
1x <?php echo $voucher['description']; ?> <?php echo $voucher['amount']; ?>
<?php } ?>
<?php } ?>
<?php echo $text_total; ?>
<?php foreach ($totals as $total) { ?>
<?php echo $total['title']; ?>: <?php echo $total['value']; ?>
<?php } ?>

<?php if ($comment) { ?>
<?php echo $text_comment; ?>

<?php echo $comment; ?>
<?php } ?>
