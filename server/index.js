const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const authRouter = require("./routes/auth");
const documentRouter = require("./routes/document");
const PORT = process.env.PORT || 3001;
const app = express(); 

// Middleware
app.use(cors());
app.use(express.json());
app.use(authRouter);
app.use(documentRouter);

const DB = process.env.MONGO_URI || "mongodb+srv://firas:kUCcvUmsB221gIFY@cluster0.3clpx.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

mongoose.connect(DB)
  .then(() => { 
    console.log("Connection successful");
  })
  .catch((err) => {
    console.log(err);
  });

app.listen(PORT, "0.0.0.0", () => { 
  console.log(`Connected at port ${PORT}`);
});
