import { responseSuccess } from "../common/helpers/response.helper.js";
import { orderService } from "../services/order.service.js";

export const orderController = {
  create: async (req, res, next) => {
    try {
      const result = await orderService.create(req);
      const response = responseSuccess(result, `Created order successfully`);
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findAll: async (req, res, next) => {
    try {
      const result = await orderService.findAll(req);
      const response = responseSuccess(
        result,
        `Retrieved all orders successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findOne: async (req, res, next) => {
    try {
      const result = await orderService.findOne(req);
      const response = responseSuccess(
        result,
        `Retrieved order #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  update: async (req, res, next) => {
    try {
      const result = await orderService.update(req);
      const response = responseSuccess(
        result,
        `Updated order #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  remove: async (req, res, next) => {
    try {
      const result = await orderService.remove(req);
      const response = responseSuccess(
        result,
        `Removed order #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },
};
