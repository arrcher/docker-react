# Build phase (builder phase)
FROM node:alpine as builder

# provided by caller
ARG proxy_http
ARG HTTP_PROXY=$proxy_http
ARG HTTPS_PROXY=$proxy_http
ARG http_proxy=$proxy_http
ARG https_proxy=$proxy_http

WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# at this point we care about all the stuff in /app/build

# Run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# nginx default command starts nginx
