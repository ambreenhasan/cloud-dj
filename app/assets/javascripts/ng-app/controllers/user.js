app.controller("UserCtrl", ["$scope", "$http", function($scope, $http) {

  $scope.submit = function(user) {
    $http.post("/users", {user: {
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name,
        password: user.password }
    }).success(function(data){
      console.log(data)
      //create session
      // redirect to user room page
    })
  }
}]);