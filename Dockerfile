
FROM node:14 as build
# Set the working directory in the container
WORKDIR /app

# Copy package.json
COPY package*.json ./

# Install dependencies
RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html
# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
