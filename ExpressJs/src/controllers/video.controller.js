import { videoTypeModel } from "../common/sequelizes/sequelize.sequelize.js";
import videoService from "../services/video.service.js";

const videoController = {
  listVideo: async (req, res, n) => {
    const result = await videoService.listVideo();
    console.log(result);
    res.json(result);
  },

  videoType: async (req, res) => {
    const result = await videoService.videoType();
    console.log(result);

    res.json(result);
  },
};

export default videoController;
