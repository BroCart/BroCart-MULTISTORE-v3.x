<?php

/**
 * Large Order Discount extension for Opencart.
 *
 * @author Diana Savvatina <diana.savvatina@gmail.com>
 * @version 1.0
 * @copyright © Diana Savvatina 2013
 * @license Creative Common's ShareAlike License - http://creativecommons.org/licenses/by-sa/3.0/
 */


class ModelTotalLargeOrderDiscount extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		if ($this->cart->getSubTotal() && ($this->cart->getSubTotal() >= $this->config->get('large_order_discount_total01'))) {
                        // Check the dates!
                        if(date("Y-m-d") < $this->config->get("large_order_discount_date_start") || date("Y-m-d") >= $this->config->get("large_order_discount_date_end")){
                            return;
                        }
			// the order has qualified for the minimal size to get a discount.
			// now we need to find out the maximum configured discount for this order's amount
			
			$total = $this->cart->getSubTotal();
			$qualified_total = 0+$this->config->get('large_order_discount_total01');
			$discount = 0+$this->config->get('large_order_discount_amount01');
			
			if($total > $this->config->get('large_order_discount_total02') && $this->config->get('large_order_discount_total02') > $qualified_total) { $qualified_total = $this->config->get('large_order_discount_total02'); $discount = $this->config->get('large_order_discount_amount02'); }
			if($total > $this->config->get('large_order_discount_total03') && $this->config->get('large_order_discount_total03') > $qualified_total) { $qualified_total = $this->config->get('large_order_discount_total03'); $discount = $this->config->get('large_order_discount_amount03'); }
			if($total > $this->config->get('large_order_discount_total04') && $this->config->get('large_order_discount_total04') > $qualified_total) { $qualified_total = $this->config->get('large_order_discount_total04'); $discount = $this->config->get('large_order_discount_amount04'); }
			if($total > $this->config->get('large_order_discount_total05') && $this->config->get('large_order_discount_total05') > $qualified_total) { $qualified_total = $this->config->get('large_order_discount_total05'); $discount = $this->config->get('large_order_discount_amount05'); }
			if($total > $this->config->get('large_order_discount_total06') && $this->config->get('large_order_discount_total06') > $qualified_total) { $qualified_total = $this->config->get('large_order_discount_total06'); $discount = $this->config->get('large_order_discount_amount06'); }
			if($total > $this->config->get('large_order_discount_total07') && $this->config->get('large_order_discount_total07') > $qualified_total) { $qualified_total = $this->config->get('large_order_discount_total07'); $discount = $this->config->get('large_order_discount_amount07'); }
			if($total > $this->config->get('large_order_discount_total08') && $this->config->get('large_order_discount_total08') > $qualified_total) { $qualified_total = $this->config->get('large_order_discount_total08'); $discount = $this->config->get('large_order_discount_amount08'); }
			if($total > $this->config->get('large_order_discount_total09') && $this->config->get('large_order_discount_total09') > $qualified_total) { $qualified_total = $this->config->get('large_order_discount_total09'); $discount = $this->config->get('large_order_discount_amount09'); }
			if($total > $this->config->get('large_order_discount_total10') && $this->config->get('large_order_discount_total10') > $qualified_total) { $qualified_total = $this->config->get('large_order_discount_total10'); $discount = $this->config->get('large_order_discount_amount10'); }

	
			$this->load->language('total/large_order_discount');

			// Calculate how much we have to take away from the total.
			$remove = "0.00";
			$subTotal = $total;
			
			if($this->config->get("large_order_discount_type") == "P"){
				$perc = $discount/100;
				$remove = $subTotal-($subTotal*(1-$perc));
				$description = $discount . "%; " . $this->language->get('text_large_order_discount_sum') . " > " . $this->currency->format($qualified_total);
			} else {
				$remove = $discount;
				$description = $this->currency->format($discount) . "; " . $this->language->get('text_large_order_discount_sum') . " > " . $this->currency->format($qualified_total);
			}

			$total_data[] = array(
                            'code'       => 'large_order_discount',
                            'title'      => $this->language->get('text_large_order_discount') . "(". $description . ")",
                            'text'       => $this->currency->format(-$remove),
                            'value'      => -$remove,
                            'sort_order' => $this->config->get('large_order_discount_sort_order')
			);

                        $total -= $remove;
		}
	}
}
?>