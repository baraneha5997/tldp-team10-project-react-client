FROM node:16-alpine as build
COPY . /app
WORKDIR /app
RUN npm install
RUN npm run build

FROM nginx:stable-alpine
COPY --from=build /app/build/ /usr/share/nginx/html
COPY --from=build /app/default.conf /etc/nginx/templates/default.conf.template
EXPOSE 80
