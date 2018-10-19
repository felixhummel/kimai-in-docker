# Install

Build things:
```
docker-compose build
```

Set `KIMAI_PASSWORD_SALT`:
```
cat <<EOF > .env
KIMAI_PASSWORD_SALT=changeme
EOF
```

Start the containers:
```
docker-compose up -d
```

Open [http://localhost:8080/](http://localhost:8080/) to launch the installer.

Default DB credentials:

- Host: `mysql`
- User: `kimai`
- Pass: `kimai`
- DB: `kimai`

Default user/pw: `admin` / `changeme`

Remove the installer:
```
docker-compose run --rm fpm rm -r installer/
```


# Database Maintenance

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

