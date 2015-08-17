#!/bin/zsh

source teamcity_env

useradd -m teamcity  
chown -R teamcity:teamcity ${TEAMCITY_BIN_PATH} 
chown -R teamcity:teamcity ${TEAMCITY_AGENT_PATH} 
