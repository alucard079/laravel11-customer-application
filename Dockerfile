FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/html

# Install required packages and PHP extensions
RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip \
    git \
    libpq-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Install Composer globally
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install Node.js and npm (Node.js 22)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# Install npm dependencies
COPY package*.json ./
RUN npm install

# Copy the application code
COPY . .

# Expose port 9000
EXPOSE 9000

# Start the PHP-FPM server
CMD ["php-fpm"]