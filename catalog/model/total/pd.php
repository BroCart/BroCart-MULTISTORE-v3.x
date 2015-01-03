<?php 
class ModelTotalPD extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		
		if ($this->config->get('pd_status') && $this->cart->getSubTotal() && isset($this->session->data['payment_method']['code'])) {	
						
			if ($this->session->data['payment_method']['code'] == $this->config->get('pd_method') && $this->config->get('pd_charge') && $this->config->get('pd_description_' . $this->config->get('config_language_id'))) {
				
				$payments_methods = $this->config->get('pd_method');
				$payments_type = $this->config->get('pd_type');
				$payments_charges = $this->config->get('pd_charge');
				$fix_description = $this->config->get('pd_description_' . $this->config->get('config_language_id'));
				
				if ($payments_type == 'P') {
					$payment_charge = $this->cart->getSubTotal() / 100 * $payments_charges;
				} else {
					$payment_charge = $payments_charges;		
				}
	//$buf = print_r($payment_charge ,true);$this->log->write('payment_charge:'.$buf);			
				$total_data[] = array( 				
					'code'       => 'pd',
					'title'      => $fix_description,
					'text'       => $this->currency->format($payment_charge),
        			'value'      => $payment_charge,
					'sort_order' => $this->config->get('pd_sort_order')
				);
				
				$total += $payment_charge;
			}
		}
	}
}
?>