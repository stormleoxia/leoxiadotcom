#!/bin/zsh

cat drop_db.sql | mysql --defaults-extra-file=/etc/mysql/debian.cnf &> drop_db.log
