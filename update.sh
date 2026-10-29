#this script is a utility script that should update and upgrade the system and all its packages.
# it should also ask the user if there is any other software that they would like to install and then install it for them.

#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y
sudo apt-get upgrade -y     

# Ask the user for additional software to install
echo "Enter any additional software you would like to install (space-separated):"
read -r additional_software 

# Install additional software
if [ -n "$additional_software" ]; then
    echo "Installing additional software: $additional_software"
    sudo apt-get install -y $additional_software        
