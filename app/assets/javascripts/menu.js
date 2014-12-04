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
  };


    // var $el             = $(this),
    //   $menuItems      = $el.children('li'),
    // maxdelay    = Math.max( settings.animMouseleave['mText'].speed + settings.animMouseleave['mText'].delay ,
    //     settings.animMouseleave['sText'].speed + settings.animMouseleave['sText'].delay ,
    //     settings.animMouseleave['icon'].speed + settings.animMouseleave['icon'].delay
    //   ),
    //   t_mouseenter;
    // $menuItems.find('.sti-item').each(function() {
    //   var $el = $(this);
    //   $el.data('deftop', $el.position().top);
    // });



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

    // $movingItems.each(function(i) {
    //     var $item           = $(this),
    //     item_sti_type   = $item.data('type'),
    //     speed           = settings.animMouseenter[item_sti_type].speed,
    //     easing          = settings.animMouseenter[item_sti_type].easing,
    //     delay           = settings.animMouseenter[item_sti_type].delay,
    //     dir             = settings.animMouseenter[item_sti_type].dir,

    //     style           = {'top' : -dir * wrapper_h + 'px'};

        // if( item_sti_type === 'icon' ) {
        //   style.backgroundPosition    = 'bottom left';
        //     } else {
        //       style.color                 = hovercolor;
        //     }
            // $item.hide().css(style).show();
            // clearTimeout($item.data('time_anim'));
            // $item.data('time_anim',
              // setTimeout(function() {
                // $item.stop(true)
                    // .animate({top : $item.data('deftop') + 'px'}, speed, easing);
            // }, delay)
                // );


    // });

    // $wrapper.stop(true).animate({
    //     backgroundColor: settings.defaultTextColor
    //     }, settings.boxAnimSpeed );
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

    // $movingItems.each(function(i) {
    //   var $item           = $(this),
    //     item_sti_type   = $item.data('type'),
    //     speed           = settings.animMouseleave[item_sti_type].speed,
    //     easing          = settings.animMouseleave[item_sti_type].easing,
    //     delay           = settings.animMouseleave[item_sti_type].delay,
    //     dir             = settings.animMouseleave[item_sti_type].dir;
    //   clearTimeout($item.data('time_anim'));
    //   setTimeout(function() {
    //     $item.stop(true).animate({'top' : -dir * wrapper_h + 'px'}, speed, easing, function() {
    //       if( delay + speed === maxdelay ) {
    //         $wrapper.stop(true).animate({
    //           backgroundColor: settings.defaultBgColor
    //         }, settings.boxAnimSpeed );
    //         $movingItems.each(function(i) {
    //           var $el             = $(this),
    //             style           = {'top' : $el.data('deftop') + 'px'};
    //           if( $el.data('type') === 'icon' ) {
    //             style.backgroundPosition    = 'top left';
    //           } else {
    //             style.color                 = settings.defaultTextColor;
    //           }
    //           $el.hide().css(style).show();
    //         });
    //       }
    //     });
    //   }, delay);
    // })

  }



// $("#home_trending_section").on("mouseenter", "#sti-menu li", handlerInMenu);
// $("#home_trending_section").on("mouseout", "#sti-menu li", handlerOutMenu);
  $("#home_trending_section #sti-menu li").hover(handlerInMenu, handlerOutMenu )

})
