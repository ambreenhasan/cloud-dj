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
      duration: duration,
      trackTitle: trackTitle
    })

    console.log(queue)
  }

  var playSong = function() {


  }

  var playNextSong = function(){

  }

  var skipSong = function(){

  }




  $("#query_song_list").on("click", ".track_title", function() {
    var $deleteListTag = $(this).parent();
    $("#queue_container ul").append($(this))
    $deleteListTag.remove()
    addSongsToQueue();
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


// when a song is finished playing the next song in the queue plays
// songs can only be played one after the other
// moderator can skip songs (i.e. next)

// toggle between soundcloud player and youtube player



