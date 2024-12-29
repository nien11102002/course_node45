import express from "express";
import videoRouter from "./video.router.js";
import authRouter from "./auth.router.js";
import roleRouter from "./role.router.js";
import permissionRouter from "./permission.router.js";
import swaggerUi from "swagger-ui-express";
import swaggerDocument from "../common/swaggers/init.swagger.js";
import userRouter from "./user.router.js";
import { CloudinaryStorage } from "multer-storage-cloudinary";

const rootRouter = express.Router();

rootRouter.use("/api-docs", swaggerUi.serve);
rootRouter.get("/api-docs", (req, res, next) => {
  const urlServer = `${req.protocol}://${req.get("host")}`;

  swaggerDocument.servers = [
    // ...swaggerDocument.servers,
    {
      url: urlServer,
      description: `url server deploy`,
    },
  ];

  swaggerUi.setup(swaggerDocument, {
    swaggerOptions: { persistAuthorization: true },
  })(req, res);
});

rootRouter.get(`/`, (request, response, next) => {
  response.json(`ok`);
});

rootRouter.use("/api-docs", swaggerUi.serve);
rootRouter.get("/api-docs", swaggerUi.setup(swaggerDocument));

rootRouter.use("/video", videoRouter);

rootRouter.use("/auth", authRouter);

rootRouter.use("/role", roleRouter);

rootRouter.use("/permission", permissionRouter);
rootRouter.use("/user", userRouter);

export default rootRouter;
