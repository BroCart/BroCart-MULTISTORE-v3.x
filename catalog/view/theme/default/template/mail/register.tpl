<?php echo $text_welcome; ?>

<?php if (!$approval) { ?>
<?php echo $text_login; ?>

<?php echo $login; ?>

<?php echo $text_service; ?>

<?php echo $text_thanks; ?>
<?php echo $store; ?>
<?php } else { ?>
<?php echo $text_approval; ?>

<?php echo $login; ?>

<?php echo $text_thanks; ?>
<?php echo $store; ?>
<?php } ?>