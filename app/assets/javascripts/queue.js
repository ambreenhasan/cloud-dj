$(document).on("page:change", function(){
  $("#query_song_list").on("click", ".track_title", function() {
    var $deleteListTag = $(this).parent();
    $("#queue_container ul").append($(this))
    $deleteListTag.remove()
  })

  $("#queue_container").on("click", ".track_title", function() {
    var title = $(this).attr('data-track-title');
    var desc = $(this).attr('data-track-desc');
    var vid_id = $(this).attr('video_id');
    var identifier = vid_id.substr(-11,11);
    var add_html = "<iframe width='480' height='390' frameborder='0' allowfullscreen src='http://www.youtube.com/embed/"+identifier+"?rel=0&autoplay=1' ></iframe>";

    $("#fav_button").attr("title", title);
    $("#fav_button").attr("desciption", desc);
    $("#fav_button").attr("song_id", identifier);

    $("#video_container").html(add_html);
    $('#currently_playing').text(title);
  });

  $("#fav_button").on("click", function(event){
    if ($(this).is(":checked")) {
      var userid = 1//hardcoded
      var apiid = 3//hardcoded
      var roomid = 4//hardcoded
      var songtitle = $("#fav_button").attr("title")
      var songdesc = $("#fav_button").attr("description")
      var pass_to_songs = {song: {user_id: userid, room_id: roomid, api_id: apiid, title: songtitle, description: songdesc}}
      console.log(pass_to_songs);

      var songid = 0
      var pass_to_user_stars = {user_star: {user_id: userid, song_id: songid}}

      $.ajax({
        url: '/users/'+userid+'/songs',//what is :user_id???, hardcoded in show.html.erb
        type: 'post',
        data: pass_to_songs
      })
      .done(function(response){
        console.log(response);
        console.log(response.id);
        songid = response.id;//not working
        console.log('SONG SAVED TO DATABASE!');
        save_user_star();
      })
      .fail(function(event){
        console.log('YOU FAILED BECAUSE YOURE A LOSER');
      })

      function save_user_star() {
        $.ajax({
          url: '/users/'+userid+'/user_stars',//what is :user_id???
          type: 'post',
          data: pass_to_user_stars
        })
        .done(function(response){
          console.log(response);
          console.log('FAVORITED THIS SONG!');
        })
        .fail(function(event){
          console.log('YOURE A LOSER AND GET NO RESPONSE');
        })
      }
    }
  });
});


