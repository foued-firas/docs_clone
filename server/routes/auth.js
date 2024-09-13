const express = require('express');
const jwt = require("jsonwebtoken");
const User = require("../models/user");
const auth = require("../middleware/authenticate");

const authRouter = express.Router();

// Signup Route
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, profilePic } = req.body;

    // Check if the user already exists in the database
    let user = await User.findOne({ email });

    if (!user) {
      // Create a new user if they don't exist
      user = new User({
        name,
        email,
        profilePic,
      });
      user = await user.save();
    }

    // Create a JWT token
    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET || "passwordKey");

    // Respond with user data and the token
    res.json({ user, token });
  } catch (e) {
    console.error(e); // Log the error for debugging purposes
    res.status(500).json({ error: e.message });
  }
});

// Protected Route to Get User Info
authRouter.get("/", auth, async (req, res) => {
  try {
    // Find the user by ID
    const user = await User.findById(req.user);
    res.json({ user , token : req.token});
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
