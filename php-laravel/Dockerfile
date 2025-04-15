# Use an official PHP image as the base
FROM php:8.2-apache

# Set the working directory inside the container
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
    && apt-get clean

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel CLI globally
RUN composer global require laravel/installer

# Install livewire
# RUN composer require livewire/livewire

# Add Composer's global binaries to PATH
ENV PATH="$PATH:/root/.composer/vendor/bin"

# Expose port 8000 for Laravel's development server
EXPOSE 8000

# Default command to keep the container running
CMD ["bash"]