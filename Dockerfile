FROM node:12.14.1-alpine AS build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
# Default command for nginx is to run nginx server so we don't need to specify
