import prisma from "../prisma/init.prisma.js";

const root = {
  hello() {
    return "Hello world!";
  },
  async getListVideoType() {
    const videoTypes = await prisma.video_type.findMany();
    return videoTypes;
  },

  async createVideoType(payload) {
    return `videoTypes`;
  },
};

export default root;
