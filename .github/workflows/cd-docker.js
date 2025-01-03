// # đặt tên
// name: CD docker

// # khi nào chạy
// on:
//   workflow_run:
//     workflows: ["CI docker"]
//     types:
//       - completed

// # chạy công việc
// jobs:
//   build:
//     runs-on: node_46

//     steps:
//       - name: Xoá file .env đã cũ
//         run: sudo rm -f .env

//       - name: tạo file .env mới
//         run: |
//           echo "DATABASE_URL=mysql://root:1234@some-mysql-compose:3306/db_cyber_media" >> .env
//           echo "ACCESS_TOKEN_SECRET=ACCESS_TOKEN_KHOA_BI_MAT" >> .env
//           echo "ACCESS_TOKEN_EXPIRES=5m" >> .env
//           echo "REFRESH_TOKEN_SECRET=REFRESH_TOKEN_KHOA_BI_MAT" >> .env
//           echo "REFRESH_TOKEN_EXPIRES=7d" >> .env

//       - name: dừng và xoá container BE
//         run: |
//           sudo docker container stop cons-be_cyber_media || true
//           sudo docker container remove cons-be_cyber_media || true

//       - name: xoá image be cũ
//         run: sudo docker image remove vulebaolong/img-be_cyber_media:latest || true

//       - name: chạy lại với docker compose
//         run: sudo docker compose up -d
