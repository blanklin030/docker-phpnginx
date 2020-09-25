FROM php:7.2-fpm-alpine

# 工作目录
WORKDIR /usr/local/php/var/log

# 设置时区为上海
RUN echo -e 'https://mirrors.aliyun.com/alpine/v3.6/main/\nhttps://mirrors.aliyun.com/alpine/v3.6/community/' > /etc/apk/repositories && \
    apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata

# 配置
COPY ./php/conf/php.ini /usr/local/etc/php/php.ini
COPY ./php/conf/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./php/conf/www.conf /usr/local/etc/php-fpm.d/www.conf

# 端口
EXPOSE 9000