# Do things that take a while
```
docker-compose pull
docker-compose build
```

# First Install
Set `KIMAI_PASSWORD_SALT`:
```
cat <<EOF > .env
KIMAI_PASSWORD_SALT=changeme
EOF
```
Start the containers:
```
docker-compose up
```

Open [http://kimai.s3.localhost/](http://kimai.s3.localhost/). Default DB credentials:

- Host: `mysql`
- User: `kimai`
- Pass: `kimai`
- DB: `kimai`

Remove the installer:
```
docker-compose run --rm --entrypoint= fpm rm -rf installer
```


# Update
Check your backups:
```
ls /var/backups/kimai/autoconf.php
ls /var/backups/kimai/db.sql
```

## Configure
```
grep password_salt /var/backups/kimai/autoconf.php
vi .env
```

## Load DB
```
# start mysql
docker-compose up -d mysql && docker-compose logs -f mysql
# give it a minute to start up, then load the dump
cat /var/backups/kimai/db.sql | docker-compose exec -T mysql mysql -ukimai -pkimai kimai
docker-compose exec mysql mysql -ukimai -pkimai kimai -e 'show tables'
```

## Start Kimai and Migrate DB
```
docker-compose up -d
```

Go to [http://kimai.s3.localhost/](http://kimai.s3.localhost/) and click "START
UPDATE".

## Remove the installer:
```
docker-compose run --rm --entrypoint= fpm rm -rf installer
```

# Backup
```
docker-compose exec mysql mysqldump -ukimai -pkimai kimai > /var/backups/kimai/db.$(date +%F_%H-%M).sql
```

