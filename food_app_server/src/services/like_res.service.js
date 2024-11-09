import { ConflictError } from "../common/helpers/error.helper.js";
import prisma from "../common/prisma/init.prisma.js";

//Vì không có yêu cầu làm đến phần token nên cách làm dưới sẽ như vậy
export const likeRestaurantService = {
  create: async (req) => {
    const { user_id, res_id } = req.body;

    console.log(req.body);

    const likeRes = await prisma.like_res.findUnique({
      where: {
        user_id_res_id: { user_id, res_id },
      },
    });

    if (likeRes)
      throw new ConflictError(`Already like the restaurant ${res_id}`);

    const newRestaurantLike = await prisma.like_res.create({
      data: { user_id, res_id, date_like: new Date() },
    });
    return newRestaurantLike;
  },

  findAll: async (req) => {
    var { page, pageSize } = req.query;

    page = +page > 0 ? +page : 1;
    pageSize = +pageSize > 0 ? +pageSize : 3;
    const totalItem = await prisma.like_res.count();
    const totalPage = Math.ceil(totalItem / pageSize);

    const skip = (page - 1) * pageSize;

    console.log({ page, pageSize });

    const likeRestaurants = await prisma.like_res.findMany({
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
      items: likeRestaurants || [],
    };
  },

  findOne: async (req) => {
    return { message: `Retrieved likeRestaurant with ID ${req.params.id}` };
  },

  findAllByRestaurant: async (req) => {
    var { page, pageSize } = req.query;

    page = +page > 0 ? +page : 1;
    pageSize = +pageSize > 0 ? +pageSize : 3;
    const totalItem = await prisma.like_res.count({
      where: {
        res_id: +req.params.id,
      },
    });
    const totalPage = Math.ceil(totalItem / pageSize);

    const skip = (page - 1) * pageSize;

    console.log({ page, pageSize });

    const likeRestaurants = await prisma.like_res.findMany({
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
      items: likeRestaurants || [],
    };
  },

  findAllByUser: async (req) => {
    var { page, pageSize } = req.query;

    page = +page > 0 ? +page : 1;
    pageSize = +pageSize > 0 ? +pageSize : 3;
    const totalItem = await prisma.like_res.count({
      where: {
        user_id: +req.params.id,
      },
    });
    const totalPage = Math.ceil(totalItem / pageSize);

    const skip = (page - 1) * pageSize;

    console.log({ page, pageSize });

    const likeRestaurants = await prisma.like_res.findMany({
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
      items: likeRestaurants || [],
    };
  },

  update: async (req) => {
    return { message: `Updated likeRestaurant with ID ${req.params.id}` };
  },

  remove: async (req) => {
    const { user_id, res_id } = req.body;

    const likeRes = await prisma.like_res.findUnique({
      where: {
        user_id_res_id: { user_id, res_id },
      },
    });

    if (!likeRes)
      throw new ConflictError(`There's no like for the restaurant ${res_id}`);

    await prisma.like_res.delete({
      where: {
        user_id_res_id: { user_id, res_id },
      },
    });
    return {
      message: `Unlike successfully for restaurant ID ${res_id}`,
    };
  },
};
