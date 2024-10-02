#!/bin/bash

PY_FILE="deployer.py"

is_installed() {
    dpkg -l | grep -qw "$1"
}

apt update && apt upgrade -y

if ! is_installed nginx; then
    apt install nginx -y
    systemctl start nginx
    systemctl enable nginx
fi

if ! is_installed certbot; then
    apt install certbot python3-certbot-nginx -y
fi

if ! is_installed php-fpm; then
    apt install php-fpm php-mysql -y
fi

if ! is_installed curl; then
    apt install curl -y
fi

if ! is_installed nodejs; then
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    apt install -y nodejs
fi

if ! npm list -g | grep -q yarn; then
    npm install --global yarn
fi

if ! is_installed python3; then
    apt install python3 -y
fi

if ! is_installed python3-pip; then
    apt install python3-pip -y
fi

if ! is_installed python3-venv; then
    apt-get install python3-venv -y
fi

if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

source venv/bin/activate
if ! pip3 show phpserialize &> /dev/null; then
    pip3 install phpserialize
fi
deactivate

if ! npm list -g | grep -q pm2; then
    npm install -g pm2
fi

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

echo "pm2 version:"
pm2 --version

if ! npm list -g | grep -q docusaurus-init; then
    npm install -g docusaurus-init
fi

if [ ! -d "innoverse-docker" ]; then
    docusaurus-init
fi

cd innoverse-docker || exit

if [ ! -d "node_modules" ]; then
    npm install
fi

if ! npm list --save-dev | grep -q gh-pages; then
    npm install --save-dev gh-pages
fi

python3 "$PY_FILE"

if [ -f "./ssl_certs.sh" ]; then
    bash ./ssl_certs.sh
else
    echo "ssl_certs.sh not found."
fi

echo "All packages have been installed to run your server!"
