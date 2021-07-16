#!/bin/bash

sudo apt-get update -y
sudo apt-get install python3-pip -y

sudo -H pip3 install --upgrade pip
pip3 install flask

sudo apt-get update -y
sudo apt-get install nginx -y

sudo apt-get update -y
sudo apt-get install gunicorn3 -y

sudo echo "ssh-rsa AAAAB3Nza..." >> /home/ubuntu/.ssh/authorized_keys
sudo chown ubuntu: /home/ubuntu/.ssh/authorized_keys
sudo chmod 0600 /home/ubuntu/.ssh/authorized_keys
