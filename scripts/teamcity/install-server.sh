#!/bin/zsh

source teamcity_env

sudo cat ../../config/etc/init.d/teamcity | sed 's/#DEFINE EXPORTS/TEAMCITY_BIN_PATH='${TEAMCITY_BIN_PATH}'/g' > /etc/init.d/teamcity 
sudo chown root:root /etc/init.d/teamcity
sudo chmod 775 /etc/init.d/teamcity  
sudo update-rc.d teamcity defaults 
