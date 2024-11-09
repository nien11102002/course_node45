export const rateRestaurantService = {
  create: async (req) => {
    return { message: `Created rateRestaurant successfully` };
  },

  findAll: async (req) => {
    return { message: `Retrieved all rateRestaurants` };
  },

  findOne: async (req) => {
    return { message: `Retrieved rateRestaurant with ID ${req.params.id}` };
  },

  update: async (req) => {
    return { message: `Updated rateRestaurant with ID ${req.params.id}` };
  },

  remove: async (req) => {
    return { message: `Removed rateRestaurant with ID ${req.params.id}` };
  },
};
