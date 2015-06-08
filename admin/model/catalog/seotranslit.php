<?php
class ModelCatalogSeoTranslit extends Model {
    public function _translit($name) {
		$rus =   array('а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я', ' ', 'і', 'ї', 'є');
		$rusUp = array('А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я', ' ', 'І', 'Ї', 'Є');
		$lat = array('a', 'b', 'v','g','d','e','e','zh','z','i','j','k','l','m','n','o','p','r','s','t','u','f','h','c','ch','sh','sh','','i','','e','u','ya', '-', 'i', 'ji', 'je');
		$characters = 'abcdefghijklmnopqrstuvwxyz1234567890-_';

        $name = trim($name);

        $res = str_replace($rus, $lat, trim($name));
        $res = str_replace($rusUp, $lat, $res);

        $return = '';

		for ($i = 0; $i < strlen($res); $i++){
			$c = strtolower(substr($res, $i, 1));
			if (strpos($characters, $c) === false) $c = '';
			$return .= $c;
		}

        return $return;

    }

    public function translit($product) {
        $description = reset($product['product_description']);

        if ($product['keyword'] == '')
            $product['keyword'] = $this->_translit($description['name']) . '-' . $this->_translit($product['model']);

        return $product;
    }
}
?>