$(document).ready(function() {

  function handlerInMenu() {
    alert($(this))
    var $item       = $(this),
        $wrapper    = $item.children('a'),
        wrapper_h   = $wrapper.height(),
        $movingItems= $wrapper.find('.sti-item'),
        hovercolor  = $item.data('hovercolor');
    $item.addClass('sti-current');

  }

  function handlerOutMenu() {
    alert("out")
  }










  $("#sti-menu li").hover( handlerInMenu, handlerOutMenu )

})
