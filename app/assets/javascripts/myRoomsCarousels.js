$(document).ready(function() {
  bindEvents();
});

function bindEvents() {
  alert('ohh')
  $('.item').on('click', '.delete' Server.deleteRoom)
}

var Server = (function() {
  function deleteRoom(e) {
    alert('fak')
    e.preventDefault();
    var url = $(this).attr('id');
    var ajaxRequest = $.ajax({
      url: url,
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
    alert('ew')
    var roomId = data.id;
    $roomSelector = $('div.item#'+roomId);
    $roomSelector.remove();
  }

  return {
    deleteRoom: deleteRoom
  }
})();