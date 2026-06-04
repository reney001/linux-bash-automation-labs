#!/bin/bash

check_cpu() {
    echo ""
    echo "=============================="
    echo "       CPU USAGE REPORT"
    echo "=============================="
    ps aux --sort=-%cpu | head -10
    echo ""
    echo "--- CPU Load Average ---"
    uptime
    echo ""
}

check_ram() {
    echo ""
    echo "=============================="
    echo "       RAM USAGE REPORT"
    echo "=============================="
    free -h
    echo ""
    grep -E "MemTotal|MemFree|MemAvailable|SwapTotal|SwapFree" /proc/meminfo
    echo ""
}

restart_nginx() {
    echo ""
    echo "=============================="
    echo "      RESTARTING NGINX"
    echo "=============================="
    if sudo systemctl restart nginx 2>/dev/null; then
        echo "[SUCCESS] nginx restarted."
        sudo systemctl status nginx --no-pager | head -15
    else
        echo "[INFO] nginx may not be installed."
    fi
    echo ""
}

backup_logs() {
    echo ""
    echo "=============================="
    echo "       BACKING UP LOGS"
    echo "=============================="
    BACKUP_DIR="/tmp/log_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    sudo cp -r /var/log/*.log "$BACKUP_DIR/" 2>/dev/null
    echo "[SUCCESS] Logs backed up to: $BACKUP_DIR"
    ls -lh "$BACKUP_DIR/"
    echo ""
}

show_menu() {
    echo ""
    echo "=============================="
    echo "    DevOps Management Tool"
    echo "=============================="
    echo "  1. Check CPU"
    echo "  2. Check RAM"
    echo "  3. Restart nginx"
    echo "  4. Backup logs"
    echo "  5. Exit"
    echo "=============================="
    echo -n "Enter your choice [1-5]: "
}

while true; do
    show_menu
    read choice
    case $choice in
        1) check_cpu ;;
        2) check_ram ;;
        3) restart_nginx ;;
        4) backup_logs ;;
        5) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option. Try 1-5." ;;
    esac
done
