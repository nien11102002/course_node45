import authService from "../../services/auth.service.js";
import { describe, it, beforeAll, beforeEach, afterEach } from "@jest/globals";

describe(`Register`, () => {
  beforeEach(() => {
    console.log(`Chạy trước hàm it`);
  });

  afterEach(() => {
    console.log(`Chạy sau hàm it`);
  });

  describe(`authService.register`, () => {
    it(`Case 1: Trường hợp đăng ký thành công với thông tin hợp lệ`, async () => {
      const userNew = await authService.register({
        body: {
          email: "test1@gmail.com",
          pass_word: `1234`,
          full_name: `test`,
        },
      });

      console.log({ userNew });
    });

    it(`Case 2: Nên báo lỗi nếu email đã tồn tại`, () => {});
  });
});
