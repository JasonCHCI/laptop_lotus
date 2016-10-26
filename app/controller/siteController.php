<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$pc = new SiteController();
$pc->route($action);

class SiteController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			case 'home':
			$this->home();
			break;

			case 'sell':
			$this->sell();
			break;

			case 'detail':
			$this->detail();
			break;

			case 'alternative':
			$this->alternative();
			break;

			case 'result':
			$this->result();
			break;

			case 'login':
			$this->login();
			break;

			case 'processLogin':
			$username = $_POST['un'];
			$password = $_POST['pw'];
			$this->processLogin($username, $password);
			break;

			case 'processLogout':
			$this->processLogout();
			break;

			case 'signup':
			$this->signup();
			break;

			case 'checkUsername':
			$username = $_GET['username'];
			$this->checkUsername($username);
			break;

			case 'addcartUI':
			session_start();
			$pid = $_GET['pid'];
			$uid = $_SESSION['id'];
			$this->getCartNum($pid, $uid);
			break;

			case 'cart':
			$this->cart();
			break;

			// redirect to home page if all else fails
			default:
			header('Location: '.BASE_URL);
			exit();

		}

	}

	function debug_to_console( $data ) {

		if ( is_array( $data ) )
		$output = "<script>console.log( 'Debug Objects: " . implode( ',', $data) . "' );</script>";
		else
		$output = "<script>console.log( 'Debug Objects: " . $data . "' );</script>";

		echo $output;
	}

	public function home() {
		$pageName = 'Home';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function sell() {
		$pageName = 'Sell';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/sell.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function detail() {
		$pageName = 'Detail';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/detail.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function alternative() {
		$pageName = 'Your Selling Items';
		include_once SYSTEM_PATH.'/view/alt_header.tpl';
		include_once SYSTEM_PATH.'/view/alternative.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function result() {
		$pageName = 'Result';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/result.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function login() {
		$pageName = 'Login';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/login.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function signup() {
		$pageName = 'Sign Up';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/signup.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function cart() {
		$pageName = 'Cart';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/cart.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function checkUsername($username) {
		$user = User::loadByUsername($username);
		if($user == null) {
			// user doesn't exist; username is available
			$json = array( 'status' => 'available' );
		} else {
			// username not available
			$json = array( 'status' => 'unavailable' );
		}

		header('Content-Type: application/json');
		echo json_encode($json);
	}

	public function processLogin($u, $p) {
		$conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);
		$q = "SELECT * FROM user WHERE username = '$u'; ";
		$result = mysql_query($q);
		if (!$result) {
			die("Account does not exist.");
			exit();
		}
		else {
			$adminUsername = '';
			$adminPassword = '';
			$id = 0;
			while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
				$adminUsername = $row["username"];
				$adminPassword = $row["password"];
				$id = $row["id"];
			}

			if(($u == $adminUsername) && ($p == $adminPassword)) {
				session_start();
				$_SESSION['cart'] = 0;
				$q = "SELECT * FROM cart WHERE user_id = '$id'; ";
				$cart = mysql_query($q);
				while ($row = mysql_fetch_array($cart, MYSQL_ASSOC)) {
					$_SESSION['cart'] = $_SESSION['cart'] + $row["count"];
				}
				$_SESSION['user'] = $u;
				$_SESSION['id'] = $id;
				header('Location: '.BASE_URL);
				exit();
			} else {
				die("Account does not exist.");
				exit();
			}
		}
	}

	public function processLogout() {
		session_start();
		session_unset();
		header('Location: '.BASE_URL);
		exit();
	}

	public function getCartNum($pid, $uid) {
		$cart = Cart::loadByPIDUID($pid, $uid);
		if($cart == null) {

			$json = array( 'count' => 0 );
		} else {

			$json = array( 'count' => $cart->get('count') );
		}

		header('Content-Type: application/json');
		echo json_encode($json);
	}

}
