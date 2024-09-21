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

apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install docker-ce -y
systemctl start docker
systemctl enable docker

curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

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

echo "Docker version:"
docker --version

echo "Docker Compose version:"
docker-compose --version

usermod -aG docker $USER

npm install -g docusaurus-init
docusaurus-init

cd innoverse-docker || exit

npm install
npm install --save-dev gh-pages

python3 "$PY_FILE"

echo "All packages have been installed to run your server !"
