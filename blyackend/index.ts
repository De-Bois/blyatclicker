import 'dotenv/config';
import express from 'express';
import { createServer } from 'node:http';
import { Server } from 'socket.io';

const app = express();
app.use(express.static('../blyue/dist'));

const server = createServer(app);
const io = new Server(server);

app.get('/', (req, res) => {
  res.sendFile('../blyue/dist/index.html');
});

io.on('connection', (socket) => {
  console.log('a user connected');
  console.log('user sid is: ', socket.id);

  socket.on('click', (msg) => {
    console.log('click: ' + msg);
    socket.emit('click', false);
  })

  socket.on('disconnect', () => {
    console.log('user disconnected');
  });
});

server.listen(process.env.PORT, () => {
  console.log(`Server running at http://localhost:${process.env.PORT}/`);
});
