var app = angular.module('AngularRails')

app.controller('HomeCtrl', function ($scope) {

   $("#login_menu").on("click", function() {
        if ( $("#login_menu").css('top') != '0px' ) {
        $(this).animate({top: 0}, 500);
        } else  {
          $(this).animate({top: -178}, 500);
        }
    });


});
