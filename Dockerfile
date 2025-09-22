FROM node:22-alpine as build
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM node:22-alpine as deploy
WORKDIR /app
COPY --from=build /app/package*.json .
COPY --from=build /app/build .
EXPOSE 3005
CMD ["node", "build"]
