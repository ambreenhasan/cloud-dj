var app = angular.module('AngularRails', ['ngRoute','templates'])

app.config(function ($routeProvider, $locationProvider) {
    $routeProvider
        .when('/', {
            templateUrl: 'home.html',
            controller: 'HomeCtrl'
    })
    .when('/room', {
        templateUrl: 'room.html',
        controller: 'RoomCtrl'
    });
});
