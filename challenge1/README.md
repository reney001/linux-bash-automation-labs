
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

![image alt](https://github.com/reney001/linux-bash-automation-labs/blob/be4de7f8d4619bb2c7c0122b6f1c7eafb68339c1/challenge1/Snipaste_2026-06-04_15-55-34.png)


### 2️⃣ Check CPU
Displays the top running processes sorted by CPU usage and the system load average.

![image alt](https://github.com/reney001/linux-bash-automation-labs/blob/be4de7f8d4619bb2c7c0122b6f1c7eafb68339c1/challenge1/Snipaste_2026-06-04_15-56-26.png)



### 3️⃣ Check RAM
Shows memory usage in human readable format including swap details.

![image alt](https://github.com/reney001/linux-bash-automation-labs/blob/c6376240e75e402f015bb4bf19561b7a68d0cb74/challenge1/Snipaste_2026-06-04_15-58-39.png)




### 4️⃣ Restart Nginx
Restarts the nginx service and shows its current status.

![image alt](https://github.com/reney001/linux-bash-automation-labs/blob/40cc2dc6d45bba9208ff889f13d18a5f539e2c56/challenge1/Snipaste_2026-06-04_15-38-16.png)


### 5️⃣ Backup Logs
Creates a timestamped backup folder in `/tmp` and copies system logs into it.

![image alt](https://github.com/reney001/linux-bash-automation-labs/blob/7837557aa04e85b272a50085c8e93d308256ee91/challenge1/Snipaste_2026-06-04_15-57-08.png)

### 6️⃣ Exit
Cleanly exits the tool with a goodbye message.

![Exit](screenshots/exit.png)

