#!/bin/bash

# It starts the vsftpd service.
service vsftpd start

# It creates a user with the name of the value of the  variable.
adduser --gecos "" $FTP_USER 

# Setting the password for the user.
echo "$FTP_USER:$FTP_password" | chpasswd

# It creates a directory named ftp in the home directory of the user.
mkdir -p /home/$FTP_USER/ftp

# It changes the owner of the directory to the user.
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp

# It removes the write permission for that file for all users.
chmod a-w /home/$FTP_USER/ftp 

# It disables anonymous login.
echo "anonymous_enable=NO" >> /etc/vsftpd.conf;

# It enables the write permission for the user.
echo "write_enable=YES" >> /etc/vsftpd.conf;

# Enabling the chroot jail for the user.
echo "chroot_local_user=YES" >> /etc/vsftpd.conf;

# It enables the write permission for the user in chroot.
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;

# It set the sub_token to user
echo "user_sub_token=$FTP_USER" >> /etc/vsftpd.conf

# It enables the local user to login.
echo "local_enable=YES" >> /etc/vsftpd.conf

# It sets the root directory for the user.
echo "local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf

# It sets the minimum port for passive mode data connections.
echo "pasv_min_port=30000" >> /etc/vsftpd.conf

# It sets the maximum port for passive mode data connections.
echo "pasv_max_port=30009" >> /etc/vsftpd.conf

# It enables the userlist feature.
echo "userlist_enable=YES" >> /etc/vsftpd.conf

# It sets the path of the file that contains the list of users who are not allowed to log in.
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

# It allows the user in userlist to log in.
echo "userlist_deny=NO" >> /etc/vsftpd.conf

# It adds the user to the userlist file.
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

# It stops the vsftpd service.
service vsftpd stop

# Used to execute the command line arguments.
exec "$@"
