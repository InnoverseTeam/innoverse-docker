#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <my_domain>"
    exit 1
fi

DOMAIN=$1

apt update

apt install -y certbot python3-certbot-nginx

certbot --nginx -d $DOMAIN --non-interactive --agree-tos --email test@gmail.com

systemctl enable certbot.timer
systemctl start certbot.timer

echo "SSL created for $DOMAIN !"
