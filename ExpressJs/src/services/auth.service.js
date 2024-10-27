import { BadRequestError } from "../common/helpers/error.helper.js";
import prisma from "../common/prisma/init.prisma.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
const authService = {
  register: async (req) => {
    const { email, pass_word, full_name } = req.body;
    console.log({ email, pass_word, full_name });

    const userExists = await prisma.users.findFirst({
      where: {
        email: email,
      },
    });
    if (userExists) throw new BadRequestError(`Email existed`);
    console.log({ userExists });

    const hashPass = bcrypt.hashSync(pass_word, 10);
    const userNew = await prisma.users.create({
      data: {
        email: email,
        full_name: full_name,
        pass_word: hashPass,
      },
    });

    return userNew;
  },
  login: async (req) => {
    const { email, pass_word } = req.body;
    console.log({ email, pass_word });

    const userExists = await prisma.users.findFirst({
      where: {
        email: email,
      },
      select: {
        pass_word: true,
      },
    });
    if (!userExists)
      throw new BadRequestError(
        `Email is not existed, Email or Password is not correct`
      );

    const isValidated = bcrypt.compareSync(pass_word, userExists.pass_word);

    if (!isValidated)
      throw new BadRequestError(
        `Email is not existed, Email or Password is not correct`
      );

    const accessToken = jwt.sign(
      { user_id: userExists.user_id },
      "ACCESSTOKEN_KHOA_BI_MAT",
      {
        expiresIn: "7d",
      }
    );

    return {
      accessToken: accessToken,
    };
  },
};

export default authService;
