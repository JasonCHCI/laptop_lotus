
<div id="sidebar">

</div>

<div id="list">

  <h2>Update Your Profile</h2>

  <form id="signup" action="<?= BASE_URL ?>/cprofile/<?= $id ?>/process" method="POST">

    <label>Username: <?= $p->get('username') ?></label>
  </br></br></br>
  <label>New password: </br><input  id="originpw" type="password" name="pw"></label></br>
  <label>Confirm new Password: </br><input id="confirmpw" type="password" name="confirmpw"></label><i class="hint" id="p_hint">  Confirm password does not match.</i></br>
  <label>Email address: </br><input type="text" name="email" value="<?= $p->get('email') ?>"></label></br>
  <label>First name: </br><input type="text" name="fname" value="<?= $p->get('first_name') ?>"></label></br>
  <label>Last name: </br><input type="text" name="lname" value="<?= $p->get('last_name') ?>"></label></br>
  <label class="required">Gender: </br>
    <input type="radio" name="gender" value="NS" <?php if($p->get('gender') == 'NS' ) echo 'checked';?>> Other<br>
    <input type="radio" name="gender" value="M" <?php if($p->get('gender') == 'M' ) echo 'checked';?>> Male<br>
    <input type="radio" name="gender" value="F" <?php if($p->get('gender') == 'S' ) echo 'checked';?>> Female<br></label></br>

  <input type="submit" id="create" name="submit" value="Save" disabled="disabled">

</form>

</div>
