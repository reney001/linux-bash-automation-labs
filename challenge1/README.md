
# 🛠️ Challenge 1 — Menu Driven DevOps Tool

## 📋 Description
A bash script that provides a menu-driven interface to perform common DevOps tasks on a Linux system.

## 🧰 Tools & Concepts Used
- `case` statements for menu selection
- `while` loops to keep the menu running
- `functions` to organize each task cleanly

## 📁 Files
- `devops_menu.sh` — Main bash script
- `README.md` — Documentation

---

## 🚀 How to Run

```bash
chmod +x devops_menu.sh
./devops_menu.sh
```

---

## 📸 Walkthrough

### 1️⃣ The Main Menu
The script launches a clean menu with 5 options.



### 2️⃣ Check CPU
Displays the top running processes sorted by CPU usage and the system load average.

![Check CPU](screenshots/cpu.png)

---

### 3️⃣ Check RAM
Shows memory usage in human readable format including swap details.

![Check RAM](screenshots/ram.png)

---

### 4️⃣ Restart Nginx
Restarts the nginx service and shows its current status.

![Restart Nginx](screenshots/nginx.png)

---

### 5️⃣ Backup Logs
Creates a timestamped backup folder in `/tmp` and copies system logs into it.

![Backup Logs](screenshots/backup.png)

---

### 6️⃣ Exit
Cleanly exits the tool with a goodbye message.

![Exit](screenshots/exit.png)

