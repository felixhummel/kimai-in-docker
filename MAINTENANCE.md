# Kimai
Logs:
```
docker-compose exec fpm tail -f temporary/logfile.txt
```


# Database

## Backup
```
docker-compose exec mysql mysqldump -ukimai -pkimai kimai > /var/backups/kimai/db.sql
```

## Restore
```
# start mysql
docker-compose up -d mysql && docker-compose logs -f mysql
# give it a minute to start up, then load the dump
docker-compose exec -T mysql mysql -ukimai -pkimai kimai < /var/backups/kimai/db.sql
docker-compose exec mysql mysql -ukimai -pkimai kimai -e 'show tables'
```

