<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/detailSheet.css">

<div id="galary">
	<div>
		<div class="detail-label" id="detail-title"><?= $p->get('title') ?></div>
		<div class="detail-label" id="detail-price">Starting at: $<?= $p->get('price') ?></div>
	</div>

	<div class="detail-pic zoom-effect">
		<div class="zoom">
			<img id="large-picture" src="<?= BASE_URL.'/public/img/'.$p->get('img_url') ?>" alt="large sale">
		</div>
	</div>
	<div id="mini">
		<div class="detail-pic">
			<div class="small">
				<img id="detail1" class="default" onclick="change('detail1', '<?= BASE_URL.'/public/img/'.$p->get('img_url') ?>')" src="<?= BASE_URL.'/public/img/'.$p->get('img_url') ?>" alt="small sale">
				<!-- Source: http://shop.lenovo.com/us/en/yoga-book?ipromoID=LEN748504 -->
			</div>
		</div>

		<div class="detail-pic">
			<div class="small">
				<img id="detail2" onclick="change('detail2', '<?= BASE_URL ?>/public/img/detail2.jpg')" src="<?= BASE_URL ?>/public/img/detail2.jpg" alt="small sale">
				<!-- Source: http://shop.lenovo.com/us/en/yoga-book?ipromoID=LEN748504 -->
			</div>
		</div>

		<div class="detail-pic">
			<div class="small">
				<img id="detail3" onclick="change('detail3', '<?= BASE_URL ?>/public/img/detail3.jpg')" src="<?= BASE_URL ?>/public/img/detail3.jpg" alt="small sale">
				<!-- Source: http://shop.lenovo.com/us/en/yoga-book?ipromoID=LEN748504 -->
			</div>
		</div>

		<div class="detail-pic">
			<div class="small">
				<img id="detail4" onclick="change('detail4', '<?= BASE_URL ?>/public/img/detail4.jpg')" src="<?= BASE_URL ?>/public/img/detail4.jpg" alt="small sale">
				<!-- Source: http://shop.lenovo.com/us/en/yoga-book?ipromoID=LEN748504 -->
			</div>
		</div>

		<div class="detail-pic">
			<div class="small">
				<img id="detail5" onclick="change('detail5', '<?= BASE_URL ?>/public/img/detail5.jpg')" src="<?= BASE_URL ?>/public/img/detail5.jpg" alt="small sale">
				<!-- Source: http://shop.lenovo.com/us/en/yoga-book?ipromoID=LEN748504 -->
			</div>
		</div>

		<div class="detail-pic">
			<div class="small">
				<img id="detail6" onclick="change('detail6', '<?= BASE_URL ?>/public/img/detail6.jpg')" src="<?= BASE_URL ?>/public/img/detail6.jpg" alt="small sale">
				<!-- Source: http://shop.lenovo.com/us/en/yoga-book?ipromoID=LEN748504 -->
			</div>
		</div></div>

		<?php
		if(isset($_SESSION['user'])) {
			echo '<div class="actions">
				<form action="'.BASE_URL.'/edit/'.$p->get('id').'" method="POST">
					<button class="bot" type="submit">Edit</button>
				</form><form action="'.BASE_URL.'/delete/'.$p->get('id').'" method="POST">
					<button class="bot" type="submit" onclick="return confirm(\'Are you sure you want to delete this item?\');" >Delete</button></form>
					<button class="bot">Add to Cart</button>
				</div>';
			}
			?>

		</div>


		<div id="content">
			<!-- Source: http://shop.lenovo.com/us/en/yoga-book?ipromoID=LEN748504 -->
			<h2>Weight: <?= $p->get('weight') ?></h2>
			<h2>Hard Drive: <?= $p->get('hard_drive') ?></h2>
			<h2>Display Size: <?= $p->get('size') ?></h2>
			<h1 class="subtitle">Main Highlights</h1>
			<p class="detail-desc"><?= $p->get('basic_description') ?></p>
			<h1 class="subtitle">Additional Attractions</h1>
			<p class="detail-desc"><?= $p->get('secondary_desc') ?></p>
			<h1 class="subtitle">Work or Play</h1>
			<p class="detail-desc">The QHD+ display with In-Plane Switching (IPS) technology allows for vivid colors and looks great from any angle. Into marathons? Enjoy movies or TV shows from your favorite streaming service. Working from home? Take productivity to the next level with an improved keyboard and dedicated function row and enjoy web conferences or online video chats like you’re really there with the integrated webcam.</p>
			<h1 class="subtitle">Accelerate Productivity</h1>
			<p class="detail-desc">Multitasking is no problem with this device. It can support up to 16GB of memory to make sure all your applications keep up with you. Build images, edit video, or run other graphic intensive programs with the optional Intel® Iris™ graphics card. It renders graphics more efficiently-separately from the CPU- giving you a more visually remarkable, more fluid and more enjoyable experience.</p>

			<div id="selection">
				<h2 class="selection-title">Choose Your Color:</h2>
				<div class="choice"><div id="silver" class="choice1 default" ><span>Platinum Silver <br />No Extra Price</span></div></div>
				<div class="choice"><div id="orange" class="choice2" ><span>Clementine Orange<br />No Extra Price</span></div></div>
				<h2 class="selection-title">Choose Your Hard Drive:</h2>
				<div class="choice"><div id="256G" class="choice1 default" ><span>256GB PCIe SSD<br />No Extra Price</span></div></div>
				<div class="choice"><div id="512G" class="choice2" ><span>512GB PCIe SSD<br /> $150.00</span></div></div>
				<h2 class="selection-title">Choose Your Memory:</h2>
				<div class="choice"><div id="G8" class="choice1 default" ><span>8.0GB LPDDR3 1866 Mhz<br />No Extra Price</span></div></div>
				<div class="choice"><div id="G16" class="choice2" ><span>16.0GB LPDDR3 1866 Mhz<br /> $99.99</span></div></div>
			</div>


		</div>
