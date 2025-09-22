FROM node:22-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

FROM node:22-alpine AS deploy
WORKDIR /app

COPY --from=build /app/package*.json ./
COPY --from=build /app/build/package.json ./build/

RUN npm install --omit=dev --prefix ./build

EXPOSE 3005
CMD ["node", "./build"]
