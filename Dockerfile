FROM ubuntu:16.04

# Install base packages
RUN apt-get update && apt-get install -y \
        apache2 \
        php \
        libapache2-mod-php \
        php-mysql \
        php-mcrypt

# Install Apache Modules
RUN a2enmod rewrite

COPY apache2-foreground /usr/local/bin/
WORKDIR /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
