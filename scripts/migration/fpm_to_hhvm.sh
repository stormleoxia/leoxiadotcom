#!/bin/sh

FPM_CONF=fpm_proxy_fcgi.conf
HHVM_CONF=hhvm_proxy_fcgi.conf
MODS_ENABLED=/etc/apache2/mods-enabled
MODS_AVAILABLE=/etc/apache2/mods-available/

REMOVED_CONF=$FPM_CONF
NEW_CONF=$HHVM_CONF

rm  $MODS_ENABLED/$REMOVED_CONF
ln -s $MODS_AVAILABLE/$NEW_CONF $MODS_ENABLED/$NEW_CONF

service php5-fpm restart
service apache2 restart
