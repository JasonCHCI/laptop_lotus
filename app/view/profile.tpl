<div id="list">

 <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/profileSheet.css">

<div id="top">
<h2>Profile for <?= $p->get('username') ?></h2>
</div>
	<div id ="info">
		<b>Full Name:    </b><a><?= $p->get('first_name') ?>  <a><?= $p->get('last_name') ?></a></br>
		<b>Email:    </b><a><?= $p->get('email') ?>  </a></br>
		<b>Gender: </b><a><?= User::genderToString($p->get('gender')) ?></a>
	</div>

	<div id ="Edit">
	<ul>
	<?php
	if(isset($_SESSION['user'])) {
		$id = $_SESSION['id'];
		$pid = $p->get('id');
		if($id == $pid){
			echo '<div><form class="act-but1" action="'.BASE_URL.'/cprofile/'.$id.'" method="POST">
							<button class="bot bot2" type="submit">Edit Profile</button>
						</form></div></br>';
		}
	}
	?>
	</ul>
	</div>

	<div id="followers">
	<h3>Followers:</h3>
	<ul>
		<?php
		$db = Db::instance();



      $query = sprintf("SELECT * FROM `%s` WHERE user_id_2 = %d ORDER BY date_created DESC ",
        'event',
        $pid
        );

      $result = $db->lookup($query);

      $objects = array();
      while($row = mysql_fetch_assoc($result)) {
          $objects[] = Event::loadById($row['id']);
      }

      foreach($objects as $value) {
      	if ($value->get('type_id') == 1) { //check for follow event
      		$followerID = $value->get('user_id_1');
      		$followerName = User::loadById($followerID)->get('username');

      		echo '<li><a href="'.BASE_URL.'/profile/'.$followerID.'">'.$followerName.'</a></li>';
      	}
      }



			?>

	</ul>
</div>

<div id="activity">
	<h3>Activity Feed: </h3>
	<ul>
		<?php
			foreach($events as $value) {
			$time = $value->get('date_created');
			if ($value->get('type_id') == 1) { //Follow event
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



		}



		?>

	</ul>
</div>

<?php
if(isset($_SESSION['id'])) {

echo '<form id="follow" action="'.BASE_URL.'/profile/'.$pid.'/process" method="POST">';
echo '<button>Follow User</button>';
echo '</form>';
}

?>
</div>
