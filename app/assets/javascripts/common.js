// websocket
var socket, host;
host = "ws://165.132.173.22:8888/ws";

var connect = function(image_url) {
  try {
    socket = new WebSocket(host);
    document.getElementById("test").innerHTML = socket.readyState;
    socket.onopen = function() {
      document.getElementById("test").innerHTML = "2";
      //socket.send("hello");
      // Send the image uploaded to python server.
      socket.send(image_url);
    };

    socket.onclose = function() {
      document.getElementById("test").innerHTML = "3";
    };
    socket.onerror = function(){
        document.getElementById("test").innerHTML = "error";
    };
    socket.onmessage = function(msg) {
      document.getElementById("test").innerHTML = "success";
      
      var result = JSON.parse(msg.data);
      var url = "data:image/png;base64," + result["image"];
      
      $.ajax({
          method: "POST",
          url: "/reset_image_url",
          data: {output_url: url, classes: result["classes"]}
      })
      .done(function() { 
          window.location = "/";
      });
      
    };
  } catch(exception) {
    document.getElementById("test").innerHTML = exception.message;
    //document.getElementById("test").innerHTML = "왜안돼"
  }
};