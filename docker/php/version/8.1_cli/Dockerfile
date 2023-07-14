FROM php:8.1.16-cli-alpine

# RUN cat /installer | php -- --install-dir=/usr/local/bin --filename=composer

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
    linux-headers \
    git \
    && docker-php-ext-configure gd \
    --with-webp=/usr/include/webp --with-jpeg=/usr/include --with-freetype=/usr/include/freetype2/ \
    && NUMPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NUMPROC} gd \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && pecl install xlswriter \
    && docker-php-ext-enable xlswriter \
    && docker-php-ext-install mysqli pdo_mysql zip opcache pcntl bcmath gmp sockets\
    && apk del --no-cache \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    && rm -rf /tmp/* 

WORKDIR /app


