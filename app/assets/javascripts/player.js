$(document).on("page:change", function(){

  SC.initialize({
    client_id: "90bd68b0531687cfd7e24ede5bb5c013",
  });

  $(".track_title").attr("id")

  SC.stream("/tracks/", function(sound){
    sound.play();
  });

  $("queue_container")

});

// get id