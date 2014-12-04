 $(document).ready(function(){

 $("#room_black_bar").on("mouseover", function() {
      $("#room_black_bar").animate({"padding-top": "-10em"},600);
      $("#room_black_bar").animate({"margin-top": "3em"},600);
    })

  $("#room_black_bar").on("mouseleave", function() {
      $("#room_black_bar").animate({"padding-top": "10em"},600);
      $("#room_black_bar").animate({"margin-top": "17em"},600);
    })

})
