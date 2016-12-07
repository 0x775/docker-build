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
    openssh-server \
    git \
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
COPY motd /etc/motd
RUN mkdir /var/run/sshd
RUN ssh-keygen -A && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    echo 'root:123456' | chpasswd

#adduser-git
#RUN adduser -D git && echo "git:123456" | chpasswd
#RUN chown -R git:git /git

# Set Workdir	
WORKDIR /www

# Expose volumes
VOLUME ["/www"]

# Expose ports
EXPOSE 22

# Entry point
CMD ["/usr/sbin/sshd","-D"]
