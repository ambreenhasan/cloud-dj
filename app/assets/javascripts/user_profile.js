$(document).ready(function(){

  $("#user_profile").on("click", function(){
    $(this).css("color", "blue");
    // $("#ajax_home_thing").css("display", "none");
    $("#ajax_home_thing").slideUp();
    $("#new_room_form_div").slideUp(500);
    $("#profile_page").slideDown();
  })


  bindEvents();
});

function bindEvents() {
  $('#user_profile').on('click', Profile.showProfile)
  // $('li#user_profile').on('click', Profile.showProfile)
  $('#accordion ul > li ul').click(function(event){
    event.stopPropagation();
  })
  .filter(':not(:first)')
  .hide();
  $('#accordion ul > li').click(function() {
    var selfClick = $(this).find('ul:first').is(':visible');
    if (!selfClick) {
      $(this)
      .parent()
      .find('> li ul:visible')
      .slideToggle();
    }
    $(this)
    .find('ul:first')
    .slideToggle();
  });
}

var Profile = (function() {
  function showProfile() {
    var $userHomeSelector = $('div#user_home');
    var $userProfileSelector = $('div.user_profile');
    $userHomeSelector.hide();
    $userProfileSelector.css("display", "");
  };

  return {
    showProfile: showProfile
  }
})();
