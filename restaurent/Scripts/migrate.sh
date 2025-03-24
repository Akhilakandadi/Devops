#!/bin/bash
# Run Django migrations
cd /var/www/html/django_app
python3 manage.py migrate
