
<div id="sidebar">

</div>

<div id="list">
<h2>Edit Product</h2>

<form id="edit-product" action="<?= BASE_URL ?>/edit/<?= $id ?>/process" method="POST">

<label class="edit-l">Title: <input type="text" name="title" value="<?= $p->get('title') ?>"></label>

<label class="edit-l">Brand: <input type="text" name="brand" value="<?= $p->get('brand') ?>"></label>

<label class="edit-l">Screen Size: <input type="text" name="size" value="<?= $p->get('size') ?>"></label>

<label class="edit-l">CPU Speed: <input type="text" name="speed" value="<?= $p->get('speed') ?>"></label>

<label class="edit-l">Hard Drive Types: <input type="text" name="hard_drive" value="<?= $p->get('hard_drive') ?>"></label>

<label class="edit-l">Weight: <input type="text" name="weight" value="<?= $p->get('weight') ?>"></label>

<label class="edit-l">Price ($): <input type="text" name="price" value="<?= $p->get('price') ?>"></label>

<label class="edit-l">Price Range: <input type="text" name="price_range" value="<?= $p->get('price_range') ?>"></label>

<label class="edit-l">Basic Description: <textarea name="basic_description"><?= $p->get('basic_description') ?></textarea></label>

<label class="edit-l">Basic Description: <textarea name="secondary_desc"><?= $p->get('secondary_desc') ?></textarea></label>

<label class="edit-l">Image URL: <input type="text" name="img_url" value="<?= $p->get('img_url') ?>"></label>

<input type="submit" name="submit" value="Save Changes">

</form>

</div>
