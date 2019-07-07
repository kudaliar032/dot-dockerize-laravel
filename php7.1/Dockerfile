FROM php:7.1-apache

# update repos and install lib
RUN apt update -y && apt install -y libcurl4-gnutls-dev libicu-dev \
libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev \
libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev \
unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev \
libsnmp-dev libpcre3-dev libtidy-dev zip unzip gnupg libzip-dev

# install php extension
RUN pecl install mongodb-1.5.1
RUN docker-php-ext-install pdo_mysql intl gd zip bz2 opcache ldap bcmath
RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

# change vhost directory
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf && \
sed -ri -e 's!/var/www/!/var/www/html/public!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# install composer
RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/bin/composer

# enable apache2 modul
RUN a2enmod rewrite

# clean cache
RUN rm -rf /var/cache/apt/archives/* && rm -rf /tmp/*
