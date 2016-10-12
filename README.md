This fetches Kimai and unzips to ``html``:

    make html

Now start our containers:

    docker-compose up

And run [the installer](http://localhost:8080/).

Note: This is a test. Don't deploy this, because:

- mysql should use a volume
- needs manual testing first

