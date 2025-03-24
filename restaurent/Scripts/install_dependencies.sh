#!/bin/bash
# Update system and install dependencies
sudo yum update -y
sudo yum install -y python3 python3-pip
pip3 install -r /var/www/html/django_app/requirements.txt
