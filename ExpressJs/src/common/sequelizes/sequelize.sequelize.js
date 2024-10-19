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

const videoTypeModel = sequelize.define(
  `video_type`,
  {
    type_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    type_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    icon: {
      type: DataTypes.STRING,
    },
    created_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
      allowNull: false,
    },
    updated_at: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
      onUpdate: DataTypes.NOW,
      allowNull: false,
    },
  },
  {
    tableName: `video_type`,
    timestamps: false,
  }
);

export { videoTypeModel };
