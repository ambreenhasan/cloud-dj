function roomOutTransition() {
  $("#room").css("display", "none");
  $(".sti-menu").animate({"top": 0}, 500);
  $("#trending_carousel_div").css("display", "block");
  $("#home_trending_section").animate({"top": 0}, 500);
  $(body).css("height", "1600px");
  $("#home_trending_section").animate({"height": "960px"}, 500);
}

$(document).ready(function(){

  $("#user_profile").on("click", function(){
    $("#ajax_home_thing").css("display", "none");
    $("#new_room_form_div").css("display", "none");
    $("#room").css("display", "none");
    roomOutTransition()
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
    // $userHomeSelector.hide();
    // $userProfileSelector.css("display", "");
  };

  return {
    showProfile: showProfile
  }
})();
