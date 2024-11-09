import jwt from "jsonwebtoken";
import { ACCESS_TOKEN_SECRET } from "../constants/app.constant.js";
import prisma from "../prisma/init.prisma.js";
import { ForbiddenError, UnauthorizedError } from "../helpers/error.helper.js";

const protect = async (req, res, next) => {
  try {
    console.log(`Validate Token`);

    const accessToken = req.headers?.authorization?.split(" ")[1];
    if (!accessToken) throw new UnauthorizedError(`Token unauthorized`);
    console.log(accessToken);

    const decodeToken = jwt.verify(accessToken, ACCESS_TOKEN_SECRET);
    console.log({ decodeToken });

    const user = await prisma.users.findUnique({
      where: {
        user_id: decodeToken.user_id,
      },
    });
    if (!user) throw new ForbiddenError();

    req.user = user;

    next();
  } catch (error) {
    next(error);
  }
};

export default protect;
