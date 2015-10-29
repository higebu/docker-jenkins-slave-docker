FROM alpine:edge
MAINTAINER Yuya Kusakabe <yuya.kusakabe@gmail.com>

RUN apk --update add bash py-pip curl ca-certificates git openssh openjdk7-jre && \
    rm -rf /var/cache/apk/* && \
    curl -s https://get.docker.com/builds/Linux/x86_64/docker-1.8.3 -o /usr/bin/docker && \
    chmod +x /usr/bin/docker && \
    echo "root:jenkins" | chpasswd && \
    sed -i 's:/bin/ash:/bin/bash:' /etc/passwd && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    ssh-keygen -A

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
