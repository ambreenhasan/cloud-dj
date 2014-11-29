// hide
SC.initialize({
  client_id:""
});
// find all sounds of buskers licensed under 'creative commons share alike'
SC.get('/tracks', { q: 'buskers', limit: 8}, function(tracks) {
  console.log(tracks);
});

// function searchSoundCloud(searchedItem)

// app.controller("SoundCloudCtrl", function($scope, $http) {
//   $http.get('/api_key').success(function(data, status, headers, config) {
//     console.log("success:" + data)
//   }).error(function(data, status, headers, config){
//     console.log("fail")
//   })
// });