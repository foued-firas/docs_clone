const express = require("express");
const mongoose = require("mongoose");

const PORT = process.env.PORT | 3001 ; 

const app = express(); //initialate express

app.listen(PORT, "0.0.0.0",  ()=>{ //listen server and response & start our server // 0.0.0.0 access with any ip address
    console.log(`Connected at port ${PORT}`);
}) 