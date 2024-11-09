import jwt from "jsonwebtoken";
import { responseError } from "./response.helper.js";

const { TokenExpiredError, JsonWebTokenError } = jwt;

export const handlerError = (err, req, res, next) => {
  console.log(`Error at`, err);
  if (err instanceof JsonWebTokenError) err.code = 401;
  if (err instanceof TokenExpiredError) err.code = 403;

  const resData = responseError(err.message, err.code);
  res.status(resData.code).json(resData);
};

export class BadRequestError extends Error {
  constructor(message = "BadRequestError") {
    super(message);
    this.code = 400;
  }
}

export class ForbiddenError extends Error {
  constructor(message = "ForbiddenError") {
    super(message);
    this.code = 403;
  }
}

export class UnauthorizedError extends Error {
  constructor(message = "UnauthorizedError") {
    super(message);
    this.code = 401;
  }
}

export class ConflictError extends Error {
  constructor(message = "ConflictError") {
    super(message);
    this.code = 409;
  }
}
