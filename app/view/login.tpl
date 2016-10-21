
<div id="sidebar">

</div>

<div id="list">

<h2>Login</h2>

<form id="login" action="<?= BASE_URL ?>/login/process" method="POST">

  <label>Username: <input type="text" name="un"></label>
  <label>Password: <input type="password" name="pw"></label>
  <input id="slogin" type="submit" name="submit" value="Submit" disabled="disabled">

</form>

<h4><a href="<?= BASE_URL ?>/signup">Or create a new account.</a></h4>

</div>
