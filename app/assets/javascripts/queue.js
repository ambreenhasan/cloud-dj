$(document).on("page:change", function() {
      var isPlaying = false;
      var queue = [];

      var addSongsToQueue = function() {
        var id = $("#queue_container ul button").last().attr("id");
        var type = $("#queue_container ul button").last().attr("data-type");
        var audio = $("#queue_container ul button").last().attr("data-track-link");
        var duration = $("#queue_container ul button").last().attr("data-track-duration");
        var trackTitle = $("#queue_container ul button").last().attr("data-track-title");

        queue.push({
          id: id,
          type: type,
          audio: audio,
          duration: parseInt(duration),
          trackTitle: trackTitle
        });

        // console.log(queue)
      };

      var playSong = function(id) {
        // prevents two songs from playing at the same time
        if (typeof(soundManager) !== "undefined") {
          soundManager.stopAll();
        }

        if (queue[0].type == "sc") {
          $("#soundcloud").empty();
          var currentItem = queue[0].id;
          SC.get("/tracks/" + currentItem, function(track) {
              var waveform = new Waveform({
                container: document.getElementById("soundcloud"),
                innerColor: "#333",
                width: ($('#player_container').width()) * 0.9,
                interpolate: false
              });

              var data = [];

              var ctx = waveform.context;

              var gradient = ctx.createLinearGradient(0, 0, 0, waveform.height);
              gradient.addColorStop(0.0, "#f60");
              gradient.addColorStop(1.0, "#ff1b00");
              waveform.innerColor = gradient;

              var i = 0;
              setInterval(function() {
                data.push(Math.cos(i++/25) - 0.2 + Math.random()*0.3);
                  waveform.update({
                    data: data
                  });
                }, 50);

                waveform.dataFromSoundCloudTrack(track);
                isPlaying = true;
                // var streamOptions = waveform.optionsForSyncedStream();
                SC.stream(track.uri, {
                  onfinish: function() {
                    isPlaying = false;
                    $("#queue_container ul button:first-child").remove();
                    queue.shift();
                    playSong();
                  }
                }, function(stream) {
                  window.exampleStream = stream.play();
                });
              });
            }
          }


          var skipSong = function() {
            // when a button is toggled

          }

          $("#query_song_list").on("click", ".track_title", function() {
            var $deleteListTag = $(this).parent();
            $("#queue_container ul").append($(this))
            $deleteListTag.remove()
            addSongsToQueue();

            if ((queue.length === 1) || (isPlaying === false)) {
              playSong();
            }
          })
});