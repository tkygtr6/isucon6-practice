#!/bin/bash
set -xe

function clean_log() {
	log_path=$1
	if [ -f $log_path ]; then
		mv $log_path $log_path.$(date "+%Y%m%d_%H%M%S")
	fi
}

if [ $1 == "isucon-server1" ]; then
	systemctl daemon-reload
	#systemctl restart redis
	systemctl restart isuda.python.service
	systemctl restart isutar.python.service
	systemctl restart isupam.service
fi

if [ $1 == "isucon-server2" ]; then
	clean_log /var/log/nginx/access.log
	clean_log /var/log/nginx/error.log
	nginx -s stop || true
	sleep 1 && nginx
fi

if [ $1 == "isucon-server3" ]; then
	clean_log /var/log/mysql/mysql.log
	clean_log /var/log/mysql/mysql-slow.sql
	systemctl restart mysql
fi

