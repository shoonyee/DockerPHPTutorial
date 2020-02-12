FROM php:7.0-apache
COPY src/ /var/www/html/
WORKDIR /var/www/html/

#Install git
RUN apt-get update
RUN apt-get upgrade -y git
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite
#Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/  
#port
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/apache2/ports.conf &&\
  sed -i "s/<VirtualHost \*:80>/<VirtualHost \*:8080>/g" /etc/apache2/sites-enabled/000-default.conf
EXPOSE 80
