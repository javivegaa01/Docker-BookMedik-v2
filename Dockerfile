FROM php:7.4-apache
RUN docker-php-ext-install mysqli && apt-get update && apt-get install -y mariadb-client && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY bookmedik /var/www/html/
ADD script.sh /usr/local/bin/
EXPOSE 80
ENV DATABASE_USER=bookmedik
ENV DATABASE_PASSWORD=password
ENV DATABASE_HOST=server_mariadb
ENV DATABASE_NAME=bookmedik
RUN chmod +x /usr/local/bin/script.sh
CMD ["script.sh"]

