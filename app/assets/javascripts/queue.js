$(document).on("page:change", function(){
  $("#query_song_list").on("click", ".track_title", function() {
    $("#queue_container ul").append($(this))
  })

  $("#queue_container").on("click", ".track_title", function() {
    var vid_id = $(this).attr('video_id');
    var identifier = vid_id.substr(-11,11);
    var add_html = "<iframe width='480' height='390' frameborder='0' allowfullscreen src='http://www.youtube.com/embed/"+identifier+"?rel=0&autoplay=1' ></iframe>";
    $("#video_container").html(add_html);
  });
});

