FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y vsftpd

COPY conf/conf.sh /

RUN chmod +x /conf.sh

ENTRYPOINT [ "/conf.sh" ]

CMD [ "usr/sbin/vsftpd" ]