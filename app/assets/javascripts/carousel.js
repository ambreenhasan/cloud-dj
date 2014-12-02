$(document).ready(function() {

  function carouselMagic(id, frames) {
    var owl = $(id);
    var items = frames
    owl.owlCarousel({
        items : items, //10 items above 1000px browser width
        itemsDesktop : [1000,3], //5 items between 1000px and 901px
        itemsDesktopSmall : [900,2], // betweem 900px and 601px
        itemsTablet: [600,1], //2 items between 600 and 0
        itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
    });

    owl.trigger('owl.play',2500)
    // Custom Navigation Events
    $(".next").click(function(){
      owl.trigger('owl.next');
    })
    $(".prev").click(function(){
      owl.trigger('owl.prev');
    })
    $(".play").click(function(){
      owl.trigger('owl.play',2200); //owl.play event accept autoPlay speed as second parameter
    })
    $(".stop").click(function(){
      owl.trigger('owl.stop');
    })

    $(".item").hover( handlerIn, handlerOut )

  function handlerIn() {
    owl.trigger('owl.stop');
    $(this).css("border", "8px blue solid")
  }

  function handlerOut() {
    owl.trigger('owl.play',2500)
    $(this).css("border", "0px blue solid")
  }

  }

carouselMagic("#trending_carousel", 3)
carouselMagic("#my_rooms_carousel", 3)
carouselMagic("#joined_rooms_carousel", 3)

});
