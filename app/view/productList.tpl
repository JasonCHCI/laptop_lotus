
<div id="sidebar">

	<h3>Search Filters</h3>

	<h4>Brand</h4>
	<label><input type="checkbox" name="brand" value="Lenovo" checked="checked"/> Lenovo<br /></label>
	<label><input type="checkbox" name="brand" value="Dell" checked="checked"/> Dell<br /></label>
	<label><input type="checkbox" name="brand" value="Apple" checked="checked"/> Apple<br /></label>
	<label><input type="checkbox" name="brand" value="Other" checked="checked"/> Other<br /></label>

	<h4>Display Size</h4>
	<label><input type="checkbox" name="size" value="l11inches"/> 11 Inches & Under<br /></label>
	<label><input type="checkbox" name="size" value="11inches" /> 11 to 12.9 Inches<br /></label>
	<label><input type="checkbox" name="size" value="13inches" /> 13 to 15.9 Inches<br /></label>
	<label><input type="checkbox" name="size" value="16inches" /> 16 Inches & Above<br /></label>

	<h4>CPU Speed</h4>
	<label><input type="checkbox" name="speed" value="1.5ghz"/> 1.5 GHz & Under<br /></label>
	<label><input type="checkbox" name="speed" value="1.6ghz" /> 1.6 to 1.9 GHz<br /></label>
	<label><input type="checkbox" name="speed" value="2ghz" /> 2 to 2.9 GHz<br /></label>
	<label><input type="checkbox" name="speed" value="3ghz" /> 3 GHz & Up<br /></label>

	<h4>Laptop Weight</h4>
	<label><input type="checkbox" name="weight" value="2p"/> 3 Pounds & Under<br /></label>
	<label><input type="checkbox" name="weight" value="3p" /> 3 to 3.9 Pounds<br /></label>
	<label><input type="checkbox" name="weight" value="4p" /> 4 to 4.9 Pounds<br /></label>
	<label><input type="checkbox" name="weight" value="5p" /> 5 to 5.9 Pounds<br /></label>
	<label><input type="checkbox" name="weight" value="6p" /> 6 to 6.9 Pounds<br /></label>
	<label><input type="checkbox" name="weight" value="7p" /> 7 Pounds & Above<br /></label>

	<h4>Price</h4>
	<label><input type="checkbox" name="price" value="p0"/> Under $500<br /></label>
	<label><input type="checkbox" name="price" value="p500" /> $500 to $800<br /></label>
	<label><input type="checkbox" name="price" value="p800" /> $800 to 1000<br /></label>
	<label><input type="checkbox" name="price" value="p1000" /> $1000 & Above<br /></label>

	<h4>Hard Drive Type</h4>
	<label><input type="checkbox" name="hd" value="mhd"/> Mechanical Hard Drive<br /></label>
	<label><input type="checkbox" name="hd" value="ssd" /> Solid State Drive<br /></label>
	<label><input type="checkbox" name="hd" value="h-d" /> Hybrid Drive<br /></label>


</div>

<div id="list">
	<?php if(isset($_SESSION['user'])): ?>

<?php endif; ?>
	<?php
	$conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
	or die ('Error: Could not connect to MySql database');
	mysql_select_db(DB_DATABASE);
	 $last_ID = mysql_fetch_assoc(mysql_query('SELECT MAX(id) FROM product'))['MAX(id)'];
	 for($i = 1; $i <= $last_ID; $i++){
		 $q = sprintf("SELECT * FROM product WHERE id = %d", $i);
		 $result = mysql_query($q);
		 $row = mysql_fetch_assoc($result);
	     if (strpos(strtolower($row['title']), strtolower($title)) !== false) {
		 ?>
	<div class="product
		<?= $row['brand'] ?> <?= $row['price_range'] ?> <?= $row['size'] ?> <?= $row['hard_drive'] ?> <?= $row['speed'] ?> <?= $row['weight'] ?>">
		<div class="img">
			<a target="blank" href="<?= BASE_URL ?>/detail/view/<?= $row['id'] ?>">
				<img src="<?= BASE_URL ?>/public/img/<?= $row['image_url'] ?>" width="300" height="200" alt="<?= $row['title'] ?>">
				<!-- Source: www.amazon.com -->
			</a>
			<div class="desc"><a target="blank" href="<?= BASE_URL ?>/detail/view/<?= $row['id'] ?>"><?= $row['title'] ?></a></div>
			<div class="price">Start From: $<?= $row['price'] ?></div>

			</div>
		</div>
		<?php

 }

 }
 ?>
</div>
