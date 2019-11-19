FROM node:13.1.0

WORKDIR /app/
COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3333

ENTRYPOINT ["node","index.js"]