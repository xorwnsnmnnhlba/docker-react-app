FROM node:14.16.0-alpine as builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx:1.18.0
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
