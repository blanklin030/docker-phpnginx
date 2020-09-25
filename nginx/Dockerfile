FROM nginx:1.18.0-alpine
# 设置时区为上海
RUN echo -e 'https://mirrors.aliyun.com/alpine/v3.6/main/\nhttps://mirrors.aliyun.com/alpine/v3.6/community/' > /etc/apk/repositories && \
    apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata
# 工作目录
WORKDIR /var/www/html
# 主配置
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
# 项目配置
COPY ./nginx/conf.d /etc/nginx/conf.d
# 端口
EXPOSE 80
# 命令
CMD ["nginx", "-g", "daemon off;"]