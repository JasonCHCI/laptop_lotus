
<div id="sidebar">

</div>

<div id="list">

<h2>Sign Up</h2>

<form id="signup" action="<?= BASE_URL ?>/signup/process" method="POST">

  <label class="required">Username: </br><input id="username" type="text" name="username"><i class="hint" id="u_hint">  Username has been used :(</i></label></br>
  <label class="required">Password: </br><input  id="originpw" type="password" name="pw"></label></br>
  <label class="required">Confirm Password: </br><input id="confirmpw" type="password" name="confirmpw"></label><i class="hint" id="p_hint">  Confirm password does not match.</i></br>
  <label class="required">Email address: </br><input type="text" name="email"></label></br>
  <label class="required">First name: </br><input type="text" name="fname"></label></br>
  <label class="required">Last name: </br><input type="text" name="lname"></label></br>
  <label class="required">Gender: </br>
    <input type="radio" name="gender" value="NS" checked> Other<br>
    <input type="radio" name="gender" value="M"> Male<br>
    <input type="radio" name="gender" value="F"> Female<br></label></br>

  <input type="submit" id="create" name="submit" value="Create Account" disabled="disabled">

</form>

</div>
