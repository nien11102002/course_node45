import express from "express";
import { rateRestaurantController } from "../controllers/rate_res.controller.js";

const rateRestaurantRouter = express.Router();

// CRUD Routes
rateRestaurantRouter.post("/", rateRestaurantController.create);
rateRestaurantRouter.get("/", rateRestaurantController.findAll);
rateRestaurantRouter.get(
  "/res-id/:id",
  rateRestaurantController.findAllByRestaurant
);
rateRestaurantRouter.get(
  "/user-id/:id",
  rateRestaurantController.findAllByUser
);
rateRestaurantRouter.get("/:id", rateRestaurantController.findOne);
rateRestaurantRouter.patch("/:id", rateRestaurantController.update);
rateRestaurantRouter.delete("/:id", rateRestaurantController.remove);

export default rateRestaurantRouter;
