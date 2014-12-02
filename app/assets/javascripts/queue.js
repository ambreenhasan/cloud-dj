$(document).on("page:change", function(){

  var queue = [];








  // $("#query_song_list").on("click", ".track_title", function() {
  //   var $deleteListTag = $(this).parent();
  //   $("#queue_container ul").append($(this))
  //   $deleteListTag.remove()
  // })

  // $("#queue_container").on("click", ".track_title", function() {
  //   var title = $(this).attr('data-track-title');
  //   var vid_id = $(this).attr('video_id');
  //   var identifier = vid_id.substr(-11,11);
  //   var add_html = "<iframe width='480' height='390' frameborder='0' allowfullscreen src='http://www.youtube.com/embed/"+identifier+"?rel=0&autoplay=1' ></iframe>";

  //   $("#video_container").html(add_html);
  //   $('#currently_playing').text(title);
  // });
});

// get elements and push objects into queue that are put into
// queue container
// have controls for when a song is finished playing
// the next song in the queue plays
// songs can only be played one after the other
// moderator can skip songs (i.e. next)

// add data types for yt and sc to template


