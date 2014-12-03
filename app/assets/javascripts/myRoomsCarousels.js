$(document).ready(function() {
  bindEvents();
});

function bindEvents() {
  $('div.delete_my_room').on('submit', Server.deleteRoom)
}

var Server = (function() {
  function deleteRoom(e) {
    e.preventDefault();
    $url = $('form.delete_my_room').attr('action')
    var ajaxRequest = $.ajax({
      url: $url,
      type: 'DELETE'
    })
    ajaxRequest.done(View.deleteRoom).fail(function(){alert('fuckoff')});
    }
    return {
      deleteRoom: deleteRoom
  }
})();

var View = (function() {
  function deleteRoom(data){
    var roomId = data.room_id;
    alert('fak')
    $roomSelector = $('div.item#'+roomId);
    $roomSelector.remove();
  }
  return {
    deleteRoom: deleteRoom
  }
})();