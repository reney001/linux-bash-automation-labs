#!/bin/bash

USERS_FILE="users.txt"
LOG_FILE="onboarding_log.txt"

# Function to generate random password
generate_password() {
    tr -dc 'A-Za-z0-9!@#$%' </dev/urandom | head -c 12
}

# Function to create user
create_user() {
    local username=$1
    local password=$(generate_password)

    # Create user
    if id "$username" &>/dev/null; then
        echo "User $username already exists, skipping..."
    else
        sudo useradd -m -s /bin/bash "$username"
        echo "$username:$password" | sudo chpasswd
        echo "✔ Created user: $username | Password: $password"

        # Log credentials
        echo "Username: $username | Password: $password" >> "$LOG_FILE"

        # Email credentials (requires mailutils)
        echo "Hello $username, your password is: $password" | mail -s "Your Account Credentials" "$username@localhost" 2>/dev/null || echo "  (Email skipped - mail not configured)"
    fi
}

# ---- Main ----
echo "=== Automated User Onboarding ==="

if [ ! -f "$USERS_FILE" ]; then
    echo "Error: $USERS_FILE not found!"
    exit 1
fi

while IFS= read -r user; do
    [ -z "$user" ] && continue
    create_user "$user"
done < "$USERS_FILE"

echo ""
echo "=== Onboarding Complete ==="
echo "Credentials saved to $LOG_FILE"
