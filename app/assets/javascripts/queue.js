$(document).on("page:change", function(){
  $("#query_song_list").on("click", ".track_title", function() {
    $("#queue_container ul").append($(this))
  });
})

