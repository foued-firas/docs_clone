const jwt = require("jsonwebtoken");

const authenticate = (req, res, next) => {
  
  try {
    const token = req.header("x-auth-token");
  
  // If no token is provided, return an error
  if (!token) 
  return res.status(401).json({ msg: "No token, authorization denied" });
  //401 --> not authorat
    // Verify the token and decode it
    const verified = jwt.verify(token, process.env.JWT_SECRET || "passwordKey");
     if(!verified)
      return res.
      status(401)
      .json({msg:'Token verification failed ,authorization denied'})
    // Attach the user ID to the request object
    req.user = verified.id;
    req.token=token;
    
    // Proceed to the next middleware or route
    next(); //--> if every thing work go to the server 
  } catch (err) {
    res.status(500).json({error : e.message });
  }
};

module.exports = authenticate;
