# see: https://docs.bitnami.com/aws/infrastructure/lamp/configuration/install-modules-php/
# see: https://gist.github.com/FoxCouncil/186e85f6d1b01d9bf88e2a45a4bb706f
FROM bitnami/php-fpm

RUN apt-get update && apt-get install -y \
    autoconf \
    build-essential \
    wget
RUN cd /root \
    && wget https://pecl.php.net/get/redis-6.0.2.tgz \
    && tar xzf redis-6.0.2.tgz && cd redis-6.0.2 \
    && phpize \
    && ./configure \
    && make \
    && make install
RUN echo "extension=redis.so" >> /opt/bitnami/php/etc/php.ini