FROM node:slim AS build

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Create the runtime image
FROM debian:stable-20240701-slim 
RUN apt-get update && \
    apt-get install -y nginx\
                     nodejs \
                     npm \
                     supervisor

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/package.json ./
RUN npm install --only=production

COPY --from=build /usr/src/app/index.jade ./
COPY --from=build /usr/src/app/frontend.js ./ 

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY  nginx.conf /etc/nginx/nginx.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

