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

			case 'ship':
			$this->ship();
			break;

			case 'processShip':
			$this->processShip();
			break;

			case 'print':
			$this->printLabel();
			break;

			case 'profile':
			$this->profile();
			break;

			case 'userProfile':
			$pid = $_GET['pid'];
			$this->userProfile($pid);
			break;

			case 'followProfile':
			$pid = $_GET['pid'];
			$this->followProfile($pid);
			break;

			case 'unfollow':
			$pid = $_GET['pid'];
			$this->unfollow($pid);
			break;

			// redirect to home page if all else fails
			default:
			header('Location: '.BASE_URL);
			exit();

		}

	}

	function unfollow($pid) {
		session_start();
		$db = Db::instance();

		$uid1 = $_SESSION['id']; // unFollower
		//$pid is the unfollowee



	$q = "SELECT * FROM event WHERE user_id_1 = '$uid1' AND user_id_2 = $pid AND type_id = 1";
	$result = mysql_query($q);

	while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
				$date = $row['date_created'];
			}
	//Delete the follow event
	$k = "DELETE FROM event WHERE user_id_1 = $uid1 AND user_id_2 = $pid AND type_id = 1";
	$db->execute($k);




		$data = array(
			'id' => null,
			'type_id' => 6, //new unfollow event
			'user_id_1' => $_SESSION['id'], //unFollower
			'user_id_2' => $pid, //unfolowee
			'product_id_1' =>  null,
			'product_id_2' => null,
			'new_data' => null,
			'original_data' => null,
			'count' => null,
			'date_created' => null
		);

		$data2 = array(
			'id' => null,
			'type_id' => 7, //new unfollow event
			'user_id_1' => $_SESSION['id'], //unFollower
			'user_id_2' => $pid, //unfolowee
			'product_id_1' =>  null,
			'product_id_2' => null,
			'new_data' => null,
			'original_data' => null,
			'count' => null,
			'date_created' => $date
		);



		$q = $db->buildInsertQuery('event', $data);
		$db->execute($q);
		$k = $db->buildInsertQuery('event', $data2);
		$db->execute($k);



	echo "<script>var baseURL ='".BASE_URL."'</script>";
		echo "<script>var pid ='".$pid."'</script>";
		echo "<script>
		alert('Successfully unfollowed!');
		window.location.href= baseURL + '/profile/' + pid;
		</script>";

	}

	function followProfile($pid) {
		session_start();


		$db = Db::instance();

		$data = array(
			'id' => null,
			'type_id' => 1,
			'user_id_1' => $_SESSION['id'],
			'user_id_2' => $pid,
			'product_id_1' =>  null,
			'product_id_2' => null,
			'new_data' => null,
			'original_data' => null,
			'count' => null,
			'date_created' => null
		);



		$q = $db->buildInsertQuery('event', $data);

		$db->execute($q);


		echo "<script>var baseURL ='".BASE_URL."'</script>";
		echo "<script>var pid ='".$pid."'</script>";
		echo "<script>
		alert('Successfully followed!');
		window.location.href= baseURL + '/profile/' + pid;
		</script>";


	}

	function userProfile($pid) {

		$p = User::loadById($pid);
		$events = Event::getEventsByUserId($pid);

		$pageName = 'profile';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/profile.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function profile() {
		session_start();
		$id = $_SESSION['id'];
		header('Location: '.BASE_URL.'/profile/'.$id);

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

	public function ship() {
		$pageName = 'Ship';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/ship.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function printLabel() {
		echo "<script>var baseURL ='".BASE_URL."'</script>";
		echo "<script>
		alert('Successfully printed!');
		window.location.href= baseURL + '/sell/';
		</script>";
	}

	public function cart() {
		$pageName = 'Cart';
		$db = Db::instance();

		session_start();
		$uid = $_SESSION['id'];
		$cart_count = 0;
		$subtotal = 0;

		$q = "SELECT * FROM cart WHERE user_id = '$uid'; ";
		$current_cart = mysql_query($q);
		while ($row = mysql_fetch_array($current_cart, MYSQL_ASSOC)) {
			$product = Product::loadById($row["product_id"]);
			$cart_count = $cart_count + $row["count"];
			$subtotal = $subtotal + $product->get('price') * $row["count"];
		}

		$result = Cart::getAllProducts($uid);

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
		$db = Db::instance();
		$q = "SELECT * FROM user WHERE username = '$u'; ";
		$result = mysql_query($q);
		if (!$result) {
			die("Incorrect username or password.");
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
				$message ="Incorrect username or password.";
				//pop up the aleat message
				echo "<script type='text/javascript'>alert('$message');</script>";
			}
		}
		$pageName = 'Login';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/login.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
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

	public function processShip() {
		try {
		require_once("../../easypost-php-master/lib/easypost.php");
		\EasyPost\EasyPost::setApiKey('uS1Kq0rS9clNHaRVuaGYHQ');

		$to_address = \EasyPost\Address::create(
			array(
				"name"    => $_POST['toName'],
				"street1" => $_POST['toAddress'],
				"city"    => $_POST['toCity'],
				"state"   => $_POST['toState'],
				"zip"     => $_POST['toZip'],
				"phone"   => $_POST['toPhone']
			)
		);
		$from_address = \EasyPost\Address::create(
			array(
				"company" => $_POST['fromName'],
				"street1" => $_POST['fromAddress1'],
				"street2" => $_POST['fromAddress2'],
				"city"    => $_POST['fromCity'],
				"state"   => $_POST['fromState'],
				"zip"     => $_POST['fromZip'],
				"phone"   => $_POST['fromPhone']
			)
		);
		$parcel = \EasyPost\Parcel::create(
			array(
				"predefined_package" => $_POST['type'],
				"weight" => $_POST['weight']
			)
		);
		$shipment = \EasyPost\Shipment::create(
			array(
				"to_address"   => $to_address,
				"from_address" => $from_address,
				"parcel"       => $parcel
			)
		);
		$current_rate = null;
		foreach ($shipment->rates as $rate) {
			$current_rate = $rate->rate;
		}


		$shipment->buy($shipment->lowest_rate());

		$shipment->insure(array('amount' => 100));

		$label = $shipment->postage_label->label_url;

		$pageName = 'Print Label';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/printLabel.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';


}
		catch (Exception $e) {
			echo "<script>var baseURL ='".BASE_URL."'</script>";
			echo "<script>
			alert('Invalid address, plase confirm your address.');
			window.location.href= baseURL + '/ship/';
			</script>";
    	exit();
}



	}

}
