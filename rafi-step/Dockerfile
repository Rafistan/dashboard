# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY src/ src/
COPY public/ public/
COPY *.js ./
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
RUN apk upgrade --update-cache --available && \
    apk add openssl && \
    rm -rf /var/cache/apk/*
COPY nginx-template.conf /etc/nginx/nginx-template.conf
COPY entrypoint.sh /app/
COPY --from=build-stage /app/dist /usr/share/nginx/html
ENTRYPOINT /app/entrypoint.sh
