FROM ubuntu:16.04

# Install base packages
RUN apt-get update && apt-get install -y \
        apache2 \
        php \
        git \
        libapache2-mod-php \
        curl \
        php-curl \
        php-gettext \
        php-mysql \
        php-mbstring \
        php-mcrypt \
        php-soap \
        php-xml \
        php-zip

# Install Apache Modules
RUN a2enmod rewrite

# Install Composer
COPY composer-1.2.1.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

COPY apache2-foreground /usr/local/bin/
WORKDIR /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
