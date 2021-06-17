FROM existenz/webstack:7.3

COPY --chown=php:nginx . /www

RUN chmod -R 775 storage
RUN chmod -R 775 bootstrap/cache

RUN apk -U --no-cache add \
    php7-ctype \
    php7-json \
    php7-phar \
    php7-mbstring

WORKDIR /www
