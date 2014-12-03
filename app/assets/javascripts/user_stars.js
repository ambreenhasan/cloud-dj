$(document).on("page:change", function(){
  $("#fav_button").on("click", function(event){
    if ($(this).is(":checked")) {
      var userid = $("#sessionuserid").attr("sessionid")
      var apiid = $("#queue_container ul button").first().attr("id")
      var songtitle = $("#queue_container ul button").first().attr("data-track-title")
      var pass_to_songs = {song: {user_id: userid, api_id: apiid, title: songtitle}}

      var songid = 0

      save_song();
      console.log(userid)
      var pass_to_user_stars = {user_star: {user_id: userid, song_id: songid}}
      save_user_star();

      function save_song() {
        $.ajax({
          url: '/users/'+ userid +'/songs',
          type: 'post',
          data: pass_to_songs,
          async: false
        })
        .done(function(response){
          console.log('SONG SAVED TO DATABASE!');
        })
        .fail(function(event){
          console.log('YOU FAILED BECAUSE YOURE A LOSER');
        })
      }

      function save_user_star() {
        $.ajax({
          url: '/users/' + userid + '/user_stars',
          type: 'post',
          data: pass_to_user_stars
        })
        .done(function(response){
          $('#fav_button').attr('checked', false);
          $("#favorited").append("Song has been added to your favorites.").css('color', 'green').fadeOut(5000)
        })
        .fail(function(event){
          $('#fav_button').attr('checked', false);
           $("#favorited").append("Song was not successfully saved. Try again later.").css('color', 'red').fadeOut(5000)
        })
      };
    };
  });



});