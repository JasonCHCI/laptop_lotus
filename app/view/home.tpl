<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/homeSheet.css">
<div id="main-page">

	<div id="quick-memu">
		<h2 id="quick">Quick Access</h2>
		<ul id="quick-access">
			<li><a href="<?= BASE_URL ?>/result">Recently Viewed</a></li>

			<li><a href="<?= BASE_URL ?>/result">Today's Deals</a></li>
			<li><a href="<?= BASE_URL ?>/result">New Arrivals</a></li>

			<li><a href="<?= BASE_URL ?>/sell">Sell</a></li>
		</ul>
	</div>
	<div id="ads">
		<div id="box1"><img class="image arrow a1" src="<?= BASE_URL ?>/public/img/larrow.gif" alt="previous" onclick="pre()"></div>
		<div id="box2"><a id="homelink" href="<?= BASE_URL ?>/detail/view/1"><img class="image" id="main-picture" src="<?= BASE_URL ?>/public/img/home.jpg" alt="main-pic"></a></div>
		<!-- Source: http://shop.lenovo.com/us/en/yoga-book?ipromoID=LEN748504 -->
		<div id="box3"><img class="image arrow a2" src="<?= BASE_URL ?>/public/img/rarrow.gif" alt="next" onclick="next()"></div>
	</div>
	
	<div id = twitter>
		<a class="twitter-timeline" data-width="250" href="https://twitter.com/laptop_lotus">Tweets by laptop_lotus</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
	</div>
</div>
<?php
if(isset($_SESSION['user'])): ?>
<div id="activity">
	<h3>Activity Feed: </h3>
	<ul>
		<?php
		$p = User::loadById($_SESSION['id']);
		$events = Event::getEventsByUserId($_SESSION['id']);
		foreach($events as $value) {
			$time = $value->get('date_created');
			if ($value->get('type_id') == 1 ||  $value->get('type_id') == 7) { //Follow event
				$followerID = $value->get('user_id_1');
				$follower = User::loadByID($followerID)->get('username');
				$followeeID = $value->get('user_id_2');
				$followee = User::loadByID($followeeID)->get('username');

				echo '<li><a href="'.BASE_URL.'/profile/'.$followerID.'">'.$follower.'</a> followed <a href="'.BASE_URL.'/profile/'.$followeeID.'">'.$followee.'</a> on '.$time.'.</li>';
			}

			if ($value->get('type_id') == 2) { //edit product event
				$productID = $value->get('product_id_1'); //ID of the product edited
				$productName = Product::loadByID($productID)->get('title'); //Gets product name
				$user1ID = $value->get('user_id_1'); //Current profile

				$user1Name = User::loadByID($user1ID)->get('username'); //Current profile Name

				echo '<li><a href="'.BASE_URL.'/profile/'.$user1ID.'">'.$user1Name.'</a> edited <a href="'.BASE_URL.'/detail/view/'.$productID.'">'.$productName.'</a> on '.$time.'.</li>';

			}

			if ($value->get('type_id') == 3) { //add product event
				$productID = $value->get('product_id_1'); //ID of the product edited
				$productName = Product::loadByID($productID)->get('title'); //Gets product name
				$user1ID = $value->get('user_id_1'); //Current profile

				$user1Name = User::loadByID($user1ID)->get('username'); //Current profile Name

				echo '<li><a href="'.BASE_URL.'/profile/'.$user1ID.'">'.$user1Name.'</a> added a new product: <a href="'.BASE_URL.'/detail/view/'.$productID.'">'.$productName.'</a> on '.$time.'.</li>';
			}

			if ($value->get('type_id') == 4) { //checkout event
				$user1ID = $value->get('user_id_1'); //Current profile
				$user1Name = User::loadByID($user1ID)->get('username'); //Current profile Name
				$count = $value->get('count');

				echo '<li><a href="'.BASE_URL.'/profile/'.$user1ID.'">'.$user1Name.'</a> ordered '.$count.' item(s). on '.$time.'.</li>';
			}

			if ($value->get('type_id') == 5) { //delete product event

				$user1ID = $value->get('user_id_1'); //Current profile

				$user1Name = User::loadByID($user1ID)->get('username'); //Current profile Name

				echo '<li><a href="'.BASE_URL.'/profile/'.$user1ID.'">'.$user1Name.'</a> deleted a product.</li>';
			}

			if ($value->get('type_id') == 6) { //UnFollow event
				$unfollowerID = $value->get('user_id_1');
				$unfollower = User::loadByID($unfollowerID)->get('username');
				$unfolloweeID = $value->get('user_id_2');
				$unfollowee = User::loadByID($unfolloweeID)->get('username');


				echo '<li><a href="'.BASE_URL.'/profile/'.$unfollowerID.'">'.$unfollower.'</a> unfollowed <a href="'.BASE_URL.'/profile/'.$unfolloweeID.'">'.$unfollowee.'</a> on '.$time.'.</li>';
			}

		}
		?>

	</ul>
</div>
<?php endif; ?>
