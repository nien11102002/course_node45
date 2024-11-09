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

    console.log({ page, pageSize });

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
    prisma.roles.findUnique({
      where: {
        role_id: +req.params.id,
      },
    });
  },

  update: async (req) => {
    return { message: `Updated role with ID ${req.params.id}` };
  },

  remove: async (req) => {
    return { message: `Removed role with ID ${req.params.id}` };
  },
};
