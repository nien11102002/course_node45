#alphine: chỉ định phiên bản node rút gọn
FROM node:20.1.0-alpine

#Thiết lập đường dẫn
WORKDIR /home/app

COPY package*.json .

RUN npm install --timeout=3000000 

COPY . .

RUN npx prisma generate

# npm run start
CMD ["npm", "run","start"]