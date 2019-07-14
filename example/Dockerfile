FROM dotlabs/apache:php7.3
RUN apt install -y libmagickwand-dev
RUN pecl install imagick && docker-php-ext-enable imagick
