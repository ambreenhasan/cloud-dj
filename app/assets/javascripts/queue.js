$(document).on("page:change", function(){

  var queue = [];

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

    console.log(queue)
  }

  var playSong = function(id) {
    // prevents two songs from playing at the same time
     if(typeof(soundManager) !== 'undefined'){
        soundManager.stopAll();
    }

    // $("#queue_container ul button").find()

    if (queue[0].type == "sc") {
      var currentItem = queue[0].id
      SC.get("/tracks/" + currentItem, function(track){
      var waveform = new Waveform({
      container: document.getElementById("soundcloud"),
      innerColor: "#333",
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
    var streamOptions = waveform.optionsForSyncedStream();
    SC.stream(track.uri, streamOptions, function(stream){
    window.exampleStream = stream.play();
    });
  });
  }
    else {
      // problems: starts drawing the second song but doesnt play(that is good)
      // and resets the play of the first song when another song is added


    }
  }

  var playNextSong = function(){
    if (queue[0].duration) {
        queue.shift();
        playSong()
      // if sc, something, else (something else)
     // when the duration of song is equal to the duration
     // pop the song off and play song

    }

  }

  var skipSong = function(){
    // when a button is toggled

  }


// 457368 / 1000 = 457
// 457 / 60 = minutes
// 457 % 60 = seconds

  $("#query_song_list").on("click", ".track_title", function() {
    var $deleteListTag = $(this).parent();
    $("#queue_container ul").append($(this))
    $deleteListTag.remove()
    addSongsToQueue();
    playSong();
  })

  // $("#queue_container").on("click", ".track_title", function() {
  //   var title = $(this).attr('data-track-title');
  //   var vid_id = $(this).attr('video_id');
  //   var identifier = vid_id.substr(-11,11);
  //   var add_html = "<iframe width='480' height='390' frameborder='0' allowfullscreen src='http://www.youtube.com/embed/"+identifier+"?rel=0&autoplay=1' ></iframe>";

  //   $("#video_container").html(add_html);
  //   $('#currently_playing').text(title);
  // });
});


// songs can only be played one after the other
// when a song is finished playing the next song in the queue plays
// moderator can skip songs (i.e. next)

// toggle between soundcloud player and youtube player



