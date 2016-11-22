FROM hub.c.163.com/library/debian:8.6
MAINTAINER netease

# Environments
ENV TIMEZONE	Asia/Shanghai

# 更新软件源
RUN echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib" >>/etc/apt/sources.list
RUN apt-get update && \
	cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone

RUN apt-get install -y --no-install-recommends \
	php5-json \
	php5-mongo \
	php5-redis \
	php5-curl \
	php5-fpm \
	php5-gd \
	php5-mcrypt \
	php5-mysql \
	&& rm -rf /var/lib/apt/lists/*


# Set environments
RUN set -ex \
	&& sed -i "s|.*/var/run/php5-fpm.sock|listen = 127.0.0.1:9000|g" /etc/php5/fpm/pool.d/www.conf \
	&& sed -i "s|;daemonize.*|daemonize = no|g" /etc/php5/fpm/php-fpm.conf


# Set Workdir	
WORKDIR /www

# Expose volumes
VOLUME ["/www"]

# Expose ports
EXPOSE 9000

# Entry point
CMD ["php5-fpm"]
