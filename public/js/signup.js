$(document).ready(function(){

  $('#username').blur(function(){
    var username = $(this).val();
    $.get(
      baseURL+'/signup/check',
      { 'username': username  },
      function(data){
        if(data.status == 'available' && $('#username').val() != '') {
          $('#username').addClass('available').removeClass('unavailable');
          $('#u_hint').hide();
        } else if(data.status == 'unavailable') {
          $('#username').addClass('unavailable').removeClass('available');
          $('#u_hint').show();
        }
      },
      "json"
    );
  });

  $('form input').keyup(function() {

    var empty = false;
    $('form input').each(function() {
      if ($(this).hasClass("unavailable") || $(this).val() == '') {
        empty = true;
      }
    });

    if (empty) {
      $('#create').attr('disabled', 'disabled');
    } else {
      $('#create').removeAttr('disabled');
    }
  });

  $('#confirmpw').blur(function(){
    var confirmpw = $(this).val();
    var originpw = $('#originpw').val();

    if (originpw == '') {
      $('#originpw').addClass('unavailable').removeClass('available');
      $('#p_hint').hide();
    }
    else if (originpw == confirmpw && originpw != '') {
      $('#confirmpw').addClass('available').removeClass('unavailable');
      $('#originpw').addClass('available').removeClass('unavailable');
      $('#p_hint').hide();
    } else {
      $('#confirmpw').addClass('unavailable').removeClass('available');
      $('#p_hint').show();
    }
  });

  $('#originpw').blur(function(){
    var originpw = $(this).val();
    var confirmpw = $('#confirmpw').val();

    if (originpw == '') {
      $('#originpw').addClass('unavailable').removeClass('available');
      $('#p_hint').hide();
    }
    else if (originpw == confirmpw && originpw != '') {
      $('#confirmpw').addClass('available').removeClass('unavailable');
      $('#originpw').addClass('available').removeClass('unavailable');
      $('#p_hint').hide();
    } else {
      $('#confirmpw').addClass('unavailable').removeClass('available');
      $('#p_hint').show();
    }
  });

});
