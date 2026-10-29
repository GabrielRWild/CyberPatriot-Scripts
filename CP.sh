#this is the main script that will call all the other scripts to do user management, check for hacking software, update and upgrade the system, configure the firewall, and configure sshd_config.
#it is also a script that  does user manegment for a cyber patriot round.
#it should ask the user for valid usernames and for any valid admins.
#then it should print the unauthorized users anf the commands to remove all of them from the system at the same time.
#then the script should change all the users passwords to !Q@W#E$R%T6y7u8i9o0p
#this script should call and run the Hacking_software.sh script to check for any hacking software and print the commands to remove them from the system at the same time.
#this script should run update.sh to update and upgrade the system and all its packages. It should also ask the user if there is any other software that they would like to install and then install it for them.
#this script should run Firewall.sh to do what is in it.
#this should call and run ssh_config.sh to do what is in it.
#this script should call and run checks.sh to do what is in it.
#this should call and run Purge.sh to do what is in it.
#this script should call and run mp3_scanner.sh to do what is in it.
#this script should call and run Home_perms.sh to do what is in it.

#!/bin/bash

# Function to check if a user exists
user_exists() {
    id "$1" &>/dev/null
}

#Function to check if a user is an admin 
is_admin() {
    groups "$1" | grep -qE '(^| )sudo( |$)|(^| )admin( |$)'
}       

# Function to change a user's password
change_password() {
    echo "$1:!Q@W#E$R%T6y7u8i9o0p" | chpasswd
}       

# Main script
echo "Enter valid usernames (space-separated):"
read -r valid_users 

echo "Enter valid admin usernames (space-separated):"
read -r valid_admins

# Check for unauthorized users
unauthorized_users=()
for user in $(cut -d: -f1 /etc/passwd); do
    if ! [[ " ${valid_users[@]} " =~ " ${user} " ]] && ! [[ " ${valid_admins[@]} " =~ " ${user} " ]]; then
        unauthorized_users+=("$user")
    fi
done

# Print unauthorized users and commands to remove them
if [ ${#unauthorized_users[@]} -gt 0 ]; then
    echo "Unauthorized users found:"
    for user in "${unauthorized_users[@]}"; do
        echo "$user"
    done
    echo "Commands to remove unauthorized users:"
    for user in "${unauthorized_users[@]}"; do
        echo "sudo deluser --remove-home $user"
    done
else
    echo "No unauthorized users found."
fi 

# Change passwords for all users
for user in $(cut -d: -f1 /etc/passwd); do
    change_password "$user"
done       

# Call the Hacking_software.sh script to check for forbidden hacking software--------------------------------------------------
if [ -f "./Hacking_software.sh" ]; then
    echo "Running Hacking_software.sh to check for forbidden hacking software..."
    bash ./Hacking_software.sh
else
    echo "Hacking_software.sh script not found."                

fi

# Call the update.sh script to update and upgrade the system and install additional software-------------------------------------------------
if [ -f "./update.sh" ]; then
    echo "Running update.sh to update and upgrade the system and install additional software..."
    bash ./update.sh
else
    echo "update.sh script not found."
fi  

#call the Firewall.sh script ------------------------------------------------------------------------------------------------------------------------------
if [ -f "./Firewall.sh"]; then
    echo "Running Firewall.sh to do configure the firewall..."
    bash ./Firewall.sh
else
    echo "Firewall.sh script not found."
fi

#call the ssh_config.sh script to configure sshd_config------------------------------------------------------------------------------------------------------------------------------
if [ -f "./ssh_config.sh" ]; then
    echo "Running ssh_config.sh to configure sshd_config..."
    bash ./ssh_config.sh
else
    echo "ssh_config.sh script not found."
fi  
echo "auditing..."
apt-get install auditd && auditctl -e 1
echo "auditd installed and enabled."

#call the PAM_settings.sh script to check for empty passwords and update PAM settings------------------------------------------------------------------------------------------------------------------------------
if [ -f "./PAM_settings.sh" ]; then
    echo "Running PAM_settings.sh to check for empty passwords and update PAM settings..."
    bash ./PAM_settings.sh
else
    echo "PAM_settings.sh script not found."
fi
#call the mp3_scanner.sh script to scan for mp3 files------------------------------------------------------------------------------------------------------------------------------
if [ -f "./mp3_scanner.sh" ]; then
    echo "Running mp3_scanner.sh to scan for mp3 files..."
    bash ./mp3_scanner.sh
else
    echo "mp3_scanner.sh script not found."
fi
echo "mp3 scan completed."

#call the Purge.sh script to purge the system------------------------------------------------------------------------------------------------------------------------------
if [ -f "./Purge.sh" ]; then
    echo "Running Purge.sh to purge the system..."
    bash ./Purge.sh
else
    echo "Purge.sh script not found."
fi  
echo "system purge completed."


#call the Checks.sh script to check for empty passwords and non-root UID 0 users------------------------------------------------------------------------------------------------------------------------------
if [ -f "./Checks.sh" ]; then
    echo "Running Checks.sh to check for empty passwords and non-root UID 0 users..."
    bash ./Checks.sh
else
    echo "Checks.sh script not found."
fi
echo "checks completed."

#call the Home_perms.sh script to check for home directory permissions------------------------------------------------------------------------------------------------------------------------------
if [ -f "./Home_perms.sh" ]; then
    echo "Running Home_perms.sh to check for home directory permissions..."
    bash ./Home_perms.sh
else
    echo "Home_perms.sh script not found."
fi
echo "home directory permission check completed."


echo "Cyberpatriot management script completed."