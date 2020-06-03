Project:

Done: after pushing to master, travis build image set commit hash as tag and deploy it to GCP.

.
├── deploy.sh
├── docker
│   ├── Dockerfile
│   └── src
│       └── zabbix_pkg
│           ├── create.sql.gz
│           ├── docker-entrypoint.sh
│           └── zabbix-release_5.0-1+bionic_all.deb
└── README.md


deploy.sh  -- script which deploy or update instance with docker container
Dockerfile -- ENV DBPASSWORD="password"!! should be erised and use seret  env ar from travis
create.sql.gz --  used in Dockerfile for zabbix db_init >> zcat create.sql.gz | mysql zabbix -uzabbix -p$DBPASSWORD
docker-entrypoint.sh -- starting servies and run: /usr/sbin/apache2ctl -DFOREGROUND
zabbix-release_5.0-1+bionic_all.deb -- zabbix pkg
