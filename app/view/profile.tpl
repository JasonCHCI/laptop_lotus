<div id = "content">
<div id = "friend-search">
  <h2>Search Your Friends by Username</h2>
  <form action="<?= BASE_URL ?>/search-post" method="POST">
			<input id="friend-box" type="text" name="username" required/></label>
			<button id = "go">Search</button>
		</form>
</div>
<div id = "profile">
<table id = "searchList">
     <?php
     $foo = false;
	   $conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		 or die ('Error: Could not connect to MySql database');
	   mysql_select_db(DB_DATABASE);
	    $last_ID = mysql_fetch_assoc(mysql_query('SELECT MAX(id) FROM user'))['MAX(id)'];
		  for($i = 1; $i <= $last_ID; $i++)
		  {
			     $q = sprintf("SELECT * FROM user WHERE id = %d", $i);
			     $result = mysql_query($q);
			     $row = mysql_fetch_assoc($result);
			     if (strpos($row['username'], $username) !== false) {
             $foo = true;
             $user = User::loadByUsername($row['username']);
             $ID = $user->get('id');
             $name = $user->get('username');
             $link = "<?= BASE_URL ?>/";

			?>

              <tr>
                <td><a href= "<?= BASE_URL ?>/profile/<?php echo $ID ?>"><?php echo $name ?></a></td>
              </tr>

	 		     <?php
		       }
		 }
     if($foo == false){
        ?>
    	<script type='text/javascript'>alert("The user you want to search does not exist")</script>
       <?php
     }
	?>
</table>
</div>
</div>
