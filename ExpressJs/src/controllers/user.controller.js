import { responseSuccess } from "../common/helpers/response.helper.js";
import { userService } from "../services/user.service.js";

export const userController = {
  create: async (req, res, next) => {
    try {
      const result = await userService.create(req);
      const response = responseSuccess(result, `Created user successfully`);
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findAll: async (req, res, next) => {
    try {
      const result = await userService.findAll(req);
      const response = responseSuccess(
        result,
        `Retrieved all users successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findOne: async (req, res, next) => {
    try {
      const result = await userService.findOne(req);
      const response = responseSuccess(
        result,
        `Retrieved user #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  update: async (req, res, next) => {
    try {
      const result = await userService.update(req);
      const response = responseSuccess(
        result,
        `Updated user #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  remove: async (req, res, next) => {
    try {
      const result = await userService.remove(req);
      const response = responseSuccess(
        result,
        `Removed user #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },
  uploadAvatar: async (req, res, next) => {
    try {
      const result = await userService.uploadAvatar(req);
      const response = responseSuccess(
        result,
        `Upload avatar of user #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },
};
