
### alp

```
cat logs/access.log | alp ltsv -m "/admin/api/reports/events/.*,/api/events/.*,/api/users/.*"
```

### pt-query-digest

```
pt-query-digest logs/mysql-slow.sql > logs/pt.result
```
