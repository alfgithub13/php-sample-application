FROM php:7.4-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install pdo_mysql zip

# Configure Apache
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy composer files
COPY composer.json ./

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-scripts --no-autoloader

# Copy application files
COPY . .

# Configure Apache virtual host
COPY docker-apache-vhost.conf /etc/apache2/sites-available/000-default.conf

# Generate autoloader and create symbolic link
RUN composer dump-autoload --optimize
RUN ln -sf config-dev config

# Set permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html/logs

# Expose port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
