#!/bin/bash

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo apt update
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt update
sudo apt install -y mongodb-org
sed -i.back 's/127.0.0.1/0.0.0.0/gi' /etc/mongod.conf
sudo systemctl start mongod
sudo systemctl enable mongod

