#!/bin/bash
set -e

cd /var/www/html

php artisan migrate --force

php artisan db:seed

php artisan serve --host=0.0.0.0 --port=8000