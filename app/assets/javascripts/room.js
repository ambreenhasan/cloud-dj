$(document).ready(function() {

  $('#hide_button').on("click", function() {
        if ( $("#login_menu").css('top') != '0px' ) {
          $("#login_menu").animate({top: 0}, 500);
          $("#hide_button").html("hide");
        } else  {
          $("#login_menu").animate({top: -163}, 500);
          $("#hide_button").html("login");
        }
    });

    $("#show_signup_form_button").on("click", function() {
      if ( $("#signup_menu").css('display') === 'none' ) {
        $("#signup_menu").slideDown(500);
        $("#show_signup_form_button").html("hide registration form.");
        $("#hide_button").css("display", "none");
      } else  {
        $("#signup_menu").slideUp(500);
        $("#show_signup_form_button").html("Not a member?");
        $("#hide_button").css("display", "block");
      }
   });

    $("#new_room_tab").on("click", function(){
      if ($("#new_room_form_div").css("display") === "none") {
        $("#new_room_form_div").slideDown(500);
        $("#new_room_tab").css("color", "#75acd1");
      } else
        $("#new_room_form_div").slideUp(500);
        $("#new_room_tab").css("color", "#080308");
    });

    $("#hide_new_room_form_button").on("click", function() {
      $("#new_room_form_div").slideUp(500);
    })

    $("#home_button").on("click", function() {
      $("#room").css("display", "none");
      $("#ajax_home_thing").slideDown();
    })

    $("#home_tab").on("click", function() {
      $("#room").css("display", "none");
      $('#profile_page').css("display", "none");
      $("#ajax_home_thing").slideDown();
    })

      $(".bounce").exBounce();



})

