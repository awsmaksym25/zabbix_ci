#!/bin/bash

set -o pipefail
set +e

service mysql start && service zabbix-server start && service zabbix-agent start
/usr/sbin/apache2ctl -DFOREGROUND