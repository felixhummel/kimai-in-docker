# Install

Pull things:

    docker-compose pull

Set `KIMAI_PASSWORD_SALT`:
```
cat <<EOF > .env
KIMAI_PASSWORD_SALT=changeme
EOF
```
Start the containers:

    docker-compose up

Open [http://localhost:8080/](http://localhost:8080/). Default DB credentials:

- Host: `mysql`
- User: `kimai`
- Pass: `kimai`
- DB: `kimai`

Remove the installer:

    make remove_installer


# Update

## Do things that take a while

    docker-compose pull
    wget https://github.com/kimai/kimai/releases/download/1.1.0/kimai_1.1.0.zip

## Backups

    ssh s3 mysqldump -ukimai -pkimai kimai > /var/backups/kimai/db.sql
    ssh s3 "tar cz -C /var/www kimai" > /var/backups/kimai/files.tar.gz

## Load DB

    # start mysql
    docker-compose up -d mysql && docker-compose logs -f mysql
    # give it a minute to start up, then load the dump
    # (using docker exec for stdio)
    cat /var/backups/kimai/db.sql | docker-compose exec -T mysql mysql -ukimai -pkimai kimai
    docker-compose exec mysql mysql -ukimai -pkimai kimai
    # show tables;

## Update HTML

    tar xf /var/backups/kimai/files.tar.gz
    mv kimai/ html/
    unzip -q kimai_1.1.0.zip -d kimai_1.1.0
    cp -r kimai_1.1.0/* html/
    rm -r kimai_1.1.0/

## Check Config

    # especially $password_salt
    vi html/includes/autoconf.php

## Run and Migrate

    sudo chown -R www-data: html/
    docker-compose up -d && docker-compose logs -f

Open [http://localhost:8080/](http://localhost:8080/)

    make remove_installer

# Backup
```
docker-compose exec mysql mysqldump -ukimai -pkimai kimai > /var/backups/kimai/db.$(date +%F_%H-%M).sql
```

