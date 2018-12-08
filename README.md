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


# Maintenance
See [MAINTENANCE.md](MAINTENANCE.md)
