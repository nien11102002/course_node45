import { responseSuccess } from "../common/helpers/response.helper.js";
import { likeRestaurantService } from "../services/like_res.service.js";

export const likeRestaurantController = {
  create: async (req, res, next) => {
    try {
      console.log(req.params);

      const result = await likeRestaurantService.create(req);
      const response = responseSuccess(
        result,
        `Created likeRestaurant successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findAll: async (req, res, next) => {
    try {
      const result = await likeRestaurantService.findAll(req);
      const response = responseSuccess(
        result,
        `Retrieved all likeRestaurants successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findOne: async (req, res, next) => {
    try {
      const result = await likeRestaurantService.findOne(req);
      const response = responseSuccess(
        result,
        `Retrieved likeRestaurant #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findAllByRestaurant: async (req, res, next) => {
    try {
      const result = await likeRestaurantService.findAllByRestaurant(req);
      const response = responseSuccess(
        result,
        `Retrieved likeRestaurant #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findAllByUser: async (req, res, next) => {
    try {
      const result = await likeRestaurantService.findAllByUser(req);
      const response = responseSuccess(
        result,
        `Retrieved likeRestaurant #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  update: async (req, res, next) => {
    try {
      const result = await likeRestaurantService.update(req);
      const response = responseSuccess(
        result,
        `Updated likeRestaurant #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  remove: async (req, res, next) => {
    try {
      const result = await likeRestaurantService.remove(req);
      const response = responseSuccess(
        result,
        `Removed likeRestaurant #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },
  like: async (req, res, next) => {
    try {
      const result = await likeRestaurantService.remove(req);
      const response = responseSuccess(
        result,
        `Like/Unlike likeRestaurant #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },
};
