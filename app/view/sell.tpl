
<h2>Your Current Items:</h2>
<div id="tab">
	<table>
		<tr class="header">
			<th>Item</th>
			<th>ID</th>
			<th>Status</th>
			<th>Action</th>
			<th>List View</th>
		</tr>
		<?php
		while($row = mysql_fetch_assoc($result)): ?>
		<tr
		<?php if($row['id'] % 2 != 0) {echo "class='even'";}?>
		>
		<td><?= $row['title'] ?></td>
		<td><?= $row['id'] ?></td>
		<td>Active</td>
		<td><a href="<?= BASE_URL ?>/detail/view/<?= $row['id'] ?>">View</a></td>
		<td><a href="<?= BASE_URL ?>/alternative">List</a></td>
	</tr>
<?php endwhile; ?>
</table>

</div>
<div id="adddiv">
	<form action="<?= BASE_URL ?>/add/" method="POST">
		<button id="add" type="submit">Add</button>
	</form>
</div>
