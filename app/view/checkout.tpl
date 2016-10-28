<div id="list">
  <h2>Enter Your Shipping Information:</h2>

  <form id="edit-product" action="<?= BASE_URL ?>/checkout/process" method="POST">

    <label>First Name: <input type="text" name="firstName" value=""></label>

    <label>Last Name: <input type="text" name="lastName" value=""></label>

    <label>Shipping Address: <input type="text" name="address" value=""></label>

    <label>City: <input type="text" name="city" value=""></label>

    <label>State: <input type="text" name="state" value=""></label>

    <label>Country: <input type="text" name="country" value=""></label>

    <label>Zip Code: <input type="text" name="zip" value=""></label>

    <label>Phone Number: <input type="text" name="phone"></label>

    <label>Credit Card Number: <input type="text" name="creditcard" value=""></label>

    <label>CVV: <input type="text" name="cvv" value=""></label>

    <label>Expiration Date: <input type="text" name="expiration"></label>


    <input type="submit" name="submit" value="Checkout">

  </form>

</div>
