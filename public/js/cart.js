$(document).ready(function(){

  $('.addcart').click(function(){
    var username = $(this).val();
    $.get(
      baseURL+'/addcart/ui',
      { 'username': username  },
      function(data){

        if(data.status == 'available' && $('#username').val() != '') {
          $('#username').addClass('available').removeClass('unavailable');
        } else if(data.status == 'unavailable') {
          $('#username').addClass('unavailable').removeClass('available');
        }


      },
      "json"
    );
  });

});
