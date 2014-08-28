FROM ubuntu:12.04

ADD .ssh/id_rsa.pub /root/.ssh/authorized_keys

RUN \
   apt-get update && \
   apt-get install -y openssh-server && \
   mkdir /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]