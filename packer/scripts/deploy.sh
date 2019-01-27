#!/bin/bash

git clone -b monolith https://github.com/express42/reddit.git
cd reddit/
bundle install
puma -d
ps aux | grep puma

echo '[Unit]
Description=Puma service

[Service]
User=appuser
WorkingDirectory=/home/appuser/reddit
ExecStart=/usr/local/bin/puma

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/puma.service

systemctl enable puma.service

