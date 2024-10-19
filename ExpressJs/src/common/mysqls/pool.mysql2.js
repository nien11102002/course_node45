import mysql from "mysql2";

const pool = mysql
  .createPool({
    host: "localhost",
    user: "root",
    password: "1110",
    port: "3307",
    database: "db_media",
    timezone: `z`,
  })
  .promise();

export default pool;
