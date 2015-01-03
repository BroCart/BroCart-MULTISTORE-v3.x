<?php echo $header; ?>
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
      <h1><img src="view/image/total.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">        
			<table class="list">
					<thead>
                      <tr>
						<td class="left"><?php echo $entry_method; ?></td>
						<td><?php echo $entry_type; ?></td>
						<td class="left"><?php echo $entry_charge; ?></td>
						<td class="left"><?php echo $entry_description; ?></td>						
						<td><?php echo $entry_status; ?></td>
						<td><?php echo $entry_sort_order; ?></td>
                      </tr>
					</thead>
					<tbody>
                      <tr>
						<td class="left"><select name="pd_method">
                  			<?php foreach ($payments as $payment) { ?>
                  			<?php  if ($payment['fname'] != $pd_method) { ?>
                  			<option value="<?php echo $payment['fname']; ?>"><?php echo $payment['hname']; ?></option>
                  			<?php } else { ?>
                  			<option value="<?php echo $payment['fname']; ?>" selected="selected"><?php echo $payment['hname']; ?></option>
                  			<?php } ?>
                  			<?php } ?>
                          </select></td>
						  <td><select name="pd_type">
							  <?php if ($pd_type == 'P') { ?>
							  <option value="P" selected="selected"><?php echo $text_percent; ?></option>
							  <?php } else { ?>
							  <option value="P"><?php echo $text_percent; ?></option>
							  <?php } ?>
							  <?php if ($pd_type == 'F') { ?>
							  <option value="F" selected="selected"><?php echo $text_amount; ?></option>
							  <?php } else { ?>
							  <option value="F"><?php echo $text_amount; ?></option>
							  <?php } ?>
							</select>
						</td>
						<td class="left"><input name="pd_charge" value="<?php echo $pd_charge; ?>" /></td>
                        <td class="left"><?php foreach ($languages as $language) { ?>
                          <input name="pd_description_<?php echo $language['language_id']; ?>" value="<?php echo isset(${'pd_description_' . $language['language_id']}) ? ${'pd_description_' . $language['language_id']} : ''; ?>"> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br /><br /><?php } ?></td>
						 <td><select name="pd_status">
							<?php if ($pd_status) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						  </select></td>
						<td><input type="text" name="pd_sort_order" value="<?php echo $pd_sort_order; ?>" size="1" /></td>
					</tr>
				</tbody>
			</table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 