FROM felix/builder AS cloner
RUN git clone https://github.com/kevinpapst/kimai2.git


FROM php:fpm

RUN apt-get -y update \
    && apt-get install -y libicu-dev libpng-dev zlib1g-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) gd intl mysqli zip \
    && rm -rf /var/lib/apt/lists/*
# TODO apt-get remove *-dev

RUN cd /tmp \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin/ --filename=composer \
    && php -r "unlink('composer-setup.php');"

COPY --from=cloner --chown=www-data:www-data /kimai2 /var/www/kimai


USER www-data

RUN cd /var/www/kimai \
    && composer install --no-dev \
    && bin/console doctrine:schema:create \
    && yes | bin/console doctrine:migrations:version --add --all \
    && bin/console kimai:create-user admin admin@example.com ROLE_SUPER_ADMIN changeme

# COPY entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm"]

VOLUME ["/var/www/kimai/var/data"]
