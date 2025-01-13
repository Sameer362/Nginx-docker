FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.con

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

#CMD ["nginx", "-g", "daemon off;"]

