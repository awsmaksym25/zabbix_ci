#!/bin/bash

set -o pipefail
set +e

service zabbix-server start && service zabbix-server stop
sleep 15
echo "db dump start..."
zcat create.sql.gz | mysql zabbix -hdb -uzabbix -ppassword
echo "db dump done..."
/usr/sbin/zabbix_server --foreground -c /etc/zabbix/zabbix_server.conf