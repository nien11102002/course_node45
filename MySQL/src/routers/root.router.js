import express from "express";
import restaurantLikeRouter from "./like_res.router.js";

const rootRouter = express.Router();

rootRouter.get("/", (req, res, next) => {
  res.json("ok");
});

rootRouter.use("/like-res", restaurantLikeRouter);

export default rootRouter;
