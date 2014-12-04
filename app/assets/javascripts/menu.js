$(document).ready(function() {

  var settings = {
    // configuration for the mouseenter event
    animMouseenter      : {
      'mText' : {speed : 350, easing : 'easeOutExpo', delay : 140, dir : 1},
      'sText' : {speed : 350, easing : 'easeOutExpo', delay : 0, dir : 1},
      'icon'  : {speed : 350, easing : 'easeOutExpo', delay : 280, dir : 1}
    },
    // configuration for the mouseleave event
    animMouseleave      : {
      'mText' : {speed : 300, easing : 'easeInExpo', delay : 140, dir : 1},
      'sText' : {speed : 300, easing : 'easeInExpo', delay : 280, dir : 1},
      'icon'  : {speed : 300, easing : 'easeInExpo', delay : 0, dir : 1}
    },
    // speed for the item bg color animation
    boxAnimSpeed        : 300,
    // default text color (same defined in the css)
    defaultTextColor    : '#000',
    // default bg color (same defined in the css)
    defaultBgColor      : '#fff'
  }

  function handlerInMenu() {
    var $item       = $(this),
        $wrapper    = $item.children('a'),
        wrapper_h   = $wrapper.height(),
        $movingItems= $wrapper.find('.sti-item'),
        hovercolor  = $item.data('hovercolor');
    $item.addClass('sti-current');


      $wrapper.animate({"background-color": "yellow"}, 200);
      // $wrapper.css("border", "5px purple dotted");
      $wrapper.css("box-shadow", "1px 1px 2px purple");
      $movingItems.animate({"color": "purple"}, 200);
      $wrapper.animate({"top": "-15px"}, 100);
  }



  function handlerOutMenu() {
    var $item       = $(this),
        $wrapper    = $item.children('a'),
        wrapper_h   = $wrapper.height(),
        $movingItems= $wrapper.find('.sti-item'),
        hovercolor  = $item.data('hovercolor');
    $item.removeClass('sti-current');

    $wrapper.animate({"background-color": "#fff"}, 300);
    $movingItems.animate({"color": "#000"}, 300);
    $wrapper.animate({"top": "0px"}, 100);
  }



// $("#home_trending_section").on("mouseenter", "#sti-menu li", handlerInMenu);
// $("#home_trending_section").on("mouseout", "#sti-menu li", handlerOutMenu);
  $("#home_trending_section #sti-menu li").hover(handlerInMenu, handlerOutMenu )

})
