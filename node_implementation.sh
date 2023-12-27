#!/bin/sh

# Install node js
cd ~
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh

sudo bash nodesource_setup.sh

sudo apt install nodejs


# Install pm2
sudo npm install -g pm2


# Configure pm2 to run Hello Wordld on startup
mkdir -p ~/code/app-dist
mv /tmp/hello_world.js ~/code/app-dist/hello_world.js
cd  ~/code/app-dist/
sudo pm2 start hello_world.js
sudo pm2 startup systemd
sudo pm2 save
sudo pm2 list