#!/bin/bash

PY_FILE="deployer.py"

apt update && sudo apt upgrade -y

apt install nginx -y

systemctl start nginx
systemctl enable nginx

apt install certbot python3-certbot-nginx -y

apt install php-fpm php-mysql -y

apt install curl -y

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt install -y nodejs

apt install python3 python3-pip -y

apt install git -y

echo "nginx version:"
nginx -v

echo "PHP version:"
php -v

echo "node.js version:"
node -v

echo "npm version:"
npm -v

echo "Python version:"
python3 --version

echo "pip version:"
pip3 --version

echo "git version:"
git --version

npm install -g docusaurus-init
docusaurus-init

cd innoverse-docker || exit

npm install
npm install --save-dev gh-pages

python3 "$PY_FILE"
