<!DOCTYPE html>
<html lang="en"><head>
  <meta charset="utf-8">
  <meta name="Description" content="The home page of the home of the laptop.">
  <title>Laptop Lotus | <?= $pageName ?></title>

  <style type="text/css">


  </style>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/mainStyle.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/listSheet.css">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript">
  var baseURL = '<?= BASE_URL ?>';
  </script>
  <script src="<?= BASE_URL ?>/public/js/animation.js"></script>
  <?php if($pageName == 'Sign Up' || $pageName == 'Profile' || $pageName == 'Ship' || $pageName == 'Checkout'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/signup.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Sell'): ?>
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/sellSheet.css">
  <?php endif; ?>
  <?php if($pageName == 'Ship' || $pageName == 'Checkout'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/ship.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Login'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/login.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Laptop' || $pageName == 'Detail'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/cart.js"></script>
  <?php endif; ?>
</head>

<body>
  <!-- The header of the website-->
  <div id="header" style="background-image: url(<?= BASE_URL ?>/public/img/header.jpg)">

    <a  href="<?= BASE_URL ?>/home" style="text-decoration:none;"><h1 id="title">Laptop Lotus</h1></a>
    <h2 id="slogan">The best laptops for the best of you</h2>
    <ul id="primary-nav">

      <?php
      if($pageName != 'Cart' && $pageName != 'Profile') {
        session_start();
      }
      if(isset($_SESSION['user'])) {
        echo '<div class="dropdown"><li class="has-drop"><a href="'.BASE_URL.'/profile/'.$_SESSION['id'].'">Welcome '.$_SESSION['user'].'</a></li>
          <div class="drop-down">
            <form id="logout" action="<?= BASE_URL ?>/logout/process">
              <a style="color:red" href="'.BASE_URL.'/logout/process" class="drop-content">Sign Out</a>
            </form>
            <a href="'.BASE_URL.'/profile/'.$_SESSION['id'].'" class="drop-content">Your Profile</a>
            <a href="'.BASE_URL.'/cprofile/'.$_SESSION['id'].'" class="drop-content">Update Profile</a>
            <a href="'.BASE_URL.'/search/'.$_SESSION['id'].'" class="drop-content">Search Friends</a>

			</div>
        </div>';
      }
      else {
        echo '<li><a href="'.BASE_URL.'/login">Log in</a></li>';
      }

      ?>
      <li><a href="<?= BASE_URL ?>/home">Home</a></li>
    <li><a href="<?= BASE_URL ?>/result">Popular</a></li>
    <?php
    if(isset($_SESSION['user']))
    { echo
      '<li><a href="'.BASE_URL.'/sell">Manage</a></li>';}
      ?>
      <?php

      if(isset($_SESSION['user'])) { echo
        '<div class="dropdown"><li class="has-drop"><a href="'.BASE_URL.'/cart">Cart('.$_SESSION['cart'].')</a></li>
          <div class="drop-down">
            <a href="'.BASE_URL.'/cart" class="drop-content">View Cart</a>
            <a href="'.BASE_URL.'/checkout" class="drop-content">Checkout</a>
          </div>
        </div>';
      }
      ?>


      <?php
      if(isset($_SESSION['user']))
      { $id = $_SESSION['id'];
		$user = User::loadByID($id);
		$perm = $user->get('perm');
		if($perm == 1){
			echo
			'<li><a href="'.BASE_URL.'/admin">Admin</a></li>';}
		}
        ?>




      <div id="search">

        <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/search_result.css">

        <form action="<?= BASE_URL ?>/productSearch-post" method="POST">
      			<input id="box" type="text" name="title" value = "Type In The Product Name" required/></label>
      			<button id = "go">Search</button>
      		</form>
      </div>

    </div>
