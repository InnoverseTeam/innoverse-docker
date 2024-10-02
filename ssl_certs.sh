#!/bin/bash

if ! command -v certbot &> /dev/null; then
    echo "Certbot is not installed. Installing now..."
    
    sudo apt update
    
    sudo apt install -y certbot python3-certbot-nginx
fi

read -p "Enter your domain name (e.g., example.com): " DOMAIN

echo "Obtaining SSL certificate for $DOMAIN..."
sudo certbot --nginx -d "$DOMAIN"

if [ $? -eq 0 ]; then
    echo "SSL certificate successfully obtained for $DOMAIN."
else
    echo "Error obtaining SSL certificate."
fi
