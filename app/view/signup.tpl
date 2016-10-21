
<div id="sidebar">

</div>

<div id="list">

<h2>Sign Up</h2>

<form id="signup" action="<?= BASE_URL ?>/signup/process" method="POST">

  <label class="required">Username: <input id="username" type="text" name="username"></label>
  <label class="required">Password: <input  id="originpw" type="password" name="pw"></label>
  <label class="required">Confirm Password: <input id="confirmpw" type="password" name="confirmpw"></label>
  <label class="required">Email address: <input type="text" name="email"></label>
  <label class="required">First name: <input type="text" name="fname"></label>
  <label class="required">Last name: <input type="text" name="lname"></label>

  <input type="submit" id="create" name="submit" value="Create Account" disabled="disabled">

</form>

</div>
