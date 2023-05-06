FROM php:8.2.5-fpm

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        zip \
        unzip \
        libzip-dev \
        libonig-dev \
        libmcrypt-dev \
        libpq-dev \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        curl

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql zip mbstring exif pcntl gd curl mysqli pdo_pgsql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /var/www/html

# Copy application files to the container
COPY . /var/www/html

# Install Composer dependencies
RUN composer install --no-scripts --no-autoloader

# Generate optimized autoloader
RUN composer dump-autoload --optimize

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 9000
EXPOSE 9000

CMD ["php-fpm"]

