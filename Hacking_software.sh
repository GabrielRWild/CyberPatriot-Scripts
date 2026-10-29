#this script should be run by CP.sh and it should scan for forbiden hacking soft ware such as nmap, metasploit, and hydra. It should then print the commands to remove all of them from the system at the same time.

#!/bin/bash

# List of forbidden hacking software
forbidden_software=("nmap" "metasploit" "hydra")   

# Function to check if a software is installed
is_installed() {
    command -v "$1" &>/dev/null
}  

# Main script
echo "Scanning for forbidden hacking software..."
found_software=()
for software in "${forbidden_software[@]}"; do
    if is_installed "$software"; then
        found_software+=("$software")
    fi
done    

# Print found software and commands to remove them
if [ ${#found_software[@]} -gt 0 ]; then
    echo "Forbidden hacking software found:"
    for software in "${found_software[@]}"; do
        echo "$software"
    done
    echo "Commands to remove forbidden software:"
    for software in "${found_software[@]}"; do
        echo "sudo apt-get remove --purge $software"
    done
else
    echo "No forbidden hacking software found."
fi  