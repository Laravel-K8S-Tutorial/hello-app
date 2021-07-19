FROM existenz/webstack:7.3

RUN apk -U --no-cache add \
        php7 \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-phar \
        php7-session \
        php7-tokenizer \
        php7-pear \
        php7-dev \
        php7-mbstring \
        php7-pdo_mysql \
        php7-ssh2 \
        php7-xml \
        npm

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY --chown=php:nginx . /www

WORKDIR /www

RUN chmod -R 775 storage
RUN chmod -R 775 bootstrap/cache
