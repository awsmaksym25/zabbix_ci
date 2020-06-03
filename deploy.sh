#!/bin/bash

set -e

if [ $(gcloud compute instances list |  grep "zabbix" | wc -l) -eq 0 ];
then
    gcloud compute instances create-with-container zabbix --zone $ZONE --tags=http-server --container-image shemetmaksim/zabbix:"$TRAVIS_COMMIT"
else
    gcloud compute instances update-container zabbix --zone $ZONE --container-image shemetmaksim/zabbix:"$TRAVIS_COMMIT"
fi