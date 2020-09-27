FROM php:7.2-fpm-alpine

# 工作目录
WORKDIR /var/www/html

# 设置时区为上海
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

# 配置
COPY ./php/conf/php.ini /usr/local/etc/php/php.ini
COPY ./php/conf/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./php/conf/www.conf /usr/local/etc/php-fpm.d/www.conf

# 安装扩展
RUN apk add --no-cache freetype libjpeg-turbo libpng freetype-dev libjpeg-turbo-dev libpng-dev && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd  && \
    docker-php-ext-enable gd && \
    docker-php-ext-install mysqli pdo_mysql bcmath sockets && \
    apk del --no-cache  freetype-dev libjpeg-turbo-dev libpng-dev && \
    rm -rf /tmp/*

# 端口
EXPOSE 9000
