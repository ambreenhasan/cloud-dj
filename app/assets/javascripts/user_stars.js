$(document).on("page:change", function(){
  $("#fav_button").on("click", function(event){
    if ($(this).is(":checked")) {
      var userid = $("#sessionuserid").attr("sessionid")
      var apiid = 'unnecessary'//hardcoded, not needed anymore?
      var songtitle = $("#fav_button").attr("title")
      var songdesc = $("#fav_button").attr("description")
      var pass_to_songs = {song: {user_id: userid, api_id: apiid, title: songtitle, description: songdesc}}

      var songid = 0

      save_song();
      var pass_to_user_stars = {user_star: {user_id: userid, song_id: songid}}
      save_user_star();

      function save_song() {
        $.ajax({
          url: '/users/'+userid+'/songs',
          type: 'post',
          data: pass_to_songs,
          async: false
        })
        .done(function(response){
          songid = response.id;
          console.log('SONG SAVED TO DATABASE!');
        })
        .fail(function(event){
          console.log('YOU FAILED BECAUSE YOURE A LOSER');
        })
      }

      function save_user_star() {
        $.ajax({
          url: '/users/'+userid+'/user_stars',
          type: 'post',
          data: pass_to_user_stars
        })
        .done(function(response){
          console.log('FAVORITED THIS SONG!');
        })
        .fail(function(event){
          console.log('YOURE A LOSER AND GET NO RESPONSE');
        })
      };
    };
  });



});