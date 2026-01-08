FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:22-alpine AS deploy
WORKDIR /app
COPY --from=build /app/package*.json ./
COPY --from=build /app/build ./build
RUN npm ci
ENV PORT=3005
EXPOSE 3005
CMD ["node", "build/index.js"]

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD wget -qO- http://localhost/ || exit 1
