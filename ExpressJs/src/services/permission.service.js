import prisma from "../common/prisma/init.prisma.js";

export const permissionService = {
  create: async function (req) {
    const { permission_name, endpoint, method, module } = req.body;

    console.log({ permission_name, endpoint, method, module });

    const newPermission = await prisma.permissions.create({
      data: {
        permission_name: permission_name,
        endpoint: endpoint,
        method: method,
        module: module,
      },
    });

    return newPermission;
  },

  findAll: async (req) => {
    var { page, pageSize } = req.query;

    page = +page > 0 ? +page : 1;
    pageSize = +pageSize > 0 ? +pageSize : 3;
    const totalItem = await prisma.permissions.count();
    const totalPage = Math.ceil(totalItem / pageSize);

    const skip = (page - 1) * pageSize;

    console.log({ page, pageSize });

    const permissions = await prisma.permissions.findMany({
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
      items: permissions || [],
    };
  },

  findOne: async (req) => {
    return { message: `Retrieved permission with ID ${req.params.id}` };
  },

  update: async (req) => {
    return { message: `Updated permission with ID ${req.params.id}` };
  },

  remove: async (req) => {
    return { message: `Removed permission with ID ${req.params.id}` };
  },
  groupByModule: async (req) => {
    const roleId = +req.params.id;

    const permission = await prisma.permissions.findMany({
      include: {
        role_permissions: {
          where: {
            role_id: roleId,
            is_active: true,
          },
        },
      },
    });

    return lodash.groupBy(permission, "module");
  },
};
