Manage user accounts

Ask the user for valid usernames
Ask for valid admin usernames
Identify unauthorized users
Print the unauthorized users
Print commands to remove them from the system
Enforce password policy

Change all users’ passwords to:
!Q@W#E$R%T6y7u8i9o0p
Check for malicious / hacking tools

Run Hacking_software.sh
Check for unauthorized hacking software
Print commands to remove any found software
Update and maintain the system

Run update.sh
Update and upgrade the system
Upgrade all installed packages
Ask whether the user wants to install additional software
Install extra approved software if requested
Configure the system firewall

Run Firewall.sh
Apply firewall rules and necessary protections
Configure SSH

Run ssh_config.sh
Harden or modify sshd_config
Run security checks

Run Checks.sh
Check for things like empty passwords and non-root UID 0 accounts
Enforce PAM / authentication settings

Run PAM_settings.sh
Check for empty passwords
Update PAM-related settings
Audit logging

Enable auditd
Run auditctl -e 1
Start system auditing
Scan for media files

Run mp3_scanner.sh
Scan for .mp3 files
Purge unwanted software

Run Purge.sh
Remove unnecessary or prohibited software
Check home directory permissions

Run Home_perms.sh
Verify and correct home directory permissions
Remove other unnecessary software

Run Other_Software.sh
Remove extra software not needed for the system
Finalize the compliance run

Print a completion message saying the script finished all tasks
In short, it is supposed to be a one-stop Linux hardening script that:

validates users,
removes unauthorized accounts,
resets passwords,
scans for hacking tools,
patches the system,
configures firewall/SSH,
audits the machine,
enforces security settings,
removes unwanted software,
and checks permissions / compliance.
