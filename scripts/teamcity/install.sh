#!/bin/sh

sudo cp ../../../config/etc/init.d/teamcity /etc/init.d/
sudo chown root:root /etc/init.d/teamcity
sudo chmod 775 /etc/init.d/teamcity  
sudo update-rc.d teamcity defaults 
