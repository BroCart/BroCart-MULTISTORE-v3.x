<div class="panel panel-default">	
	<?php if ($display_view == 3) { ?>
	<div class="panel-heading"><?php echo $header_title; ?></div>
	<div>		
		<?php foreach ($alphabets as $alphabet) { ?>
        &nbsp;&nbsp;&nbsp;<a href="<?php echo $alphabet['href']; ?>"><?php echo $alphabet['name']; ?></a>
        <?php } ?>
	</div>
	<?php } else { ?>
	<div class="panel-heading"><?php echo $header_title; ?></div>
	<div class="list-group">		
		<?php if ($display_view == 1) { ?>
		<?php foreach ($manufacturers as $manufacturer) { ?>
			<a href="<?php echo $manufacturer['href']; ?>" class="list-group-item <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) {?>active<?php } ?>">
				<?php echo $manufacturer['name']; ?>
			</a>
		<?php } ?>
		<?php } ?>
			<select onchange="location=this.value;" class="form-control">
				<option value=""></option>
				<?php foreach ($manufacturers as $manufacturer) { ?>
					<option value="<?php echo $manufacturer['href']; ?>" <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) {?>selected="selected"<?php } ?>>
						<?php echo $manufacturer['name']; ?>
					</option>
				<?php } ?>
			</select>
		<?php } ?>
	</div>
	<?php } ?>
</div>