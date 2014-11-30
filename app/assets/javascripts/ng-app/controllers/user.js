app.controller("UserCtrl", ["$scope", "$http", function($scope, $http) {
  // $scope.email = "";
  // $scope.first_name = "";
  // $scope.last_name = "";
  // $scope.password = "";
  $scope.submit = function(user) {
    $http.post("/users", {user: {
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name,
        password: user.password }
    }).success(function(data){
      console.log(data)
    })
  }
}]);

// app.controller("UserCtrl", ["$scope", function($scope, $http) {
//   $scope.email = "";
//   $scope.first_name = "";
//   $scope.last_name = "";
//   $scope.password = "";
//   $scope.submit = function() {
//     debugger
//     alert("params");
//     $http.post("/users/create", {
//         email: email,
//         first_name: first_name,
//         last_name: last_name,
//         password: password
//   }).done(function(){alert("success")}).fail(function(){alert("fail")})
// }
// });
