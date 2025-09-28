#!/bin/sh
# Create storage symlink if it doesn't exist
php artisan storage:link || true

# Run migrations if needed (optional)
# php artisan migrate --force

# Start Laravel dev server
php artisan serve --host=0.0.0.0 --port=8000
