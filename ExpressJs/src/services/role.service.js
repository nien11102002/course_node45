import prisma from "../common/prisma/init.prisma.js";

export const roleService = {
  create: async (req) => {
    return { message: `Created role successfully` };
  },

  findAll: async (req) => {
    var { page, pageSize } = req.query;

    page = +page > 0 ? +page : 1;
    pageSize = +pageSize > 0 ? +pageSize : 3;
    const totalItem = await prisma.roles.count();
    const totalPage = Math.ceil(totalItem / pageSize);

    const skip = (page - 1) * pageSize;

    //console.log({ page, pageSize });

    const roles = await prisma.roles.findMany({
      take: pageSize,
      skip: skip,
      orderBy: {
        created_at: "desc",
      },
    });

    return {
      page: page,
      pageSize: pageSize,
      totalItem: totalItem,
      totalPage: totalPage,
      items: roles || [],
    };
  },

  findOne: async (req) => {
    const role = await prisma.roles.findUnique({
      where: {
        role_id: +req.params.id,
      },
    });

    return role;
  },

  update: async (req) => {
    return { message: `Updated role with ID ${req.params.id}` };
  },

  remove: async (req) => {
    return { message: `Removed role with ID ${req.params.id}` };
  },
  togglePermission: async (req) => {
    const { permission_id, role_id } = req.body;

    const role_permission = await prisma.role_permissions.findFirst({
      where: {
        role_id: +role_id,
        permission_id: +permission_id,
      },
    });

    if (role_permission) {
      await prisma.role_permissions.update({
        where: {
          role_permissions_id: role_permission.role_permissions_id,
        },
        data: {
          is_active: !role_permission.is_active,
        },
      });
    } else {
      role_permission = await prisma.role_permissions.create({
        data: {
          role_id: +role_id,
          permission_id: +permission_id,
        },
      });
    }

    return { message: "Toggle permission successfully" };
  },
};
