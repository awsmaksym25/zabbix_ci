#!/bin/bash

set -e

gcloud compute instances create-with-container zabbix --zone $ZONE --tags=http-server --container-image shemetmaksim/zabbix:"$TRAVIS_COMMIT"
