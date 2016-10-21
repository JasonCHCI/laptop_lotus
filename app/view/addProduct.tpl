<div id="sidebar">

</div>

<div id="list">
  <h2>Enter Your Product Information Below:</h2>

  <form id="edit-product" action="<?= BASE_URL ?>/add/process" method="POST">

    <label class="edit-l">Title: <input type="text" name="title" value=""></label>

    <label class="edit-l">Brand: <input type="text" name="brand" value=""></label>

    <label class="edit-l">Screen Size: <input type="text" name="size" value=""></label>

    <label class="edit-l">CPU Speed: <input type="text" name="speed" value=""></label>

    <label class="edit-l">Hard Drive Types: <input type="text" name="hard_drive" value=""></label>

    <label class="edit-l">Weight: <input type="text" name="weight" value=""></label>

    <label class="edit-l">Price ($): <input type="text" name="price" value=""></label>

    <label class="edit-l">Price Range: <input type="text" name="price_range" value=""></label>

    <label class="edit-l">Basic Description: <textarea name="basic_description"></textarea></label>

    <label class="edit-l">Basic Description: <textarea name="secondary_desc"></textarea></label>

    <label class="edit-l">Image URL: <input type="text" name="img_url" value=""></label>

    <input type="submit" name="submit" value="Upload">

  </form>

</div>
