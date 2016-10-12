This fetches Kimai, unzips to `html` and chowns to `www-data`:

    make html

Edit db credentials (or leave as is):

    vi docker-entrypoint-initdb.d/001_create.sql

Start the containers:

    docker-compose up

Open [http://localhost:8080/](http://localhost:8080/). Default DB credentials:

- Host: `mysql`
- User: `kimai`
- Pass: `kimai`
- DB: `kimai`

Remove the installer:

    make remove_installer

