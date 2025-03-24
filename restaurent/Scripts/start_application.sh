#!/bin/bash
# Start the Django application using Gunicorn or your preferred app server
cd /var/www/html/django_app
gunicorn --workers 3 --bind 0.0.0.0:8000 stockmanage.wsgi:application
