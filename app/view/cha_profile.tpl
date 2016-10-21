
<div id="sidebar">

</div>

<div id="list">

  <h2>Update Your Profile</h2>

  <form id="signup" action="<?= BASE_URL ?>/profile/<?= $id ?>/process" method="POST">

    <label>Username: <?= $p->get('username') ?></label>
  </br></br></br>
  <label>New password: <input  id="originpw" type="password" name="pw"></label>
  <label>Confirm new Password: <input id="confirmpw" type="password" name="confirmpw"></label>
  <label>Email address: <input type="text" name="email" value="<?= $p->get('email') ?>"></label>
  <label>First name: <input type="text" name="fname" value="<?= $p->get('first_name') ?>"></label>
  <label>Last name: <input type="text" name="lname" value="<?= $p->get('last_name') ?>"></label>

  <input type="submit" id="create" name="submit" value="Save" disabled="disabled">

</form>

</div>
