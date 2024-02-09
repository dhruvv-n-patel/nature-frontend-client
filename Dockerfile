
FROM node:14 AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .
RUN npm run build:css
FROM nginx:alpine
COPY --from=builder /app/css /usr/share/nginx/html/css


EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
