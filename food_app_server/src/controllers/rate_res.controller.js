import { responseSuccess } from "../common/helpers/response.helper.js";
import { rateRestaurantService } from "../services/rate_res.service.js";

export const rateRestaurantController = {
  create: async (req, res, next) => {
    try {
      const result = await rateRestaurantService.create(req);
      const response = responseSuccess(
        result,
        `Created rateRestaurant successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findAll: async (req, res, next) => {
    try {
      const result = await rateRestaurantService.findAll(req);
      const response = responseSuccess(
        result,
        `Retrieved all rateRestaurants successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findOne: async (req, res, next) => {
    try {
      const result = await rateRestaurantService.findOne(req);
      const response = responseSuccess(
        result,
        `Retrieved rateRestaurant #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  update: async (req, res, next) => {
    try {
      const result = await rateRestaurantService.update(req);
      const response = responseSuccess(
        result,
        `Updated rateRestaurant #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  remove: async (req, res, next) => {
    try {
      const result = await rateRestaurantService.remove(req);
      const response = responseSuccess(
        result,
        `Removed rateRestaurant #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },
};
