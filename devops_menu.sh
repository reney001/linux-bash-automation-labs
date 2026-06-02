#!/bin/bash

# ---- Functions ----

check_cpu() {
    echo "=== CPU Usage ==="
    top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 "%"}'
}

check_ram() {
    echo "=== RAM Usage ==="
    free -h | awk '/^Mem/ {print "Total: " $2 "  Used: " $3 "  Free: " $4}'
}

restart_nginx() {
    echo "=== Restarting Nginx ==="
    sudo systemctl restart nginx && echo "Nginx restarted successfully!" || echo "Failed to restart Nginx."
}

backup_logs() {
    echo "=== Backing Up Logs ==="
    BACKUP_DIR="/tmp/log_backup_$(date +%F_%T)"
    mkdir -p "$BACKUP_DIR"
    cp /var/log/*.log "$BACKUP_DIR" 2>/dev/null && echo "Logs backed up to $BACKUP_DIR" || echo "No logs found to back up."
}

# ---- Main Menu Loop ----

while true; do
    echo ""
    echo "=============================="
    echo "   Menu Driven DevOps Tool   "
    echo "=============================="
    echo "1. Check CPU"
    echo "2. Check RAM"
    echo "3. Restart Nginx"
    echo "4. Backup Logs"
    echo "5. Exit"
    echo "=============================="
    read -p "Enter your choice [1-5]: " choice

    case $choice in
        1) check_cpu ;;
        2) check_ram ;;
        3) restart_nginx ;;
        4) backup_logs ;;
        5) echo "Exiting... Goodbye!"; exit 0 ;;
        *) echo "Invalid option. Please choose between 1-5." ;;
    esac
done
