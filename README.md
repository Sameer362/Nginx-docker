1)fist create sample html page
2) give any any name index.html and some data over there
3) install nginx in amchine whichshould listne to port 80 
4) once install try to acces it from pulic-ip:80 then nginx page shold get reverted
5) after that create nginx.conf which server our website and listen to port 80 and replce existng html page with our local index.html
6) now creat DOckerfile
7)FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.con

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

#CMD ["nginx", "-g", "daemon off;"]


add these data in Dockerfile

8) use below commnad to create docker image

9) docker build -t img-name .

10) now create docker compose over there

11) version: '3.8'

services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
    images: latest-appium
    ports:
      - "80:80"
    volumes:
      - ./index.html:/usr/share/nginx/html/index.html
      - ./nginx.conf:/etc/nginx/nginx.conf

use below command to up

docker-compose up -d 
then push image to aws ecr
generate access key and secret key use below command to push image to ecr 

aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com

docker tag my-nginx-image:latest <aws_account_id>.dkr.ecr.<region>.amazonaws.com/my-nginx-repo:latest

beofre pushing create ine repo in ecr by any name 
