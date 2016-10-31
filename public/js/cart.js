$(document).ready(function(){

  $('.addcart2').click(function(){
    var username = $(this).val();
    $.post(
      baseURL+'/addcart/ui',
      { 'username': username  },
      function(data){

        if(data.status == 'available' && $('#cart11').val() != '') {
          $('#cart11').addClass('available').removeClass('unavailable');
        } else if(data.status == 'unavailable') {
          $('#cart11').addClass('unavailable').removeClass('available');
        }


      },
      "json"
    );
  });

});
