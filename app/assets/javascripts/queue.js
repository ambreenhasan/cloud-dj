$(document).on("page:change", function(){
  $("#query_song_list").on("click", ".track_title", function() {
    var $deleteListTag = $(this).parent();
    $("#queue_container ul").append($(this))
    $deleteListTag.remove()
  })

  $("#queue_container").on("click", ".track_title", function() {
    var title = $(this).attr('data-track-title');
    var vid_id = $(this).attr('video_id');
    var identifier = vid_id.substr(-11,11);
    var add_html = "<iframe width='480' height='390' frameborder='0' allowfullscreen src='http://www.youtube.com/embed/"+identifier+"?rel=0&autoplay=1' ></iframe>";

    $("#fav_button").attr("title", title);
    $("#fav_button").attr("song_id", identifier);

    $("#video_container").html(add_html);
    $('#currently_playing').text(title);
  });

  $("#fav_button").on("click", function(event){
    if ($(this).is(":checked")) {
      var userid = 1
      var songid = 2
      var pass_this = {user_star: {user_id: userid, song_id: songid}}
      console.log(pass_this);

      $.ajax({
        url: '/users/'+userid+'/user_stars',//what is :user_id???
        type: 'post',
        data: pass_this
      })
      .done(function(response){
        console.log('GOT A RESPONSE OMG!!!');
        console.log(response);
      })
      .fail(function(event){
        console.log('YOURE A LOSER AND GET NO RESPONSE');
      })
    }
  });
});


