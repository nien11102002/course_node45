import { responseSuccess } from "../common/helpers/response.helper.js";
import { permissionService } from "../services/permission.service.js";

export const permissionController = {
  create: async (req, res, next) => {
    try {
      const result = await permissionService.create(req);
      const response = responseSuccess(
        result,
        `Created permission successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findAll: async (req, res, next) => {
    try {
      const result = await permissionService.findAll(req);
      const response = responseSuccess(
        result,
        `Retrieved all permissions successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  findOne: async (req, res, next) => {
    try {
      const result = await permissionService.findOne(req);
      const response = responseSuccess(
        result,
        `Retrieved permission #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  update: async (req, res, next) => {
    try {
      const result = await permissionService.update(req);
      const response = responseSuccess(
        result,
        `Updated permission #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },

  remove: async (req, res, next) => {
    try {
      const result = await permissionService.remove(req);
      const response = responseSuccess(
        result,
        `Removed permission #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },
  groupByModule: async (req, res, next) => {
    try {
      const result = await permissionService.remove(req);
      const response = responseSuccess(
        result,
        `Removed permission #${req.params.id} successfully`
      );
      res.status(response.code).json(response);
    } catch (err) {
      next(err);
    }
  },
};
