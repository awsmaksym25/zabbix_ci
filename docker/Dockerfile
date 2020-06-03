FROM ubuntu:18.04

LABEL zabbix="zabbix-server"

EXPOSE 80/tcp

COPY ./src/zabbix_pkg/ .

#ENV DBPASSWORD="password"!! should be erised and use seret  env ar from travis
ENV DBPASSWORD="password"

#added zabbix pkg
RUN dpkg -i zabbix-release*.deb
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
#install zabbix and mysql
RUN apt-get update && apt-get install -y mysql-server zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent 
#generate db for zabbix
RUN service mysql start && mysql -uroot -e "create database zabbix character set utf8 collate utf8_bin;  \
                                            create user zabbix@localhost identified by '$DBPASSWORD';       \
                                            grant all privileges on zabbix.* to zabbix@localhost;"       \
                                            && echo "importing zabbix_db.." && zcat create.sql.gz | mysql zabbix -uzabbix -p$DBPASSWORD
#added dbpass to zabbix server conf
RUN sed  -i 's/# DBPassword=/DBPassword='$DBPASSWORD'/g' /etc/zabbix/zabbix_server.conf
#timezone changed for zabbix
RUN sed  -i 's/# php_value date.timezone Europe\/Riga/php_value date.timezone Europe\/Riga/g' /etc/zabbix/apache.conf


#start services and run: /usr/sbin/apache2ctl -DFOREGROUND
ENTRYPOINT ["/bin/bash", "--", "docker-entrypoint.sh"]