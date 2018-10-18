FROM felix/builder AS builder
RUN cd /tmp \
    && wget -q https://github.com/kimai/kimai/releases/download/1.3.1/kimai_1.3.1.zip \
    && unzip -q kimai_1.3.1.zip -d html/

FROM php:fpm

RUN docker-php-ext-install mysqli

COPY --from=builder /tmp/html /var/www/html
RUN chown -R www-data: /var/www/html

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm"]
