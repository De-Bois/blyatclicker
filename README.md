# Blyatclicker

Rather not talk about this

## Plan

### Stack

#### Front-End (View)

[Vue.js](https://vuejs.org/) with TypeScript

#### API (Controller)

[Socket.io](https://socket.io/) in TypeScript ran on NodeJS

#### Database (Model)

[Prisma](https://www.prisma.io/) on the same NodeJS server

#### Deployment

Docker container through Nginx, maybe use [node2nix](https://github.com/svanderburg/node2nix)

### To-Do

- [X] Initialize DB and first migration
- [X] Initialize SocketIO and run server locally
- [X] Initialize Vue3 Project
- [X] Add Vue project static file hosting to local server.  
- [X] Build Vue project before starting server
- [ ] Remove default Vue template.
- [ ] Add simple "Hello World" button in App.vue that sends hello world to the server over a socket.
- [ ] Deploy Server and configure nginx for reverse proxy websockets.
- [ ] Start developing the actual webapp, yay!
