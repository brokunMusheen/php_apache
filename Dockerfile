FROM ubuntu:16.04

# Needed to install PPAs
RUN apt-get update && apt-get install -y \
        software-properties-common

# ...so we can install PHP 5.6
RUN locale-gen en_US.UTF-8 && export LANG=en_US.UTF-8 && export LANG=C.UTF-8
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

# Install base packages
RUN apt-get update

RUN apt-get install -y \
        apache2 \
        php5.6 \
        git \
        libapache2-mod-php5.6 \
        curl \
        php5.6-curl \
        php5.6-gd \
        php5.6-gettext \
        php5.6-mbstring \
        php5.6-mcrypt \
        php5.6-mysql \
        php5.6-soap \
        php5.6-sqlite3 \
        php5.6-xdebug \
        php5.6-xml \
        php5.6-zip

# Install Apache Modules
RUN a2enmod rewrite

# Install Composer
COPY composer-1.2.1.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

COPY apache2-foreground /usr/local/bin/
COPY php.ini /etc/php/5.6/apache2/php.ini

WORKDIR /var/www/html

EXPOSE 80
EXPOSE 9000
CMD ["apache2-foreground"]
