import prisma from "../common/prisma/init.prisma";

export const orderService = {
  create: async (req) => {
    const order = req.body;

    console.log(req.body);

    const likeRes = await prisma.like_res.findUnique({
      where: {},
    });

    if (likeRes)
      throw new ConflictError(`Already like the restaurant ${res_id}`);

    await prisma.like_res.create({
      data: { user_id, res_id, date_like: new Date() },
    });
    return { message: `Like added successfully for restaurant ID ${res_id}` };
  },

  findAll: async (req) => {
    return { message: `Retrieved all orders` };
  },

  findOne: async (req) => {
    return { message: `Retrieved order with ID ${req.params.id}` };
  },

  update: async (req) => {
    return { message: `Updated order with ID ${req.params.id}` };
  },

  remove: async (req) => {
    return { message: `Removed order with ID ${req.params.id}` };
  },
};
