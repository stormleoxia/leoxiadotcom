#!/bin/zsh

source teamcity_env

sudo cat ../../config/etc/init.d/teamcity-agent | sed 's/#DEFINE EXPORTS/TEAMCITY_AGENT_PATH='${TEAMCITY_AGENT_PATH}'/g' > /etc/init.d/teamcity-agent 
sudo chown root:root /etc/init.d/teamcity-agen
sudo chmod 775 /etc/init.d/teamcity-agent  
sudo update-rc.d teamcity-agent defaults 
