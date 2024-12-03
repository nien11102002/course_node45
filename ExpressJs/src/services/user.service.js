import prisma from "../common/prisma/init.prisma.js";

export const userService = {
  create: async (req) => {
    return { message: `Retrieved user with ID ${req.params.id}` };
  },

  findAll: async (req) => {
    var { page, pageSize } = req.query;

    page = +page > 0 ? +page : 1;
    pageSize = +pageSize > 0 ? +pageSize : 3;
    const totalItem = await prisma.users.count();
    const totalPage = Math.ceil(totalItem / pageSize);

    const skip = (page - 1) * pageSize;

    //console.log({ page, pageSize });

    const users = await prisma.users.findMany({
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
      items: users || [],
    };
  },

  findOne: async (req) => {
    return { message: `Retrieved user with ID ${req.params.id}` };
  },

  update: async (req) => {
    return { message: `Updated user with ID ${req.params.id}` };
  },

  remove: async (req) => {
    return { message: `Removed user with ID ${req.params.id}` };
  },
  user: async (req) => {
    return `user`;
  },
};
