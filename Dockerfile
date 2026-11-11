# This tells Docker to pull the official Nginx image as the base
FROM nginx:alpine

# (Optional) Copy your HTML files into Nginx's web folder
COPY ./index.html /usr/share/nginx/html/

