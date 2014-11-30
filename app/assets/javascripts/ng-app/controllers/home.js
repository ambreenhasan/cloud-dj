var app = angular.module('AngularRails')

app.controller('HomeCtrl', function ($scope) {

   $("#hide_button").on("click", function() {
        if ( $("#login_menu").css('top') != '0px' ) {
        $("#login_menu").animate({top: 0}, 500);
        $("#hide_button").html("hide");
        } else  {
          $("#login_menu").animate({top: -178}, 500);
          $("#hide_button").html("login");
        }
    });


});
