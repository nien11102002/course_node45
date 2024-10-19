import pool from "../common/mysqls/pool.mysql2.js";

const videoService = {
  listVideo: async () => {
    const [result, fields] = await pool.query("SELECT * FROM videos");

    return result;
  },

  videoType: async () => {
    const result = await videoTypeModel.findAll();

    return result;
  },
};

export default videoService;
