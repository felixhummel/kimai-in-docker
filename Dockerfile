FROM felix/php:fpm-mysqli

COPY ./html /var/www/html
RUN chown -R www-data: /var/www/html

