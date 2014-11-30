app.controller("SoundcloudCtrl", ["$scope", "$http", function($scope, $http) {
  // $scope.email = "";
  // $scope.first_name = "";
  // $scope.last_name = "";
  // $scope.password = "";
  $scope.submit = function(search) {
    $http.post("/soundcloud/search", {
      query: search.query
    }).success(function(data){
      renderSongs(data);
      clearForm()
    })
  }

  function clearForm() {
    $('#song_search_bar').val("");
  }

  function renderSongs(data) {
    alert("yaya!")
  }
}]);
