FROM nginx:alpine

ENV VER=0.5.0

RUN apk add --no-cache --update \ 
    nginx \
    wget \
    unzip

RUN mkdir -p /www && \
    wget "https://github.com/mayswind/AriaNg/releases/download/${VER}/AriaNg-${VER}.zip" && \
    unzip -o AriaNg-${VER}.zip -d /www && \
    rm AriaNg-${VER}.zip

RUN sed -i -e 's_root\s\+/usr/share/nginx/html;_root   /www;_g' /etc/nginx/conf.d/default.conf

WORKDIR /www
