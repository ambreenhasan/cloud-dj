$(document).ready(function() {
  $.fn.exBounce = function(){
      var self = this;
      (function runEffect(){
          self.effect("bounce", { times:3 }, 1500, runEffect);
      })();
     return this;
  };
 $(".bounce").exBounce();
})
