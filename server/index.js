const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const http = require("http");
const authRouter = require("./routes/auth");
const documentRouter = require("./routes/document");
const Document = require("./models/document");

// Middleware
const PORT = process.env.PORT | 3001;


const app = express();
var server = http.createServer(app);
var io = require("socket.io")(server);


app.use(cors());
app.use(express.json());
app.use(authRouter);
app.use(documentRouter);

const DB = process.env.MONGO_URI || "mongodb+srv://firas:kUCcvUmsB221gIFY@cluster0.3clpx.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection successful!");
  })
  .catch((err) => {
    console.log(err);
  });

  io.on("connection", (socket) => {
    console.log("A user connected");
  
    socket.on("join", (documentId) => {
      console.log(`User joined document ${documentId}`);
      socket.join(documentId);
    });
    socket.on('typing',(data)=>{
      socket.broadcast.to(data.room).emit("changes",data);
       //send data to everyone excepet the sender
       
    })
  });

server.listen(PORT, "0.0.0.0", () => { 
  console.log(`Connected at port ${PORT}`);
});