FROM ubuntu:18.04

LABEL zabbix="zabbix-frontend"

EXPOSE 80/tcp

COPY ./zabbix_pkg/ .

#added zabbix pkg
RUN dpkg -i zabbix-release*.deb
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
#install zabbix and mysql
RUN apt-get update && apt-get install -y zabbix-frontend-php zabbix-apache-conf zabbix-agent 
#timezone changed for zabbix
RUN sed  -i 's/# php_value date.timezone Europe\/Riga/php_value date.timezone Europe\/Riga/g' /etc/zabbix/apache.conf


#start services and run: /usr/sbin/apache2ctl -DFOREGROUND
ENTRYPOINT ["/bin/bash", "--", "docker-entrypoint.sh"]