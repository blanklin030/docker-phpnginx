build:
	docker build -t custom-nginx -f $(PWD)/nginx/Dockerfile .
	docker build -t custom-php -f $(PWD)/php/Dockerfile .

run:
	docker run -d --name my-php \
	-v $(PWD)/apps:/var/www/html \
	-v $(PWD)/php/logs:/usr/local/php/var/log \
	custom-php

	docker run -d --name my-nginx \
	-v $(PWD)/nginx/logs:/var/log/nginx \
	--link my-php:php-fpm \
	-p 80:80 \
	-p 8081:8081 \
	-p 8082:8082 \
	custom-nginx

remove:
	docker rm -f my-php
	docker rm -f my-nginx

compose:
	NETWORK_MODE=bridge APP_ENV=develop docker-compose up --build -d