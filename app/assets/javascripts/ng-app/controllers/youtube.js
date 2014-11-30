app.controller("YoutubeCtrl", ["$scope", "$http", function($scope, $http) {
  // $scope.tracks = [1, 2, 3];

  $scope.submit = function(search) {
    $http.post("/youtube/search").success(function(data){
      console.log(data)
    })
  }
}]);