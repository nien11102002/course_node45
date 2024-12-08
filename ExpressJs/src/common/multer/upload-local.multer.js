import multer from "multer";
import fs from "fs";

fs.mkdirSync(`images`, { recursive: true });

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "images");
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);

    const fileExtension = file.originalname.slice(
      file.originalname.indexOf(`.`) + 1
    );

    cb(null, `local` + "-" + uniqueSuffix + `.${fileExtension}`);
  },
});

const uploadLocal = multer({ storage: storage });

export default uploadLocal;
