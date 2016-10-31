<div id="list">
  <h2>Enter Your From Address Information:</h2>

  <form id="edit-product" action="<?= BASE_URL ?>/ship/process" method="POST">

    <label>Full Name/Company Name: <input type="text" name="fromName" value=""></label>

    <label>Street1: <input type="text" name="fromAddress1" value=""></label>

    <label>Street2: <input type="text" name="fromAddress2" value=""></label>

    <label>City: <input type="text" name="fromCity" value=""></label>

    <label>State: <input type="text" name="fromState" value=""></label>

    <label>Zip Code: <input type="text" name="fromZip" value=""></label>

    <label>Phone Number: (xxx-xxx-xxxx) <input type="text" name="fromPhone"></label>

    <h2>Enter The Recipient Address Information:</h2>

    <label>Recipient Full Name/Company Name: <input type="text" name="toName" value=""></label>

    <label>Recipient Address: <input type="text" name="toAddress" value=""></label>

    <label>City: <input type="text" name="toCity" value=""></label>

    <label>State: <input type="text" name="toState" value=""></label>

    <label>Zip Code: <input type="text" name="toZip" value=""></label>

    <label>Phone Number: (xxx-xxx-xxxx) <input type="text" name="toPhone"></label>

    <h2>Enter The Package Information:</h2>

    <label>Package Type:</br>
      <select name="type">
        <option value="SmallFlatRateBox">Small Flat Rate Box</option>
        <option value="MediumFlatRateBox">Medium Flat Rate Box</option>
        <option value="LargeFlatRateBox">Large Flat Rate Box</option>
        <option value="RegionalRateBoxA">Regional Rate Box A</option>
        <option value="RegionalRateBoxB">Regional Rate Box B</option>
        <option value="LargeFlatRateBoardGameBox">Large Flat Rate Board Game Box</option>
      </select></br>
    </label>

    <label>Weight: (in lb) <input type="text" name="weight" value=""></label>


    <input id="create" type="submit" name="submit" value="Submit" disabled="disabled">

  </form>

</div>
