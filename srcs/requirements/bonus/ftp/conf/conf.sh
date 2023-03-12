#!/bin/bash

# # Starting the vsftpd service.
# service vsftpd start;

# # Adding a user with no extra information.
# adduser --disabled-login --gecos "" $FTP_user;

# # Setting the password for the user.
# echo "$FTP_user:$FTP_password" | chpasswd;

# # Creating a directory called ftp in the home directory of the user.
# mkdir -p /home/$FTP_user/ftp;

# # Changing the ownership of the directory to the user.
# chown -R $FTP_user:FTP_user /home/$FTP_user/ftp;

# # Removing the write permission for all users.
# chmod a-w /home/$FTP_user/ftp;

# echo $FTP_user >> /etc/vsftpd.userlist;

# # Enabling the local user to access the FTP server.
# echo "local_enable=YES" >> /etc/vsftpd.conf;

# # Disabling the write permission for all users.
# echo "write_enable=YES" >> /etc/vsftpd.conf;

# # Restricting (jail) the user to the home directory.
# echo "chroot_local_user=Yes" >> /etc/vsftpd.conf;

# # Allowing the user to write to the home directory.
# echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;

# # Setting the home directory of the user to the ftp directory.
# echo "secure_chroot_dir=/home/$FTP_user/ftp" >> /etc/vsftpd.conf;

# # Setting the minimum port number for passive mode.
# echo "pasv_min_port=30000" >> /etc/vsftpd.conf;

# # Setting the maximum port number for passive mode.
# echo "pasv_max_port=30009" >> /etc/vsftpd.conf;

# echo "pasv_enable=YES" >> /etc/vsftpd.conf;

# # Enabling the userlist.
# echo "userlist_enable=YES" >> /etc/vsftpd.conf;

# # A file that contains a list of users that are allowed to access the FTP server.
# echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf;

# # set the users in the userlist that are not allowed to access the FTP server.
# echo "userlist_deny=NO" >> /etc/vsftpd.conf;

# # Stopping the vsftpd service.
# service vsftpd stop;

# # Executing the command that is passed as an argument to the container.
# exec "$@";

# start vsftpd service
service vsftpd start

# create ftp user
adduser --gecos "" $FTP_USER 

# set password for ftp user
echo "$FTP_USER:$FTP_password" | chpasswd

# Create the ftp folder
mkdir -p /home/$FTP_USER/ftp

# set its ownership
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp

# Remove write permissions
chmod a-w /home/$FTP_USER/ftp 

# disables anonymous login to the FTP server
echo "anonymous_enable=NO" >> /etc/vsftpd.conf;

# enables write permissions for the FTP users.
echo "write_enable=YES" >> /etc/vsftpd.conf;

# sets the chroot jail for local users to their home directory
echo "chroot_local_user=YES" >> /etc/vsftpd.conf;

# allows write access for local within their chroot jail
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf;

# set the FTP_USER as user substitution token
echo "user_sub_token=$FTP_USER" >> /etc/vsftpd.conf

# enables local user login
echo "local_enable=YES" >> /etc/vsftpd.conf

# line sets the FTP root directory for the local user to /home/$FTP_USER/ftp
echo "local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf

# sets the minimum port for passive mode data connections
echo "pasv_min_port=30000" >> /etc/vsftpd.conf

# sets the maximum port for passive mode data connections
echo "pasv_max_port=30009" >> /etc/vsftpd.conf

# enables the use of the userlist_file option
echo "userlist_enable=YES" >> /etc/vsftpd.conf

# sets the path to the userlist file
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

# sets that the file's contents will be used to specify users who are NOT allowed to log in
echo "userlist_deny=NO" >> /etc/vsftpd.conf

# appends the value of the FTP_USER variable to the userlist file.
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

# stop the service of vsftpd
service vsftpd stop

exec "$@"
