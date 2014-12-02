$(document).ready(function() {

  $(".item").on("click", function() {
    var id = this.id
    alert(id)

    $.ajax ({
      url: "/users",
      type: "GET"
    }).done(function() {alert("win")}).fail(function(){alert("fail")})
  })



});
