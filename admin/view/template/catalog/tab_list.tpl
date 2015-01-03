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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'td.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 't.sort_order') { ?>
                <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($product_tabs) { ?>
            <?php foreach ($product_tabs as $product_tab) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($product_tab['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product_tab['tab_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product_tab['tab_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $product_tab['name']; ?></td>
              <td class="right"><?php echo $product_tab['sort_order']; ?></td>
              <td class="right"><?php foreach ($product_tab['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>