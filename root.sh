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

npm install --global yarn

apt install python3 python3-pip -y

echo "nginx version:"
nginx -v

echo "PHP version:"
php -v

echo "node.js version:"
node -v

echo "npm version:"
npm -v

echo "Yarn version:"
yarn --version

echo "Python version:"
python3 --version

echo "pip version:"
pip3 --version

npm install -g docusaurus-init
docusaurus-init

cd innoverse-docker || exit

npm install
npm install --save-dev gh-pages

python3 "$PY_FILE"

if [ -f "./ssl_certs.sh" ]; then
    bash ./ssl_certs.sh
else
    echo "ssl_certs.sh not found."
fi

echo "All packages have been installed to run your server!"
