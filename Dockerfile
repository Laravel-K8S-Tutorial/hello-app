FROM existenz/webstack:7.3

RUN apk -U --no-cache add \
    php7 \
    php7-curl \
    php7-ctype \
    php7-json \
    php7-phar \
    php7-mbstring

COPY --chown=php:nginx . /www

WORKDIR /www

RUN chmod -R 775 storage
RUN chmod -R 775 bootstrap/cache

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
