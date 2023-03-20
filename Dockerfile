FROM php:8.2-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN mkdir -p /var/www/rts-app
# Set working directory
WORKDIR /var/www/rts-app

COPY . /var/www/rts-app

COPY ./apache/default.conf /etc/apache2/sites-enabled/000-default.conf

RUN cp .env.example .env
RUN /usr/sbin/a2enmod rewrite; service apache2 reload; composer install; php artisan key:generate;
RUN chmod -R 777 /var/www/rts-app/storage; chmod -R 777 /var/www/rts-app/bootstrap/cache/

# Update DB_HOST
RUN sed -i -r "s/^(DB_HOST=).*/\1$DB_HOST/" /var/www/rts-app/.env
