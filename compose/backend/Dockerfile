FROM ubuntu:18.04

LABEL zabbix="zabbix-server"

COPY ./zabbix_pkg/ .

#ENV DBPASSWORD="password"!! should be erised and use seret  env ar from travis
ENV DBPASSWORD="password"

#added zabbix pkg
RUN dpkg -i zabbix-release*.deb
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
#install zabbix
RUN apt-get update && apt-get install -y zabbix-server-mysql
#generate db for zabbix

RUN sed  -i 's/# DBPassword=/DBPassword='$DBPASSWORD'/g' /etc/zabbix/zabbix_server.conf

ENTRYPOINT ["/bin/bash", "--", "docker-entrypoint.sh"]
