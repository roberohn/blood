FROM node:22-alpine AS build
WORKDIR /app

COPY package*.json .
RUN npm install

COPY . .
RUN npm run build

FROM node:22-alpine AS deploy
WORKDIR /app

COPY --from=build /app/package*.json .
COPY --from=build /app/build ./build

RUN npm install

ENV PORT=3005
EXPOSE 3005
CMD ["node", "build/index.js"]
