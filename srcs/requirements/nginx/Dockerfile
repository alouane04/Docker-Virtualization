FROM debian:buster

# It's updating the package list, upgrading the packages, installing nginx and openssl.
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx && apt-get install -y openssl

# It's creating a self-signed certificate.
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=ariahi.1337.ma"

# It's copying the nginx.conf file from the conf folder to the default file in the sites-available folder.
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# It's starting the nginx server and telling nginx to stay in the foreground so that Docker can track the process properly (otherwise your container will stop immediately after starting)!.
CMD ["nginx", "-g", "daemon off;"]
