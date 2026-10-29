#this script should be called by CP.sh and it should:
#Check for empty passwords
#and Update PAM settings

#!/bin/bash

# Check for empty passwords
echo "Checking for empty passwords..."
empty_password_users=()
while IFS=: read -r username password _; do
    if [[ -z "$password" ]]; then
        empty_password_users+=("$username")
    fi
done < /etc/shadow  

# Print users with empty passwords
if [ ${#empty_password_users[@]} -gt 0 ]; then
    echo "Users with empty passwords found:"
    for user in "${empty_password_users[@]}"; do
        echo "$user"
    done    
else
    echo "No users with empty passwords found."
fi

# Update PAM settings
echo "Updating PAM settings..."
# Backup the original PAM configuration file
sudo cp /etc/pam.d/common-password /etc/pam.d/common-password.bak   

# Update PAM settings to enforce password complexity and history
sudo sed -i 's/^password\s\+requisite\s\+pam_pwquality.so.*/password requisite pam_pwquality.so retry=3 minlen=12 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1 enforce_for_root/' /etc/pam.d/common-password
sudo sed -i 's/^password\s\+required\s\+pam_unix.so.*/password required pam_unix.so use_authtok remember=5 sha512/' /etc/pam.d/common-password  

echo "PAM settings updated successfully."
