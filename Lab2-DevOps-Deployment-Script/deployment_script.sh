#!/bin/bash

echo "Starting deployment..."

# Move to application directory
cd /var/www/html

# Pull latest code from GitHub
git pull origin main

# Restart nginx service
sudo systemctl restart nginx

# Clear cache
sudo sync
echo 3 | sudo tee /proc/sys/vm/drop_caches

# Verify nginx health
systemctl is-active --quiet nginx

if [ $? -eq 0 ]
then
    echo "Deployment successful. Nginx is running."
else
    echo "Deployment failed. Nginx is not running."
fi
