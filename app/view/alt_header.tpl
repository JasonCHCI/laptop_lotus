<!DOCTYPE html>
<html lang="en"><head>
  <meta charset="utf-8">
  <meta name="Description" content="Search Result - Lenovo">
  <title>The Home of Laptop</title>

  <style type="text/css">


  </style>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/mainStyle.css">
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/alternative.css">
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.0.min.js"></script>
  <script type="text/javascript">
		var baseURL = '<?= BASE_URL ?>';
	</script>
  <script src="<?= BASE_URL ?>/public/js/animation.js"></script>

</head>

<body>
  <div id="header" style="background-image: url(<?= BASE_URL ?>/public/img/header.jpg)">
    <!-- The header of the website-->
    <?php

    session_start();
    $id = $_SESSION['id'];
    ?>
    <h1 id="title">The Home of Laptop</h1>
    <h2 id="slogan">The best laptops for the best of you</h2>
    <ul id="primary-nav">
      <li><a href="<?= BASE_URL ?>/home">Home</a></li>
      <div class="dropdown"><li class="has-drop"><a href="<?= BASE_URL ?>/profile/<?= $id ?>">Your Account</a></li>
        <div class="drop-down">
          <a href="<?= BASE_URL ?>/logout/process" class="drop-content">Sign Out</a>
          <a href="#" class="drop-content">Tracking</a>
          <a href="#" class="drop-content">Your Membership</a>
          <a href="#" class="drop-content">Your Lists</a>
          <a href="#" class="drop-content">Your Carriers</a>
          <a href="profile/" class="drop-content">Your Profile</a>
          <a href="#" class="drop-content">Change Location</a>
          <a href="#" class="drop-content">Your Service Requests</a>
          <a href="#" class="drop-content">Your History</a>
        </div>
      </div>
      <div class="dropdown"><li class="unimplemented has-drop"><a href="">Your Items</a></li>
        <div class="drop-down">
          <a href="#" class="drop-content">Laptops</a>
          <a href="#" class="drop-content">Accessories</a>
        </div>
      </div>
    </ul>

    <div id="search">
      <input id="box" type="text" value="Your Items" /> <button id="go">Search</button>
    </div>

  </div>
