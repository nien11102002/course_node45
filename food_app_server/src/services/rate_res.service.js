import prisma from "../common/prisma/init.prisma.js";

export const rateRestaurantService = {
  create: async (req) => {
    const { user_id, res_id, amount } = req.body;

    console.log(req.body);

    const newRateRes = await prisma.rate_res.create({
      data: { user_id, res_id, amount, date_rate: new Date() },
    });
    return newRateRes;
  },

  findAll: async (req) => {
    return { message: `Retrieved all rateRestaurants` };
  },

  findAllByRestaurant: async (req) => {
    var { page, pageSize } = req.query;

    page = +page > 0 ? +page : 1;
    pageSize = +pageSize > 0 ? +pageSize : 3;
    const totalItem = await prisma.rate_res.count({
      where: {
        res_id: +req.params.id,
      },
    });
    const totalPage = Math.ceil(totalItem / pageSize);

    const skip = (page - 1) * pageSize;

    console.log({ page, pageSize });

    const rateRestaurants = await prisma.rate_res.findMany({
      take: pageSize,
      skip: skip,
      where: {
        res_id: +req.params.id,
      },
    });

    return {
      page: page,
      pageSize: pageSize,
      totalItem: totalItem,
      totalPage: totalPage,
      items: rateRestaurants || [],
    };
  },

  findAllByUser: async (req) => {
    var { page, pageSize } = req.query;

    page = +page > 0 ? +page : 1;
    pageSize = +pageSize > 0 ? +pageSize : 3;
    const totalItem = await prisma.rate_res.count({
      where: {
        user_id: +req.params.id,
      },
    });

    const totalPage = Math.ceil(totalItem / pageSize);

    const skip = (page - 1) * pageSize;

    console.log({ page, pageSize });

    const rateRestaurants = await prisma.rate_res.findMany({
      take: pageSize,
      skip: skip,
      where: {
        user_id: +req.params.id,
      },
    });

    return {
      page: page,
      pageSize: pageSize,
      totalItem: totalItem,
      totalPage: totalPage,
      items: rateRestaurants || [],
    };
  },

  findOne: async (req) => {
    return { message: `Retrieved rateRestaurant with ID ${req.params.id}` };
  },

  update: async (req) => {
    return { message: `Updated rateRestaurant with ID ${req.params.id}` };
  },

  remove: async (req) => {
    return { message: `Removed rateRestaurant with ID ${req.params.id}` };
  },
};
