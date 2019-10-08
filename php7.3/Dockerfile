FROM php:7.3-apache-stretch

# update repos and install lib
RUN apt update -y && apt install -y libcurl4-gnutls-dev libicu-dev \
  libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev \
  libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev \
  unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev \
  libsnmp-dev libpcre3-dev libtidy-dev zip unzip libzip-dev nano \
  git gnupg apt-transport-https locales libc-client-dev libkrb5-dev

# set locale
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

# add sqlserver repos and instal sql server tools
RUN curl -sS https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
  curl -sS https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
  apt update -y && ACCEPT_EULA=Y apt install -y msodbcsql17 mssql-tools && \
  echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile && \
  echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc && \
  /bin/bash -c "source ~/.bashrc"

# install php extension
RUN pecl install mongodb pdo_sqlsrv sqlsrv
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install -j$(nproc) imap pdo_mysql intl gd zip bz2 opcache ldap bcmath mysqli
RUN docker-php-ext-enable pdo_sqlsrv sqlsrv mongodb imap

# change vhost directory
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf && \
  sed -ri -e 's!/var/www/!/var/www/html/public!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# install composer
RUN curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/bin/composer

# install phpmyadmin
ADD https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz /tmp
RUN tar -xvf /tmp/phpMyAdmin-4.9.0.1-english.tar.gz -C / && mv /phpMyAdmin-4.9.0.1-english /pma && \
  chown www-data:www-data -R /pma && chmod +x -R /pma
ADD https://raw.githubusercontent.com/kudaliar032/dot-dockerize-laravel/master/config/config.inc.php /pma
RUN chown www-data:www-data /pma/config.inc.php && chmod 755 /pma/config.inc.php

# replace apache2 configuration default
ADD https://raw.githubusercontent.com/kudaliar032/dot-dockerize-laravel/master/config/000-default.conf \
  /etc/apache2/sites-available

# enable apache2 modul
RUN a2enmod rewrite headers

# clean cache
RUN apt autoremove && rm -rf /var/cache/apt/archives/* && rm -rf /tmp/*

# change storage directory permission and run apache2
ADD https://raw.githubusercontent.com/kudaliar032/dot-dockerize-laravel/master/config/docker-start /usr/local/bin
RUN chmod +x /usr/local/bin/docker-start
CMD ["docker-start"]
