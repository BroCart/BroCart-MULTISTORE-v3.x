<?php
$csrf_protection_expires     = 3600;

function csrf_start($use_show_error = false) {
	csrf_check($use_show_error);
    csrf_rewrite();
}

function csrf_rewrite() {
    csrf_token();
    ob_start('csrf_ob_handler');
}

function csrf_ob_handler($buffer, $flags) {
    $buffer = preg_replace('#(<form[^>]*method\s*=\s*["\']post["\'][^>]*>)#i', '$1' . csrf_form_input(), $buffer);

    return $buffer;
}

function csrf_form_input() {
    $token = csrf_token();
	
    return "<input type=\"hidden\" name=\"__csrf\" value=\"$token\">\n";
}

function csrf_token() {
    static $token;

    if (!$token) {
        $token = sha1(uniqid(mt_rand(), true));
		
        $session = &$_SESSION['__csrf'];
		
        if (!is_array($session)) {
            $session = array();
        }
		
        $session[$token] = time();
		
       $_SESSION['__csrf'] = $session;
    }

    return $token;
}

function csrf_check($use_show_error = false) {
    global $csrf_protection_expires;
	
	if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        return;
    }

    if (isset($_POST['__csrf'])) {
        $session = &$_SESSION['__csrf'];

        if (!is_array($session)) {
            return false;
        }

        $found = false;

        foreach ($session as $token => $time) {
            if (!secure_compare($token, (string)$_POST['__csrf'])) {
                continue;
            }

            if ($csrf_protection_expires) {
                if (time() <= $time + $csrf_protection_expires) {
                    $found = true;
                } else {
                    unset($session[$token]);
                }
            } else {
                $found = true;
            }

            break;
        }

        $_SESSION['__csrf'] = $session;

        if ($found) {
			return;
        }
		
		$protocol = &$_SERVER['SERVER_PROTOCOL'];		
		
		header('X-Frame-Options: SAMEORIGIN');
		header($protocol . ' 403 Forbidden');
		
		echo "<html><head><title>CSRF check failed</title></head><body>CSRF check failed.</body></html>";
        exit;
    }
}

function secure_compare($a, $b) {
	global $csrf_protection_expires;
	
    if (strlen($a) !== strlen($b)) {
		return false;
	}
	
	$randLength = 64;
  
	if (function_exists("random_bytes")) {
		$result = bin2hex(random_bytes($randLength));
    } elseif (function_exists("openssl_random_pseudo_bytes")) {
        $result = bin2hex(openssl_random_pseudo_bytes($randLength));
    } else {
        $result = '';
				
		for ($i = 0; $i < strlen($a); $i++) {
			$result |= ord($a[$i]) ^ ord($b[$i]);
		}
	}
	
	return substr($result, 0, $csrf_protection_expires);
}
