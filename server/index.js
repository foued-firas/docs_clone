const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const authRouter =require("./routes/auth")

const PORT = process.env.PORT | 3001 ; 

const app = express(); //initialate express

//midelware
app.use(express.json());
app.use(authRouter);


const DB ="mongodb+srv://firas:kUCcvUmsB221gIFY@cluster0.3clpx.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";



mongoose.connect(DB).then(()=>{ //connection to mongoDB
    console.log("Connection successful");
})
.catch((err)=>{
    console.log(err);
});

app.listen(PORT, "0.0.0.0",  ()=>{ //listen server and response & start our server // 0.0.0.0 access with any ip address
    console.log(`Connected at port ${PORT}`);

});