// hide
SC.initialize({
  client_id: soundcloudClientId
});

SC.get('/tracks', { q: 'buskers', limit: 8}, function(tracks) {
  console.log(tracks);
});

// function searchSoundCloud(searchedItem)
// function SoundCloudCtrl($scope, $http) {
//    $http.get('/api_key').success(function(data) {
//     console.log("success:" + data)
//   }).error(function(data, status, headers, config){
//     console.log("fail")
//   })
// }

// SoundCloudCtrl();
