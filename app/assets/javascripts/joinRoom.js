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
    $("#home_trending_section").animate({"top": "19em"}, 500);
    $(".sti-menu").animate({"top": "3em"}, 500);
    $("#home_trending_section").animate({"height": "28em"}, 500);
    $("#home_trending_section").addClass("hoverUp");
  }

  $(".hoverUp").on("mouseover", function() {
    $(this).animate({"top": 0},500);
  })

  $(".hoverUp").on("mouseleave", function() {
    if $(this).animate({"top": 0},500);
  })


});


