// create angular file here

var app = angular.module("cloud-dj", [])

app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.
    otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    })
}]);
