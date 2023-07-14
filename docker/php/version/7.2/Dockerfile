FROM php:7.2-fpm-alpine

COPY docker/php/installer installer 
RUN cat installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk add  --no-cache \
    gmp-dev \
    build-base \
    nano \
    freetype \
    libjpeg-turbo \
    libpng \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    jpeg-dev \
    libjpeg \
    libwebp \
    libwebp-dev \
    libzip-dev \
    autoconf \
    openssh-client \
    git \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && NUMPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NUMPROC} gd \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && pecl install xdebug-3.1.0 \
    && docker-php-ext-enable xdebug \
    && pecl install xlswriter \
    && docker-php-ext-enable xlswriter \
    && docker-php-ext-install mysqli pdo_mysql zip opcache pcntl bcmath gmp \
    && apk del --no-cache \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    && rm -rf /tmp/*

WORKDIR /app