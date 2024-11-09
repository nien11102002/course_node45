import express from "express";
import { orderController } from "../controllers/order.controller.js";

const orderRouter = express.Router();

// CRUD Routes
orderRouter.post("/", orderController.create);
orderRouter.get("/", orderController.findAll);
orderRouter.get("/:id", orderController.findOne);
orderRouter.patch("/:id", orderController.update);
orderRouter.delete("/:id", orderController.remove);

export default orderRouter;
