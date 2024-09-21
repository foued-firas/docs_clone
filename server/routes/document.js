const express = require('express');
const Document = require('../models/document');
const documentRouter = express.Router();
const auth = require('../middleware/authenticate');
const authenticate = require('../middleware/authenticate');
documentRouter.post('/doc/create',authenticate, async(req, res)=>{
try{
        const { createAt }=req.body;

        let document =new Document ({
            uid : req.user,
            title :'Untitled Document',
            createAt,

        });
        document = await document.save();
        res.json(document);
}catch(e){
    res.status(500).json({error : e.message});

}
});
module.exports = documentRouter;