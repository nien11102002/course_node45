const swaggerDocument = {
  openapi: `3.1.0`,
  info: {
    title: `Document API Cyber Media`,
    version: `1.0.0`,
  },
  servers: [
    {
      url: `http://localhost:3069`,
      description: `Server dưới local`,
    },
    {
      url: `https://google.com`,
      description: `Server đã được deploy lên prod`,
    },
  ],
  components: {
    securitySchemes: {
      longToken: {
        type: `http`,
        scheme: `bearer`,
        bearerFormat: `JWT`,
      },
    },
  },
};

export default swaggerDocument;
