#!/usr/bin/env sh
sh -c "echo -n '${USER}:' >> /etc/nginx/.htpasswd"
sh -c "echo '${PASSWD}' | openssl passwd -apr1 -stdin >> /etc/nginx/.htpasswd"
sh -c "echo -n 'demo:' >> /etc/nginx/.htpasswd"
sh -c "echo 'Hivesnack123$' | openssl passwd -apr1 -stdin >> /etc/nginx/.htpasswd"
envsubst '${BASEPATH}' < /etc/nginx/nginx-template.conf > /etc/nginx/nginx.conf
nginx -g 'daemon off;'
