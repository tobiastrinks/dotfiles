#!/bin/bash

apt-get update \
&& apt-get install -y nginx \
&& cat >> /usr/share/nginx/reverse_proxy.conf \<< EOL
events {
  worker_connections  4096;
}
http {
  server {
    listen 80;
    listen [::]:80;
    server_name .*;
    location / {
        proxy_pass http://target:1337;
    }
  }
}
EOL

nginx -c reverse_proxy.conf \
&& export API_HOST=$(printf '%s\n' "${!API_HOST_ENV_NAME}") \
&& echo -e "127.0.0.1 \t to.be.rewrited.com" >> /etc/hosts
