pt-query-digest logs/mysql-slow.sql > logs/pt.result
cat logs/access.log | alp ltsv -m "/admin/api/reports/events/.*,/api/events/.*,/api/users/.*"
