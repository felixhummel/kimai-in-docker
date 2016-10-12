This fetches Kimai and unzips to ``html``:

    make html

Start the containers:

    docker-compose up

Open [http://localhost:8080/](http://localhost:8080/). DB-Info:

- Host: `mysql`
- User: `kimai`
- Pass: `kimai`
- DB: `kimai`

See `docker-entrypoint-initdb.d/001_create.sql`.
