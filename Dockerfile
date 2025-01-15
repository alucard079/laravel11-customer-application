# ============================================
# 1) Base Stage: PHP 8.2-FPM with Extensions
# ============================================
FROM php:8.2-fpm AS base

# Install system packages
RUN apt-get update \
    && apt-get install -y \
       git \
       curl \
       libpng-dev \
       libonig-dev \
       libxml2-dev \
       libzip-dev \
       zip \
       unzip \
       nano \
       gnupg2

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# ============================================
# 2) Install the Latest Composer
# ============================================
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# ============================================
# 3) Install Node 20.x
# ============================================
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Create a working directory
WORKDIR /var/www/html

# Copy the entire project to container
COPY . /var/www/html

# Make sure storage and bootstrap cache directories are writable
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the default command
CMD ["php-fpm"]