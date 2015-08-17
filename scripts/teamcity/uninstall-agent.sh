#!/bin/sh

update-rc.d teamcity-agent remove
rm -f /etc/init.d/teamcity-agent
