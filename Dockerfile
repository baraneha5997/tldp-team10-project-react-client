FROM node:16-alpine as build
COPY . /app
WORKDIR /app
RUN npm install
RUN npm run build

FROM nginx:stable-alpine
RUN apk update && apk add nginx
WORKDIR /app
COPY --from=build /app/build /app
COPY --from=build /app/default.conf /etc/nginx/http.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
