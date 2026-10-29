#this script should enable the firewall and ask the user if they would like 
#to allow any ports through the firewall. It should then ask the user if they would like to allow any programs through the firewall. It should then run the commands to enable the firewall and allow any ports or programs through the firewall.
# this script shoud be run by CP.sh and it should enable the firewall and ask the user if they would like to allow any ports through the firewall. It should then ask the user if they would like to allow any programs through the firewall. It should then run the commands to enable the firewall and allow any ports or programs through the firewall.


#!/bin/bash

# Function to enable the firewall
enable_firewall() {    
    sudo ufw enable
}   

# Function to allow a port through the firewall
allow_port() {
    sudo ufw allow "$1"
}       

# Function to allow a program through the firewall
allow_program() {
    sudo ufw allow "$1"
}       

# Main script
echo "Enabling the firewall..."
enable_firewall 

# Ask the user if they would like to allow any ports through the firewall
echo "Would you like to allow any ports through the firewall? (yes/no)"
read -r allow_ports
if [[ "$allow_ports" == "yes" ]]; then
    echo "Enter the ports you would like to allow (space-separated):"
    read -r ports
    for port in $ports; do
        allow_port "$port"
    done
fi  

# Ask the user if they would like to allow any programs through the firewall
echo "Would you like to allow any programs through the firewall? (yes/no)"
read -r allow_programs
if [[ "$allow_programs" == "yes" ]]; then
    echo "Enter the programs you would like to allow (space-separated):"
    read -r programs
    for program in $programs; do
        allow_program "$program"
    done
fi  

# Print the status of the firewall
echo "Firewall status:"
sudo ufw status verbose 
