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
	
#更新nginx版本
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update

RUN apt-get install -y --no-install-recommends \
	nginx \
	&& rm -rf /var/lib/apt/lists/*


# Set environments
RUN mkdir /www

# Set Workdir	
WORKDIR /www

# Expose volumes
VOLUME ["/www"]

# Expose ports
EXPOSE 80 443

# Entry point
CMD ["nginx","-g","daemon off;"]
