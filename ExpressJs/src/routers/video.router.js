import express from "express";
import videoController from "../controllers/video.controller.js";
import protect from "../common/middlewares/protect.middleware.js";
import checkPermissionMiddleware from "../common/middlewares/check-permission.middleware.js";

const videoRouter = express.Router();

// videoRouter.use(protect);

videoRouter.get(
  `/video-list`,
  // checkPermissionMiddleware,
  videoController.listVideo
);

videoRouter.get(`/video-type`, videoController.videoType);

export default videoRouter;
