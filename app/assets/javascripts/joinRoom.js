$(document).ready(function() {

  $(".item").on("click", function() {
    var id = this.id
    alert(id)
  })


  $(".item").hover( handlerIn, handlerOut )

  function handlerIn() {
    alert("over")
  }

  function handlerOut() {
    alert("out")
  }

  // owl.trigger('owl.stop');
  // owl.trigger('owl.play',2500)

});
