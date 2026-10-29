#this is a scrip that will purge the system of the following:
#1. anything samba-related
#2. anything ftp-related
#3. anything telnet-related
#4. anything rsh-related
#5. anything nfs-related
#6. anything rpc-related
#7. anything tftp-related
#8. anything xinetd-related
#9. anything avahi-related
#10. anything cups-related
#11. anything netbios-related
#12. anything mdns-related
#13. anything zeroconf-related
#14. anything bonjour-related
#and it should ask the user if they would like to purge any other software and then purge it for them.
#but for each thing it is going to delete, before it does it should ask the user if they are sure they want to delete it and then if they say yes, it should delete it and if they say no, it should skip it and move on to the next thing.
#lastly this script should be called by CP.sh


#/bin/bash

#function to purge software
purge_software() {
    software=$1
    echo "Are you sure you want to purge $software? (yes/no)"
    read -r response
    if [[ "$response" == "yes" ]]; then
        echo "Purging $software..."
        sudo apt-get purge -y "$software"
        echo "$software purged."
    else
        echo "Skipping $software."
    fi
}   

# Main script
software_list=(
    "samba"
    "ftp"
    "telnet"
    "rsh"
    "nfs"
    "rpc"
    "tftp"
    "xinetd"
    "avahi"
    "cups"
    "netbios"
    "mdns"
    "zeroconf"
    "bonjour"
)   

# Loop through the software list and purge each one
for software in "${software_list[@]}"; do
    purge_software "$software"
done    

# Ask the user if they would like to purge any other software
echo "Would you like to purge any other software? (yes/no)"
read -r response
if [[ "$response" == "yes" ]]; then
    echo "Enter the names of the software you would like to purge (space-separated):"
    read -r additional_software
    for software in $additional_software; do
        purge_software "$software"
    done
else
    echo "No additional software will be purged."
fi  

echo "Purge process completed."