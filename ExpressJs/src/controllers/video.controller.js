import {
  responseError,
  responseSuccess,
} from "../common/helpers/response.helper.js";
import videoService from "../services/video.service.js";

const videoController = {
  listVideo: async (req, res, next) => {
    try {
      const result = await videoService.listVideo(req);

      const resData = responseSuccess(result, `Success getting list video`);

      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },
  videoType: async (req, res, next) => {
    try {
      const result = await videoService.videoType();

      const resData = responseSuccess(result, `Success getting video type`);

      res.status(resData.code).json(resData);
    } catch (error) {
      next(error);
    }
  },
};

export default videoController;
