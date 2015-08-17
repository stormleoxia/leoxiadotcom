#!/bin/zsh

source ~/.credentials.sh
cat create_db.sql | sed "s/<password>/${TEAMCITY_PWD}/g" | mysql --defaults-extra-file=/etc/mysql/debian.cnf > create_db.log
