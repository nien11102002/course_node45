import express from "express";
import cors from "cors";
import rootRouter from "./src/routers/root.router.js";
import { handlerError } from "./src/common/helpers/error.helper.js";

const app = express();
app.use(express.json());
app.use(cors());
app.use(rootRouter);
app.use(handlerError);

const PORT = process.env.PORT || 3088;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
