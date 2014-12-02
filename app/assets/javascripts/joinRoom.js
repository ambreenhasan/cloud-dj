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
    $("#room").slideDown(1000)
  }

});


