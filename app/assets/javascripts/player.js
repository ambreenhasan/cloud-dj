$(document).on("page:change", function(){

  SC.initialize({
    client_id: "90bd68b0531687cfd7e24ede5bb5c013",
  });

  $("#queue_container").on("click", ".track_title", function(){
    var currentItem = $("#queue_container .track_title").attr("id")
    SC.get("/tracks/" + currentItem, function(track){
      var waveform = new Waveform({
      container: document.getElementById(track.id),
      innerColor: "#333",
      interpolate: false
  });
    var data = [];

    var ctx = waveform.context;

    var gradient = ctx.createLinearGradient(0, 0, 0, waveform.height);
    gradient.addColorStop(0.0, "#f60");
    gradient.addColorStop(1.0, "#ff1b00");
    waveform.innerColor = gradient;

    var i=0;
    setInterval(function(){
      data.push(Math.cos(i++/25) - 0.2 + Math.random()*0.3);
      waveform.update({
        data: data
      });
    }, 50);

    waveform.dataFromSoundCloudTrack(track);
    var streamOptions = waveform.optionsForSyncedStream();
    SC.stream(track.uri, streamOptions, function(stream){
    window.exampleStream = stream.play();
  });
});
});
});

