FROM felix/builder AS builder
RUN cd /tmp \
    && wget -q https://github.com/kimai/kimai/releases/download/1.3.1/kimai_1.3.1.zip \
    && unzip -q kimai_1.3.1.zip -d html/

FROM php:7.3.4-fpm

RUN docker-php-ext-install -j$(nproc) mysqli

COPY --from=builder --chown=www-data:www-data /tmp/html /var/www/html
RUN chown www-data: /var/www/html

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

USER www-data

CMD ["php-fpm"]
