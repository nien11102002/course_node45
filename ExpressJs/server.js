import express from "express";
import cors from "cors";
import rootRouter from "./src/routers/root.router.js";

const app = express();
app.use(express.json());
app.use(cors());
app.use(rootRouter);

const PORT = 3069;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

// app.post(`/body`, (req, res) => {
//   var body = req.body;

//   console.log(body);
//   res.json("Body");
// });

// app.get(`/patch/:id`, (req, res) => {
//   const params = req.params;

//   console.log(params.id);

//   res.json("Patch Parameter");
// });

// app.get(`/query`, (req, res) => {
//   const query = req.query;

//   console.log(query);

//   res.json("Query Parameters");
// });

// app.get(`/headers`, (request, response, next) => {
//   const headers = request.headers;
//   console.log(headers);
//   response.json(`headers`);
// });
