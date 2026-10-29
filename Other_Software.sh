#this script should ask the user for each of the following and if the user awnsers y then it shoud delete it, if the user says n then it should skip that saoftware and move on to the next one.
#this script should be called and run by CP.sh and it should purge the system of the following:
#nmap zenmap apache2 nginx lighttpd wireshark tcpdump netcat-traditional nikto ophcrack

#!/bin/bash

# Function to purge software
purge_software() {
    software=$1
    echo "Are you sure you want to purge $software? (y/n)"
    read -r response
    if [[ "$response" == "y" ]]; then
        echo "Purging $software..."
        sudo apt-get purge -y "$software"
        echo "$software purged."
    else
        echo "Skipping $software."
    fi
}   

# Main script
software_list=(
    "nmap"
    "zenmap"
    "apache2"
    "nginx"
    "lighttpd"
    "wireshark"
    "tcpdump"
    "netcat-traditional"
    "nikto"
    "ophcrack"
)   

# Loop through the software list and purge each one
for software in "${software_list[@]}"; do
    purge_software "$software"
done    

echo "Other Software removal process completed."