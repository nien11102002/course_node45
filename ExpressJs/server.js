import express from "express";
import cors from "cors";
import rootRouter from "./src/routers/root.router.js";
import { handlerError } from "./src/common/helpers/error.helper.js";
import schema from "./src/common/graphql/schema.graphql.js";
import root from "./src/common/graphql/root.graphql.js";
import { Server } from "socket.io";
import { createServer } from "node:http";
import initSocket from "./src/common/socket/init.socket.js";
import { createHandler } from "graphql-http/lib/use/express";
import { ruruHTML } from "ruru/server";

const app = express();
const server = createServer(app);

app.use(express.json());
app.use(
  cors({
    origin: [`http://localhost:5173`, `https://google.com`],
  })
);
app.use(rootRouter);
app.use(handlerError);
app.use(express.static("."));

initSocket(server);

app.get("/ruru", (_req, res) => {
  res.type("html");
  res.end(ruruHTML({ endpoint: "/graphql" }));
});

app.all(
  "/graphql",
  createHandler({
    schema: schema,
    rootValue: root,
  })
);

const PORT = 3069;
server.listen(PORT, () => {
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
