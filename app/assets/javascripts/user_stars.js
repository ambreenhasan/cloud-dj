$(document).on("page:change", function(){
  $("#fav_button").on("click", function(event){
    if ($(this).is(":checked")) {
      var userid = 1//hardcoded
      var apiid = 3//hardcoded
      var songtitle = $("#fav_button").attr("title")
      var songdesc = $("#fav_button").attr("description")
      var pass_to_songs = {song: {user_id: userid, api_id: apiid, title: songtitle, description: songdesc}}
      console.log(pass_to_songs);

      var songid = 0

      save_song();
      var pass_to_user_stars = {user_star: {user_id: userid, song_id: songid}}
      save_user_star();

      function save_song() {
        $.ajax({
          url: '/users/'+userid+'/songs',//what is :user_id???, hardcoded in show.html.erb
          type: 'post',
          data: pass_to_songs,
          async: false
        })
        .done(function(response){
          songid = response.id;//not working
          console.log('SONG SAVED TO DATABASE!');
        })
        .fail(function(event){
          console.log('YOU FAILED BECAUSE YOURE A LOSER');
        })
      }

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
      };
    };
  });



});