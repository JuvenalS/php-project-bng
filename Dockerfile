FROM php:8.2-apache-bullseye

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Instalar extensões PHP
RUN docker-php-ext-install mysqli pdo_mysql mbstring exif pcntl bcmath gd \
    && docker-php-ext-enable mysqli

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configurar o diretório de trabalho
WORKDIR /var/www

# Ajustar permissões para garantir que o diretório tenha permissões adequadas
RUN chown -R www-data:www-data /var/www/html
