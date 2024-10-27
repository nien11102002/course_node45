import { DataTypes, INTEGER, Sequelize } from "sequelize";

// SEQUELIZE
const sequelize = new Sequelize("db_media", "root", "1110", {
  host: `localhost`,
  port: `3307`,
  dialect: "mysql",
});

sequelize
  .authenticate()
  .then(() => {
    console.log("Connection Success");
  })
  .catch((err) => {
    console.log(err);

    console.log("Connection Fail");
  });

export { sequelize };
