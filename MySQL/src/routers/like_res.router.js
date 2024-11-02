import express from "express";

const restaurantLikeRouter = express.Router();

restaurantLikeRouter.post("/like");

export default restaurantLikeRouter;
