$(document).ready(function(){
  $('form input').keyup(function() {

    var empty = false;
    $('form input').each(function() {
      if ($(this).val() == '') {
        empty = true;
      }
    });

    if (empty) {
      $('#create').attr('disabled', 'disabled');
    } else {
      $('#create').removeAttr('disabled');
    }
  });
});
