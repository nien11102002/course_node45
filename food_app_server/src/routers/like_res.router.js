import express from "express";
import { likeRestaurantController } from "../controllers/like_res.controller.js";

const likeRestaurantRouter = express.Router();

// CRUD Routes
likeRestaurantRouter.post("/", likeRestaurantController.create); //like
likeRestaurantRouter.get("/", likeRestaurantController.findAll);
likeRestaurantRouter.get(
  "/res-id/:id",
  likeRestaurantController.findOneByRestaurant
);
likeRestaurantRouter.get(
  "/user-id/:id",
  likeRestaurantController.findOneByUser
);
likeRestaurantRouter.patch("/:id", likeRestaurantController.update);
likeRestaurantRouter.delete("/", likeRestaurantController.remove); //unlike

export default likeRestaurantRouter;
