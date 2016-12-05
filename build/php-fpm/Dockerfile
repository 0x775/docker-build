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
	&& sed -i "s|post_max_size.*|post_max_size = 50M|g" /etc/php5/cli/php.ini \
	&& sed -i "s|upload_max_filesize.*|upload_max_filesize = 50M|g" /etc/php5/cli/php.ini \
	&& sed -i "s|max_execution_time.*|max_execution_time = 180|g" /etc/php5/cli/php.ini \
	&& sed -i "s|max_input_time.*|max_input_time = 180|g" /etc/php5/cli/php.ini \
	&& sed -i "s|memory_limit.*|memory_limit = 128M|g" /etc/php5/cli/php.ini \
	&& sed -i "s|.*/var/run/php5-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php5/fpm/pool.d/www.conf \
	&& sed -i "s|;daemonize.*|daemonize = no|g" /etc/php5/fpm/php-fpm.conf


# Set Workdir	
WORKDIR /www

# Expose volumes
VOLUME ["/www"]

# Expose ports
EXPOSE 9000

# Entry point
CMD ["php5-fpm"]
