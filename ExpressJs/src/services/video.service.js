import pool from "../common/mysqls/pool.mysql2.js";
import prisma from "../common/prisma/init.prisma.js";
import videoTypeModel from "../models/video-type.model.js";

const videoService = {
  listVideo: async (req) => {
    // const [result, fields] = await pool.query("SELECT * FROM videos");
    var { page, pageSize } = req.query;

    page = +page > 0 ? +page : 1;
    pageSize = +pageSize > 0 ? +pageSize : 3;
    const totalItem = await prisma.videos.count();
    const totalPage = Math.ceil(totalItem / pageSize);

    const skip = (page - 1) * pageSize;

    //console.log({ page, pageSize });

    const videos = await prisma.videos.findMany({
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
      items: videos || [],
    };
  },

  videoType: async () => {
    // const result = await videoTypeModel.findAll();
    const result = await prisma.video_type.findMany();
    return result;
  },
};

export default videoService;
