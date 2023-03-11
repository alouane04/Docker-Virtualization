#!/bin/bash

# Starting the vsftpd service.
service vsftpd start;

# Adding a user with no extra information.
adduser --disabled-login --gecos "" $FTP_user;

# Setting the password for the user.
echo "$FTP_user:$FTP_password" | chpasswd;

# Creating a directory called ftp in the home directory of the user.
mkdir -p /home/$FTP_user/ftp;

# Changing the ownership of the directory to the user.
chown -R $FTP_user:FTP_user /home/$FTP_user/ftp;

# Removing the write permission for all users.
chmod a-w /home/$FTP_user/ftp;

echo $FTP_user >> /etc/vsftpd.userlist;

# Enabling the local user to access the FTP server.
echo "local_enable=YES" >> /etc/vsftpd.conf;

# Disabling the write permission for all users.
echo "write_enable=YES" >> /etc/vsftpd.conf;

# Restricting (jail) the user to the home directory.
echo "chroot_local_user=Yes" >> /etc/vsftpd.conf;

# Allowing the user to write to the home directory.
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;

# Setting the home directory of the user to the ftp directory.
echo "secure_chroot_dir=/home/$FTP_user/ftp" >> /etc/vsftpd.conf;

# Setting the minimum port number for passive mode.
echo "pasv_min_port=30000" >> /etc/vsftpd.conf;

# Setting the maximum port number for passive mode.
echo "pasv_max_port=30009" >> /etc/vsftpd.conf;

echo "pasv_enable=YES" >> /etc/vsftpd.conf;

# Enabling the userlist.
echo "userlist_enable=YES" >> /etc/vsftpd.conf;

# A file that contains a list of users that are allowed to access the FTP server.
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf;

# set the users in the userlist that are not allowed to access the FTP server.
echo "userlist_deny=NO" >> /etc/vsftpd.conf;

# Stopping the vsftpd service.
service vsftpd stop;

# Executing the command that is passed as an argument to the container.
exec "$@";
