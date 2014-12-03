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

  function handlerInMenu() {
    var $item       = $(this),
        $wrapper    = $item.children('a'),
        wrapper_h   = $wrapper.height(),
        $movingItems= $wrapper.find('.sti-item'),
        hovercolor  = $item.data('hovercolor');
    $item.addClass('sti-current');

    $movingItems.each(function(i) {
        var $item           = $(this),
        item_sti_type   = $item.data('type'),
        speed           = settings.animMouseenter[item_sti_type].speed,
        easing          = settings.animMouseenter[item_sti_type].easing,
        delay           = settings.animMouseenter[item_sti_type].delay,
        dir             = settings.animMouseenter[item_sti_type].dir,
        // if dir is 1 the item moves downwards
        // if -1 then upwards
        style           = {'top' : -dir * wrapper_h + 'px'};

        if( item_sti_type === 'icon' ) {
            // this sets another bg image position for the icon
          style.backgroundPosition    = 'bottom left';
            } else {
              style.color                 = hovercolor;
            }
            // we hide the icon, move it up or down, and then show it
            $item.hide().css(style).show();
            clearTimeout($item.data('time_anim'));
            $item.data('time_anim',
              setTimeout(function() {
                // now animate each item to its default tops
                // each item will animate with a delay specified
                // in the options
                $item.stop(true)
                    .animate({top : $item.data('deftop') + 'px'}, speed, easing);
            }, delay)
                );
    });

    $wrapper.stop(true).animate({
        backgroundColor: settings.defaultTextColor
        }, settings.boxAnimSpeed );




  }

  function handlerOutMenu() {
    var $item       = $(this),
        $wrapper    = $item.children('a'),
        wrapper_h   = $wrapper.height(),
        $movingItems= $wrapper.find('.sti-item'),
        hovercolor  = $item.data('hovercolor');
    $item.removeClass('sti-current');
  }










  $("#sti-menu li").hover( handlerInMenu, handlerOutMenu )

})
