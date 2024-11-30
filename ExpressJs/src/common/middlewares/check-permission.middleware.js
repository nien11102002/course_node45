import { ForbiddenError } from "../helpers/error.helper.js";
import prisma from "../prisma/init.prisma.js";

const checkPermission = (req, res, next) => {
  try {
    const routePath = req.route.path;
    const baseURL = req.baseUrl;
    const method = req.method;
    const role_id = req.user.role_id;
    const fullPath = `${baseURL}${routePath}`;

    if (role_id === 1) {
      next();
      return;
    }

    const role_permission = prisma.role_permissions.findFirst({
      where: {
        permissions: {
          endpoint: fullPath,
          method: method,
        },
        role_id: role_id,
        is_active: true,
      },
    });

    if (!role_permission) throw new ForbiddenError();

    next();
  } catch (error) {
    next(error);
  }
};

export default checkPermission;
