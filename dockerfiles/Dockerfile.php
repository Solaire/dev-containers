# Use the official PHP image as the base
FROM php:8.2-apache

# Set the working directory inside the container
WORKDIR /workspace

# Copy shared scripts
COPY ./scripts/ /tmp/scripts/

# Install essential tools 
RUN bash /tmp/scripts/install_tools.sh

# Install PHP dependencies
RUN apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js + npm (for Inertia/Vite/etc.)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest \
    && npm cache clean --force

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

# Add a non-root user with the same UID and GID as the host user (pass via build args)
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to non-root user
USER $USERNAME

# Default command to keep the container running
CMD ["bash"]