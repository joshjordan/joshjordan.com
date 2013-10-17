$ ->
  socket = new WebSocket "ws://#{window.location.host}/stream"

  socket.onmessage = (event) ->
    $("body").append "#{event.data}<br>"