#!/bin/bash

# Check nginx status
systemctl is-active --quiet nginx

# If nginx is down
if [ $? -ne 0 ]
then
    echo "Nginx is down. Restarting..."

    sudo systemctl restart nginx

    echo "$(date) - Nginx restarted successfully." >> nginx_log.txt

    echo "ALERT: Nginx crashed and was restarted."

else
    echo "Nginx is running normally."
fi
