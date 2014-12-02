$(document).on("page:change", function(){

  SC.initialize({
    client_id: "YOUR_CLIENT_ID",
  });

  SC.stream("/tracks/293", function(sound){
    sound.play();
  });

});