#this is a script that should run these commands then print the output.
#check for weird admins: mawk -F: '$1 == "sudo"' /etc/group
#check for weird users: mawk -F: '$3 > 999 && $3 < 65534 {print $1}' /etc/passwd
#check for empty passwords: mawk -F: '$2 == ""' /etc/passwd
#check for non-root UID 0 users: mawk -F: '$3 == 0 && $1 != "root"' /etc/passwd
#this script should also print out this information in a reliable and easy to read way.

#/bin/bash

#now print out the output in a reliable and easy to read way.
echo "Weird Admins (sudo group members):"
mawk -F: '$1 == "sudo"' /etc/group
echo "Weird Users (UID between 1000 and 65534):"
mawk -F: '$3 > 999 && $3 < 65534 {print $1}' /etc/passwd
echo "Users with Empty Passwords:"
mawk -F: '$2 == ""' /etc/passwd
echo "Non-root UID 0 Users:"
mawk -F: '$3 == 0 && $1 != "root"' /etc/passwd  
echo "checks complete."