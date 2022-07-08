#!/bin/bash
source /app/config.sh

sudo adduser aank --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "aank:LinggaHosting" | sudo chpasswd
sudo usermod -aG sudo,adm aank

service ssh start
service nginx start

echo "set ngrok token: $NGROK_TOKEN"
ngrok authtoken $NGROK_TOKEN
echo "start ngrok service"
ngrok tcp 22 --log=stdout > ngrok.log
