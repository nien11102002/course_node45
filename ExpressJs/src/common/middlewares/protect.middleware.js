const protect = (req, res, next) => {
  console.log("Token");
  next();
};

export default protect;
