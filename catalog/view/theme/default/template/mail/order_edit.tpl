<?php echo $text_order_id; ?> <?php echo $order_id; ?>
<?php echo $text_date_added; ?> <?php echo $date_added; ?>

<?php echo $text_order_status; ?>

<?php echo $order_status; ?>

<?php if ($link) { ?>
<?php echo $text_link; ?>
<?php echo $link; ?>
<?php } ?>
<?php if ($comment) { ?>
<?php echo $text_comment; ?>
<?php echo $comment; ?>

<?php echo $text_footer; ?>
<?php } else { ?>
<?php echo $text_footer; ?>
<?php } ?>