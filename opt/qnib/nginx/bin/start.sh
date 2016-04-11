#!/bin/bash

if [ "X${NGINX_LIST_ROOT}" == "Xtrue" ];then
    echo ">> cp -f /opt/qnib/nginx/etc/list_root.conf /etc/nginx/default.d/root.conf"
    cp -f /opt/qnib/nginx/etc/list_root.conf /etc/nginx/default.d/root.conf
fi

/usr/sbin/nginx

