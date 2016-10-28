<link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/cartSheet.css">
<div id="sidebar">
  <h2> Subtotal (<?= $cart_count ?> item):</h2> <h2 class="cart-price">$<?= $subtotal ?></h2>
  <?php
  if ($result != null): ?>
  <a href="<?= BASE_URL ?>/checkout"><button id="checkout-button">Proceed to checkout</button></a>
  <?php endif; ?>
</div>

<div id="list">
  <?php
  if ($result == null): ?>
  <h2>You don't have any item in your cart.</h2>
  <?php else: ?>
  <?php
  while($row = mysql_fetch_assoc($result)): ?>
  <?php
  $product = Product::loadById($row["product_id"]);
  ?>
  <div class="cart-list">
    <div class="cart-image">
      <a href="<?= BASE_URL ?>/detail/view/<?= $product->get('id') ?>">
        <img src="<?= BASE_URL ?>/public/img/<?= $product->get('img_url') ?>" width="300" height="200" alt="<?= $product->get('title') ?>">
        <!-- Source: www.amazon.com -->
      </a>
    </div>
    <div class="cart-text">
    <div class="cart-title"><a href="<?= BASE_URL ?>/detail/view/<?= $product->get('id') ?>"><?= $product->get('title') ?></a></div>
    <div class="quantity">Quantity: <?= $row['count']?></div>
    <div class="cart-price small-price">$<?= $product->get('price') * $row['count']?></div>
    <div class="quantity">You added this item at: <?= date("m-j-y g:i a", strtotime($row['date_added'])) ?></div>
    <div class="cart-desc">
      <form action="<?= BASE_URL ?>/remove/<?= $product->get('id') ?>" method="POST">
        <button class="remove" type="submit" onclick="return confirm('Are you sure you want to remove this item from your cart?');" >Remove</button></form>
      </div>
    </div>
  </div>
<?php endwhile; ?>
<?php endif; ?>


</div>
