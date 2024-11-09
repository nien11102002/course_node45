import express from "express";
import likeRestaurantRouter from "./like_res.router.js";
import rateRestaurantRouter from "./rate_res.router.js";
import orderRouter from "./order.router.js";
import protect from "../common/middlewares/protect.middleware.js";

const rootRouter = express.Router();

rootRouter.get("/", (req, res, next) => {
  res.json("ok");
});

//rootRouter.use(protect);

rootRouter.use("/like-res", likeRestaurantRouter);
rootRouter.use("/rate-res", rateRestaurantRouter);
rootRouter.use("/order", orderRouter);

export default rootRouter;
