#!/bin/sh
set -e

# Copy .env if not present
if [ ! -f .env ]; then
  cp .env.example .env
fi

# Generate app key if not set
if ! grep -q "APP_KEY=" .env || [ -z "$(grep APP_KEY= .env | cut -d '=' -f2)" ]; then
  php artisan key:generate --force
fi

# Run migrations automatically
php artisan migrate --force || true

# Link storage
php artisan storage:link || true

# Finally run PHP-FPM
exec php-fpm
