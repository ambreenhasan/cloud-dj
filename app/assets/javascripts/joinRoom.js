$(document).ready(function() {

  $(".item").on("click", function() {
    var room_id = this.id
    // alert(room_id)

    $.ajax ({
      url: "/users",
      type: "GET",
      data: {room_id: room_id}
    }).done(renderRoom).fail(function(){alert("fail")})
  })

  function renderRoom() {
    $("#ajax_home_thing").css("display", "none");
    $("#profile_page").css("display", "none");
    $("#room").slideDown(1000)
    $("#trending_carousel_div").css("display", "none");
    $("#home_trending_section").animate({"top": "14em"}, 500);
    $(".sti-menu").animate({"top": "3em"}, 500);
    $("#home_trending_section").animate({"height": "28em"}, 500);
    $(body).css("height", "1000px");
  }

  $("#home_trending_section").on("mouseover", function() {
    $(this).animate({"top": 0},600);
  })

  $("#home_trending_section").on("mouseleave", function() {
    if ($("#room").css("display") === "block") {
      $("#home_trending_section").animate({"top": "14em"},600);
    }

  })


});


