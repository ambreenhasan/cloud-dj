var app = angular.module('AngularRails')

app.controller('HomeCtrl', function ($scope) {

    // $("#login_menu").toggle(
    //   function() {$("#login_menu").css("background-color", "blue");},
    //   function() {$("#login_menu").css("background-color", "green");
    // }).click();


  //  $("#login_menu").on("click", function() {
  //   $("#login_menu").slideToggle(function() {
  //     $("#login_menu").animate({top: -90}, 500);
  //   },function(){
  //     $("#login_menu").animate({top: 90}, 500)
  //   });
  // });

   $("#login_menu").on("click", function() {
        if ( $("#login_menu").css('top') != '0px' ) {
        $(this).animate({top: 0}, 500);
        } else  {
          $(this).animate({top: -178}, 500);
        }
    });


});
