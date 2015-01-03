<?php 
	/*
		This file is part of the "Extra Product Tabs Opencart Extension"

		The "Extra Product Tabs Opencart Extension" is free software: you can redistribute it and/or modify it under
		the terms of the GNU General Public License as published by the Free Software
		Foundation, either version 3 of the License, or (at your option) any later version.

		The Extra Product Tabs Opencart Extension is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
		FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

		---------------------------------------------------------------------
    Name:		Extra Product Tabs Opencart Extension
    
    Version: 1.0.4

    OpenCart:	Version 1.5.4.1, 1.5.5.1

    Author: 	rebdog (Godfrey Livinsgtone godfrey@satelliteshop.co.nz)

    Copyright 2012, 2013

	*/
echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
            <td><?php foreach ($languages as $language) { ?>
              <input type="text" name="product_tab_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_tab_description[$language['language_id']]) ? $product_tab_description[$language['language_id']]['name'] : ''; ?>" />
              <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
              <?php if (isset($error_name[$language['language_id']])) { ?>
              <span class="error"><?php echo $error_name[$language['language_id']]; ?></span><br />
              <?php } ?>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
          </tr>
					<tr>
						<td><?php echo $entry_position; ?></td>
						<td>
							<select name="position">
								<?php foreach($insert_positions as $insert_position) { ?>
									<option value="<?php echo $insert_position['position_number'];?>" <?php if ($position == $insert_position['position_number']) { ?> selected="selected" <?php } ?>><?php echo $insert_position['description'];?></option>
								<?php } ?>
							</select>
						</td>
					</tr>
					<tr>
						<td><?php echo $entry_show_empty; ?></td>
						<td>
							<select name="show_empty">
								<?php if ($show_empty) { ?>
								<option value="1" selected="selected"><?php echo $text_yes; ?></option>
								<option value="0"><?php echo $text_no; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_yes; ?></option>
								<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</td>
					</tr>
					<tr>
						<td><?php echo $entry_status; ?></td>
						<td>
							<select name="status">
								<?php if ($status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</td>
					</tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>