var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

//app.get('/', function(req, res){
//  res.send('<h1>Hello world</h1>');
//});

/*app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});
*/

app.get('/', function(req, res){
  res.send('<h1>Welcome Realtime Server</h1>');
});

/*io.on('connection', function(socket){
  console.log('a user connected');
});

io.on('connection', function(socket){
  console.log('a user connected');
  socket.on('disconnect', function(){
    console.log('user disconnected');
  });
});

io.on('connection', function(socket){
  socket.on('chat message', function(msg){
    console.log('message: ' + msg);
  });
});*/


io.on('connection', function(socket){
  console.log('a user connected');
   socket.on('chat message', function(msg){
    io.emit('chat message', msg);
  });
  socket.on('register', (data) => {
    // data
    console.log(data);
    io.emit('register ack', data);
  });
})



http.listen(3000, function(){
  console.log('listening on *:3000');
});