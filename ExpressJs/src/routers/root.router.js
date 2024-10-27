import express from "express";
import videoRouter from "./video.router.js";
import authRouter from "./auth.router.js";

const rootRouter = express.Router();

rootRouter.get(`/`, (request, response, next) => {
  response.json(`ok`);
});

rootRouter.use("/video", videoRouter);

rootRouter.use("/auth", authRouter);

export default rootRouter;
