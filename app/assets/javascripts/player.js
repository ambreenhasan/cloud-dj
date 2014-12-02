$(document).on("page:change", function(){

  SC.initialize({
    client_id: "90bd68b0531687cfd7e24ede5bb5c013",
  });


  $("#queue_container").on("click", ".track_title", function(){
    var currentItem = $("#queue_container .track_title").attr("id")
    SC.stream("/tracks/" + currentItem, function(sound){
    sound.play();
    });
  })


});


