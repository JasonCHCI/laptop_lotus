<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a ProductController and route it
$pc = new ProductController();
$pc->route($action);

class ProductController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			case 'products':
			$productType = $_GET['ptype'];
			if($productType == 'laptops') {
				$this->laptops();
			}
			else if ($productType == 'sell') {
				$this->sell();
			}
			break;

			case 'viewProduct':
			$productID = $_GET['pid'];
			$this->viewProduct($productID);
			break;

			case 'deleteProduct':
			$productID = $_GET['pid'];
			$this->deleteProduct($productID);
			break;

			case 'product':
			$productID = $_GET['pid'];
			$this->product($productID);
			break;

			case 'editProduct':
			$productID = $_GET['pid'];
			$this->editProduct($productID);
			break;

			case 'editProductProcess':
			$productID = $_GET['pid'];
			$this->editProductProcess($productID);
			break;

			case 'editProfile':
			$profileID = $_GET['pid'];
			$this->editProfile($profileID);
			break;

			case 'editProfileProcess':
			$profileID = $_GET['pid'];
			$this->editProfileProcess($profileID);
			break;

			case 'addProduct':
			$this->addProduct();
			break;

			case 'addProductProcess':
			$this->addProductProcess();
			break;

			case 'processSignup':
			$this->signupProcess();
			break;

			case 'checkout':
			$this->checkout();
			break;

			case 'addcart':
			session_start();
			$pid = $_GET['pid'];
			$uid = $_SESSION['id'];
			$this->updateCart($pid, $uid);
			break;

			// redirect to home page if all else fails
			default:
			header('Location: '.BASE_URL);
			exit();
		}

	}

	public function laptops() {
		$pageName = 'Laptop';

		$result = Product::getAllProducts();

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/result.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function sell() {
		$pageName = 'Sell';

		$result = Product::getAllProducts();

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/sell.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}


	public function editProduct($id) {
		$pageName = 'Edit';

		$p = Product::loadById($id);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/editProduct.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function editProductProcess($id) {
		$p = Product::loadById($id);

		$p->set('title', $_POST['title']);
		$p->set('brand', $_POST['brand']);
		$p->set('weight', $_POST['weight']);
		$p->set('speed',  $_POST['speed']);
		$p->set('hard_drive', $_POST['hard_drive']);
		$p->set('basic_description', $_POST['basic_description']);
		$p->set('secondary_desc', $_POST['secondary_desc']);
		$p->set('price', $_POST['price']);
		$p->set('price_range', $_POST['price_range']);
		$p->set('size', $_POST['size']);
		$p->set('img_url', $_POST['img_url']);
		$p->save();

		session_start();
		$_SESSION['msg'] = "You edited the product called ".$title;
		header('Location: '.BASE_URL.'/result/');
	}

	public function deleteProduct($id) {

		$q = "DELETE FROM product WHERE id = $id ";
		$db = Db::instance();
		$db->execute($q);

		session_start();
		header('Location: '.BASE_URL.'/result/');
	}

	public function viewProduct($id) {
		$pageName = 'Detail';
		$p = Product::loadById($id);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/detail.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function addProduct() {
		$pageName = 'Add';

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/addProduct.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function addProductProcess() {
		$db = Db::instance();

		$data = array(
			'id' => null,
			'title' => $_POST['title'],
			'brand' => $_POST['brand'],
			'weight' => $_POST['weight'],
			'speed' =>  $_POST['speed'],
			'hard_drive' => $_POST['hard_drive'],
			'basic_description' => $_POST['basic_description'],
			'secondary_desc' => $_POST['secondary_desc'],
			'price' => $_POST['price'],
			'price_range' => $_POST['price_range'],
			'size' => $_POST['size'],
			'image_url' => $_POST['img_url'],
		);

		$q = $db->buildInsertQuery('product', $data);
		$db->execute($q);

		session_start();
		$_SESSION['msg'] = "You inserted the product called ".$title;
		header('Location: '.BASE_URL.'/sell/');
	}

	public function signupProcess() {
		$db = Db::instance();
		$u = $_POST['username'];
		$data = array(
			'id' => null,
			'username' => $_POST['username'],
			'password' => $_POST['pw'],
			'email' => $_POST['email'],
			'first_name' =>  $_POST['fname'],
			'last_name' => $_POST['lname'],
		);

		$q = $db->buildInsertQuery('user', $data);
		$db->execute($q);

		$q = "SELECT * FROM user WHERE username = '$u'; ";
		$result = mysql_query($q);
		$adminUsername = '';
		$adminPassword = '';
		$id = 0;
		while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
			$adminUsername = $row["username"];
			$adminPassword = $row["password"];
			$id = $row["id"];
		}

		if ($u == $adminUsername) {
			session_start();
			$_SESSION['user'] = $u;
			$_SESSION['id'] = $id;
			$_SESSION['cart'] = 0;
			header('Location: '.BASE_URL);
			exit();
		}

	}

	public function editProfile($id) {
		$pageName = 'Profile';

		$p = User::loadById($id);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/cha_profile.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function editProfileProcess($id) {
		$p = User::loadById($id);

		$p->set('password', $_POST['pw']);
		$p->set('email', $_POST['email']);
		$p->set('first_name', $_POST['fname']);
		$p->set('last_name',  $_POST['lname']);
		$p->save();

		session_start();
		$_SESSION['msg'] = "You edited the username called ".$title;
		header('Location: '.BASE_URL.'/home/');
	}

	public function updateCart($pid, $uid) {
		$cart = Cart::loadByPIDUID($pid, $uid);
		if($cart == null) {

			$db = Db::instance();
			$data = array(
				'product_id' => $pid,
				'user_id' => $uid,
				'count' => 1,
			);

			$q = $db->buildInsertQuery('cart', $data);
			$db->execute($q);
		} else {
			$cart->set('user_id', $uid);
			$cart->set('product_id', $pid);
			$cart->set('count', $cart->get('count') + 1);
			$cart->save();
		}
		$_SESSION['cart'] = $_SESSION['cart'] + 1;

		echo "<script>
		var baseURL = 'http://localhost/laptop_lotus';
		alert('Product added to your cart!');
		window.location.href= baseURL + '/result/';
		</script>";
	}


}
