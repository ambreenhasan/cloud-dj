// app.controller("SoundcloudCtrl", ["$scope", "$http", function($scope, $http) {
//   // $scope.email = "";
//   // $scope.first_name = "";
//   // $scope.last_name = "";
//   $scope.songs = [1, 2, 3];
//   // $scope.password = "";
//   // $scope.renderSongs = function(data) {
//   //   debugger;
//   //   $scope.songs = data;
//   //   alert(data)
//   // };

//   $scope.submit = function(search) {
//     $http.post("/soundcloud/search", {
//       query: search.query
//     }).success(function(data){
//       renderSongs(data);
//       // $scope.renderSongs(data);
//       clearForm()
//     })
//   }


//   function renderSongs(data) {
//     // debugger;
//     for (var i=0; i < 6; i++) {
//       $("#query_song_list").append("<li id='song_option' class='bd-sm p-l hvr'>" + data[i].title + "</li>")
//       console.log(data[i]);
//       $("#query_song_list").slideDown("slow");
//     }
//   }

//   function songOption() {
//     $("#song_option").on("hover")
//   }

//   function clearForm() {
//     $('#song_search_bar').val("");
//   }



// }]);
