# php
FROM php:7.4.11-apache-buster

# timezone
RUN echo "Australia/Perth" > /etc/timezone
RUN rm -f /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

# update repo
RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

# install useful tools
RUN apt-get -y install \
	apt-utils \
	net-tools \
	openssh-server \
	autossh \
	wget \
	nano \
	vim \ 
	dialog \
	npm

# install important lib
RUN apt-get -y install \
	gnupg \
	gnupg2 \
	build-essential \
	git \
	curl \
	libcurl3-dev \
	openssl \
	unzip \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libpng-dev \
	libmemcached-dev \
	zip \
	libzip-dev \
	libgeoip-dev \
	libxml2-dev \
	libxslt-dev \
	libtidy-dev  \
	libaio1 \
	apt-file \
	libsqlite3-dev \
	libsqlite3-0 \
	libicu-dev \
	sharutils \
	tnef

# install zmq
RUN apt-get -y install libzmq3-dev \
	&& git clone git://github.com/mkoppanen/php-zmq.git \
	&& cd php-zmq \
	&& phpize \
	&& ./configure \
	&& make \
	&& make install \
	&& docker-php-ext-enable zmq

# composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install redis & memcache
RUN pecl install redis \
    && pecl install geoip-1.1.1 \
    && pecl install apcu \
    && pecl install memcached \
    && pecl install timezonedb

# install php extension
RUN docker-php-ext-install -j$(nproc) \
	calendar \
	iconv \
	bcmath \
	xml \
	pdo \
	pdo_mysql \ 
	pdo_sqlite \
	tidy \
	gettext \
	mysqli \
	simplexml \
	tokenizer \
	xsl \
	xmlwriter \
	zip \
	opcache \
	exif \
	curl \
	json \
	intl \
	gd
	
# config php extension
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-enable redis geoip apcu memcached timezonedb

# enable some module
RUN a2enmod \
	proxy \
	proxy_http \
	proxy_http2 \
	proxy_wstunnel \
	headers \
	rewrite
	
# restart apache
RUN service apache2 restart

# hide debian detail
ARG DEBIAN_FRONTEND=noninteractive
