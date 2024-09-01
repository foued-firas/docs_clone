const express = require("express");
const User = require("../models/user");

const authRouter = express.Router();

authRouter.post('/api/signup' ,async (req, res)=>{
    try{
        const {name , email , profilePic} = req.body; // access information

        //email already exists?
        let user =  await  User.findOne({
                email :email
            });

            if(!user){ // create new model
                user = new User({
                    email : email,
                    profilePic : profilePic, 
                    name :name, // same name (in maps)

                });
                user = await user.save(); // save it 
            }
            res.json({user}) //send data to mongoDb
            
    }catch(e){

    }
});
module.exports = authRouter;

