$(document).on("page:change", function(){
  var isPlaying = false;
  var queue = [];
  var deleteFromQueueMode = false;
  var currentTrack = "";

  $(document).on("click", "#mute_button", function() {
    currentTrack.toggleMute();
  });

  $(document).on("click", "#skip_button", function() {
    currentTrack.setPosition(currentTrack.duration - 1);
  });

  $(document).on("click", "#delete_button", function() {
    if (deleteFromQueueMode === false) {
      deleteFromQueueMode = true;
      $("#delete_mode_toggle").text("ON");
    } else {
      deleteFromQueueMode = false;
      $("#delete_mode_toggle").text("OFF");
    };
  });

  var addSongsToQueue = function(){
    var id = $("#queue_container ul button").last().attr("id")
    var type = $("#queue_container ul button").last().attr("data-type")
    var audio = $("#queue_container ul button").last().attr("data-track-link");
    var duration = $("#queue_container ul button").last().attr("data-track-duration");
    var trackTitle = $("#queue_container ul button").last().attr("data-track-title");

    queue.push({
      id: id,
      type: type,
      audio: audio,
      duration: parseInt(duration),
      trackTitle: trackTitle
    })
  }

  var playSong = function(id) {
    // prevents two songs from playing at the same time
     if(typeof(soundManager) !== "undefined"){
        soundManager.stopAll();
    }

      $("#soundcloud").empty();
      var currentItem = queue[0].id
      SC.get("/tracks/" + currentItem, function(track){
      var waveform = new Waveform({
      container: document.getElementById("soundcloud"),
      innerColor: "#333",
      width: ($('#player_container').width()) * 0.9,
      height: ($('#player_container').height()) * 0.2,
      interpolate: false
    });

    var data = [];
    var ctx = waveform.context;

    var gradient = ctx.createLinearGradient(0, 0, 0, waveform.height);
    gradient.addColorStop(0.0, "#f60");
    gradient.addColorStop(1.0, "#ff1b00");
    waveform.innerColor = gradient;

    var i = 0;
    setInterval(function(){
      data.push(Math.cos(i++/25) - 0.2 + Math.random()*0.3);
      waveform.update({
        data: data
      });
    }, 50);

    waveform.dataFromSoundCloudTrack(track);
    SC.stream(track.uri, {onplay:function(){
        $("#currently_playing").text(queue[0].trackTitle);
        isPlaying = true;
      }, onfinish: function(){
        isPlaying = false;
        $("#soundcloud").empty();
        $("#queue_container ul button:first-child").remove();
        queue.shift();
        playSong();
      }
    }, function(stream){
      currentTrack = stream;
    window.exampleStream = stream.play();
    });
  });
  }

  $("#queue_container ul").on("click", ".track_title", function(){
    if (deleteFromQueueMode === true) {
      $(this).remove();
    }
  })

  $("#query_song_list").on("click", ".track_title", function() {
    var $deleteListTag = $(this).parent();
    $("#queue_container ul").append($(this))
    $deleteListTag.remove()


    addSongsToQueue();

    if ((queue.length === 1) || (isPlaying === false)) {
      playSong();
    }
  })

  var colours=[ '#666666','#ffffff'];  // List of colors
  var tempID=0;
  var changeInterval=1000;    // Change interval in miliseconds
  var objectID='#dance_floor';

  setInterval(function(){
        $(objectID).animate({backgroundColor: colours[tempID]},500);
        tempID=tempID+1;
        if (tempID>colours.length-1) tempID=0;
    },changeInterval);

  setInterval(function(){
    $(".avatar").each(function(){
      var num = getRandomInt(1,15);
      $(this).attr("src", "/assets/crazy_dancing_girl_"+num+".png")
    });
  }, 1000)

  function getRandomInt(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
  }
});
//'#ff0000','#00ff00','#0000ff','#ffff00','#acacac',
