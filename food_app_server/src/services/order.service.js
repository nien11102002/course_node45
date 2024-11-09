import { ConflictError } from "../common/helpers/error.helper.js";
import prisma from "../common/prisma/init.prisma.js";

export const orderService = {
  create: async (req) => {
    const { user_id, food_id, amount, code, arr_sub_id } = req.body;

    console.log(req.body);

    const newOrder = await prisma.orders.create({
      data: { user_id, food_id, amount, code, arr_sub_id },
    });
    return newOrder;
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
