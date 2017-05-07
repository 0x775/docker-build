#docker run -d -p 2233:22 git2
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
RUN apt-get update --fix-missing && \
	cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone

RUN apt-get install -y --no-install-recommends \
    openssh-server \
    git \
	&& rm -rf /var/lib/apt/lists/*


# Set environments
COPY motd /etc/motd
RUN mkdir /var/run/sshd
RUN mkdir -p /data/git
RUN ssh-keygen -A && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    echo 'root:1zhxcql!' | chpasswd

#adduser-git
RUN groupadd git
RUN useradd -g git -s /usr/bin/git-shell -m git && echo "git:git!!~" | chpasswd
RUN chown -R git:git /data/git
RUN mkdir -p /home/git/.ssh
#RUN ssh-keygen -q -N "" -t dsa -f /home/git/.ssh/id_dsa
#RUN mv /home/git/.ssh/id_dsa.pub /home/git/.ssh/authorized_keys
COPY authorized_keys /home/git/.ssh/
RUN chmod 600 /home/git/.ssh/authorized_keys
RUN chown git:git /home/git/.ssh/authorized_keys

# Set Workdir	
WORKDIR /data/git

# Expose volumes
VOLUME ["/data"]

# Expose ports
EXPOSE 22

# Entry point
CMD ["/usr/sbin/sshd","-D"]
