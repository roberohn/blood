FROM node:22-alpine as build
WORKDIR /src
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

FROM node:22-alpine as deploy
WORKDIR /src
COPY --from=build /src/package*.json .
COPY --from=build /src/build .
EXPOSE 3005
CMD ["node", "build"]
