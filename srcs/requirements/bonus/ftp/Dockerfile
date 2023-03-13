FROM debian:buster

# Updating the package list, upgrading the packages and installing vsftpd.
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y vsftpd

# Copying the conf.sh file from the conf directory to the root directory of the container.
COPY conf/conf.sh /

# Making the conf.sh file executable.
RUN chmod +x /conf.sh

# Running the conf.sh file when the container is started.
ENTRYPOINT [ "/conf.sh" ]

# Running the vsftpd daemon when the container is started.
CMD [ "usr/sbin/vsftpd" ]