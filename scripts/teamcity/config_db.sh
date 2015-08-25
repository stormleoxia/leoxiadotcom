#!/bin/zsh

source ~/.credentials.sh
source teamcity_env

DB_CONFIG_FILE=${TEAMCITY_BIN_PATH}/conf/database.properties
AGENT_DB_CONFIG_FILE=${TEAMCITY_AGENT_PATH}/conf/database.properties

echo 'connectionUrl=jdbc:mysql://127.0.0.1/teamcity' >  ${AGENT_DB_CONFIG_FILE}
echo 'connectionProperties.user=tcuser' >>  ${AGENT_DB_CONFIG_FILE}
echo 'connectionProperties.password='${TEAMCITY_PWD} >>  ${AGENT_DB_CONFIG_FILE}

echo 'connectionUrl=jdbc:mysql://127.0.0.1/teamcity' >  ${DB_CONFIG_FILE}
echo 'connectionProperties.user=tcuser' >>  ${DB_CONFIG_FILE}
echo 'connectionProperties.password='${TEAMCITY_PWD} >>  ${DB_CONFIG_FILE}

