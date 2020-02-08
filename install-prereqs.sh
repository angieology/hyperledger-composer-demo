#!/usr/bin/env bash

#Environment setup script for hyperledger on Ubuntu 16

#instal node
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt install nodejs

node -v
npm -v

#Please note: When using Ubuntu this command will fail when running in a root user shell.
#https://medium.com/@vdeturckheim/install-and-configure-nodejs-and-npm-properly-on-ubuntu-16837d02ecaa

mkdir ~/.npm-global # directory where npm will install packages
npm config set prefix '~/.npm-global' # configure npm
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.profile #add directory to path
source ~/.profile #refresh path for current session

#npm needs this to install properly
sudo apt-get install build-essential

#install composer cli
npm install -g composer-cli@0.19
npm install -g composer-rest-server@0.19

#install fabric-dev-servers Hyperledger Fabric
mkdir ~/fabric-dev-servers && cd ~/fabric-dev-servers
curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.tar.gz
tar -xvf fabric-dev-servers.tar.gz

#yarn …because its safer i guess
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get install yarn
mkdir .travis
echo "var gulp = require('gulp');
gulp.task('default', function () {
    console.log('Hello Gulp!')
});" >> .travis/gulp.js

yarn add babel
yarn add strong loop
yarn add generator-loopback

yarn install




#install tmux

sudo apt-get install tmux

#install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce

#allow permission
sudo usermod -a -G docker $USER

#install docker-composer https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
