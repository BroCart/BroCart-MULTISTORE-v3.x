<?php

/**
 * Large Order Discount extension for Opencart.
 *
 * @author Diana Savvatina <diana.savvatina@gmail.com>
 * @version 1.0
 * @copyright © Diana Savvatina 2013
 * @license Creative Common's ShareAlike License - http://creativecommons.org/licenses/by-sa/3.0/
 */


?>

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
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td><?php echo $entry_date_start; ?></td>
                        <td><input type="text" name="large_order_discount_date_start" id="date_start" value="<?php echo $large_order_discount_date_start; ?>" /></td>
						<td></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_date_end; ?></td>
                        <td><input type="text" name="large_order_discount_date_end" id="date_end" value="<?php echo $large_order_discount_date_end; ?>" /></td>
						<td></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_type; ?></td>
                        <td>
                            <select name="large_order_discount_type" id="large_order_discount_type">
                                <option value="F" <?= (($large_order_discount_type == "F" ? "selected='selected'" : "")) ?>>Fixed Value</option>
                                <option value="P" <?= (($large_order_discount_type == "P" ? "selected='selected'" : "")) ?>>Percentage</option>
                            </select>
                        </td>
						<td></td>
						<td></td>
                    </tr>
                   <tr>
						<td><?php echo $entry_level; ?></td>
                        <td><?php echo $entry_total; ?></td>
                        <td><?php echo $entry_amount; ?></td>
                        <td></td>
                    </tr>
                   <tr>
                        <td><?php echo $entry_level; ?>01:</td>
                        <td><input type="text" name="large_order_discount_total01" value="<?php echo $large_order_discount_total01; ?>" /></td>
                        <td><input type="text" name="large_order_discount_amount01" value="<?php echo $large_order_discount_amount01; ?>" /></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_level; ?>02:</td>
                        <td><input type="text" name="large_order_discount_total02" value="<?php echo $large_order_discount_total02; ?>" /></td>
                        <td><input type="text" name="large_order_discount_amount02" value="<?php echo $large_order_discount_amount02; ?>" /></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_level; ?>03:</td>
                        <td><input type="text" name="large_order_discount_total03" value="<?php echo $large_order_discount_total03; ?>" /></td>
                        <td><input type="text" name="large_order_discount_amount03" value="<?php echo $large_order_discount_amount03; ?>" /></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_level; ?>04:</td>
                        <td><input type="text" name="large_order_discount_total04" value="<?php echo $large_order_discount_total04; ?>" /></td>
                        <td><input type="text" name="large_order_discount_amount04" value="<?php echo $large_order_discount_amount04; ?>" /></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_level; ?>05:</td>
                        <td><input type="text" name="large_order_discount_total05" value="<?php echo $large_order_discount_total05; ?>" /></td>
                        <td><input type="text" name="large_order_discount_amount05" value="<?php echo $large_order_discount_amount05; ?>" /></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_level; ?>06:</td>
                        <td><input type="text" name="large_order_discount_total06" value="<?php echo $large_order_discount_total06; ?>" /></td>
                        <td><input type="text" name="large_order_discount_amount06" value="<?php echo $large_order_discount_amount06; ?>" /></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_level; ?>07:</td>
                        <td><input type="text" name="large_order_discount_total07" value="<?php echo $large_order_discount_total07; ?>" /></td>
                        <td><input type="text" name="large_order_discount_amount07" value="<?php echo $large_order_discount_amount07; ?>" /></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_level; ?>08:</td>
                        <td><input type="text" name="large_order_discount_total08" value="<?php echo $large_order_discount_total08; ?>" /></td>
                        <td><input type="text" name="large_order_discount_amount08" value="<?php echo $large_order_discount_amount08; ?>" /></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_level; ?>09:</td>
                        <td><input type="text" name="large_order_discount_total09" value="<?php echo $large_order_discount_total09; ?>" /></td>
                        <td><input type="text" name="large_order_discount_amount09" value="<?php echo $large_order_discount_amount09; ?>" /></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_level; ?>10:</td>
                        <td><input type="text" name="large_order_discount_total10" value="<?php echo $large_order_discount_total10; ?>" /></td>
                        <td><input type="text" name="large_order_discount_amount10" value="<?php echo $large_order_discount_amount10; ?>" /></td>
						<td></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_status; ?></td>
                        <td><select name="large_order_discount_status">
                                <?php if ($large_order_discount_status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_sort_order; ?></td>
                        <td><input type="text" name="large_order_discount_sort_order" value="<?php echo $large_order_discount_sort_order; ?>" size="1" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <script type="text/javascript"><!--
        $('#date_start').datepicker({dateFormat: 'yy-mm-dd'});
        $('#date_end').datepicker({dateFormat: 'yy-mm-dd'});
    //--></script>

    <?php echo $footer; ?>