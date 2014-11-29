SC.initialize({
  client_id: soundcloudClientId()
});



// soundcloud controller = constructor function($scope), title, artist_name, stream_url
// searchSoundCloudForSongs =
// displaysoundCloudresults = renders template
//


app.controller("SoundCloudCtrl", function($scope, $http){
  function searchSoundCloud(searchedSong) {
    SC.get('/tracks', { q: searchedSong, limit: 5}, function(tracks) {
    console.log(tracks);
  });
  }
})
