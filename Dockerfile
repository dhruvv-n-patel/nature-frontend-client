# Use the official Nginx image as the base image
FROM nginx:latest
# Copy the index.html file and other directories from the current directory into the Nginx default public directory
COPY index.html /usr/share/nginx/html/
COPY css /usr/share/nginx/html/css/
COPY img /usr/share/nginx/html/image/
COPY sass /usr/share/nginx/html/sass/
COPY package.json /usr/share/nginx/html/sass/
# Expose port 80 to the outside world
EXPOSE 80

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
