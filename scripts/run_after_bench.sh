#!/bin/bash

SERVER1_HOSTNAME=isucon-server1
SERVER2_HOSTNAME=isucon-server2
SERVER3_HOSTNAME=isucon-server3

ssh $SERVER2_HOSTNAME "mkdir -p ~/.tmp; sudo cat /var/log/nginx/access.log > ~/.tmp/access.log"
scp $SERVER2_HOSTNAME:~/.tmp/access.log logs/
ssh $SERVER2_HOSTNAME "mkdir -p ~/.tmp; sudo cat /var/log/nginx/error.log > ~/.tmp/error.log"
scp $SERVER2_HOSTNAME:~/.tmp/error.log logs/

ssh $SERVER2_HOSTNAME "mkdir -p ~/.tmp; sudo cat /var/log/mysql/mysql-slow.sql > ~/.tmp/mysql-slow.sql"
scp $SERVER2_HOSTNAME:~/.tmp/mysql-slow.sql logs/mysql-slow2.sql
pt-query-digest logs/mysql-slow2.sql > logs/pt2.result

ssh $SERVER2_HOSTNAME "mkdir -p ~/.tmp; sudo cat /var/log/mysql/mysql.log > ~/.tmp/mysql.log"
scp $SERVER2_HOSTNAME:~/.tmp/mysql.log logs/mysql2.log


ssh $SERVER3_HOSTNAME "mkdir -p ~/.tmp; sudo cat /var/log/mysql/mysql-slow.sql > ~/.tmp/mysql-slow.sql"
scp $SERVER3_HOSTNAME:~/.tmp/mysql-slow.sql logs/mysql-slow3.sql
pt-query-digest logs/mysql-slow3.sql > logs/pt3.result

ssh $SERVER3_HOSTNAME "mkdir -p ~/.tmp; sudo cat /var/log/mysql/mysql.log > ~/.tmp/mysql.log"
scp $SERVER3_HOSTNAME:~/.tmp/mysql.log logs/mysql3.log

#ssh $SERVER3_HOSTNAME "mkdir -p ~/.tmp; sudo pt-query-digest /var/log/mariadb/mysql-slow.sql > ~/.tmp/pt.result"

