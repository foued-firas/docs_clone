const jwt = require("jsonwebtoken");

const authenticate = (req, res, next) => {
  const token = req.header("x-auth-token");
  
  // If no token is provided, return an error
  if (!token) return res.status(401).json({ msg: "No token, authorization denied" });

  try {
    // Verify the token and decode it
    const decoded = jwt.verify(token, process.env.JWT_SECRET || "passwordKey");
    
    // Attach the user ID to the request object
    req.user = decoded.id;
    
    // Proceed to the next middleware or route
    next();
  } catch (err) {
    res.status(401).json({ msg: "Token is not valid" });
  }
};

module.exports = authenticate;
