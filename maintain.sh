#!/bin/bash
h2yfile="/usr/bin/v2ray/h2y.dat"
v2ray_log="/var/log/v2ray"
v2ray_access_log=${v2ray_log}"/access.log"
v2ray_error_log=${v2ray_log}"/error.log"

service v2ray stop

rm -rf ${h2yfile}
wget https://raw.githubusercontent.com/ToutyRater/V2Ray-SiteDAT/master/geofiles/h2y.dat
mv h2y.dat ${h2yfile}

if [ ! -f ${v2ray_log} ]; then
    rm -rf ${v2ray_log}
    mkdir ${v2ray_log}
    touch ${v2ray_access_log}
    touch ${v2ray_error_log}
fi

service v2ray start
