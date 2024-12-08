import multer from "multer";
import { v2 as cloudinary } from "cloudinary";
import { CloudinaryStorage } from "multer-storage-cloudinary";

cloudinary.config({
  cloud_name: "drjyzew8b",
  api_key: "913713217744749",
  api_secret: "XUlzLFQo0x49JVLP_ETykTcYuSU",
});

const storage = new CloudinaryStorage({
  cloudinary: cloudinary,
  params: {
    folder: "images",
  },
});

const uploadCloud = multer({ storage: storage });

export default uploadCloud;
