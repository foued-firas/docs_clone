const express = require("express");
const User = require("../models/user");

const authRouter = express.Router();

authRouter.post('api/signup' ,async (req, res)=>{
    try{
        const {name , email , profilePic} = req.body; // access information

        //email already exists?
        User.findById()
    }catch(e){

    }
})

