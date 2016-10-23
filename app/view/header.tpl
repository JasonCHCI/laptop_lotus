<!DOCTYPE html>
<html lang="en"><head>
  <meta charset="utf-8">
  <meta name="Description" content="The home page of the home of the laptop.">
  <title>The Home of Laptop | <?= $pageName ?></title>

  <style type="text/css">


  </style>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/mainStyle.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/listSheet.css">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript">
  var baseURL = '<?= BASE_URL ?>';
  </script>
  <script src="<?= BASE_URL ?>/public/js/animation.js"></script>
  <?php if($pageName == 'Sign Up' || $pageName == 'Profile'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/signup.js"></script>
  <?php endif; ?>
  <?php if($pageName == 'Sell'): ?>
    <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/sellSheet.css">
  <?php endif; ?>
  <?php if($pageName == 'Login'): ?>
    <script type="text/javascript" src="<?= BASE_URL ?>/public/js/login.js"></script>
  <?php endif; ?>

</head>

<body>
  <!-- The header of the website-->
  <div id="header" style="background-image: url(public/img/header.jpg)">

    <h1 id="title">The Home of Laptop</h1>
    <h2 id="slogan">The best laptops for the best of you</h2>
    <ul id="primary-nav">

      <?php

      session_start();
      if(isset($_SESSION['user'])) {

        echo '<div class="dropdown"><li class="has-drop"><a href="'.BASE_URL.'/profile/'.$_SESSION['id'].'">Welcome '.$_SESSION['user'].'</a></li>
          <div class="drop-down">
            <form id="logout" action="<?= BASE_URL ?>/logout/process">
              <a href="'.BASE_URL.'/logout/process" class="drop-content">Sign Out</a>
            </form>
            <a href="#" class="drop-content">Your Orders</a>
            <a href="#" class="drop-content">Tracking</a>
            <a href="#" class="drop-content">Your Membership</a>
            <a href="#" class="drop-content">Your Lists</a>
            <a href="#" class="drop-content">Your Gift Cards</a>
            <a href="#" class="drop-content">Your Profile</a>
            <a href="#" class="drop-content">Change Location</a>
            <a href="#" class="drop-content">Your Service Requests</a>
            <a href="#" class="drop-content">Your History</a>
          </div>
        </div>';
      }
      else {
        echo '<li><a href="'.BASE_URL.'/login">Log in</a></li>';
      }

      ?>
      <li><a href="<?= BASE_URL ?>/home">Home</a></li>
      <li><a href="<?= BASE_URL ?>/result">Popular</a></li>
      <div class="dropdown"><li class="unimplemented has-drop"><a href="">Wish List</a></li>
        <div class="drop-down">
          <a href="#" class="drop-content">0 Item</a>
          <a href="#" class="drop-content">Trash Bin</a>
        </div>
      </div>
      <?php

      if(isset($_SESSION['user'])) { echo
        '<div class="dropdown"><li class="unimplemented has-drop"><a href="">Cart('.$_SESSION['cart'].')</a></li>
          <div class="drop-down">
            <a href="#" class="drop-content">Checkout</a>
          </div>
        </div>';
      }
      ?>
      <div class="dropdown"><li class="unimplemented has-drop"><a href="">Find a Specialist</a></li>
        <div class="drop-down">
          <a href="#" class="drop-content">Laptop Specialist</a>
          <a href="#" class="drop-content">Accessories Specialist</a>
          <a href="#" class="drop-content">Service Specialist</a>
        </div>
      </div>
      <?php
      if(isset($_SESSION['user']))
      { echo
        '<li><a href="'.BASE_URL.'/sell">Sell</a></li>';}
        ?>
      </ul>

      <div id="search">
        <input id="box" type="text" value="Search products"/> <button id="go">Search</button>
      </div>

    </div>
