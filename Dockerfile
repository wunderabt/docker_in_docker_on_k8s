FROM debian:latest


RUN apt-get update && \
    apt-get install -y openssh-server docker.io && \
    apt-get autoclean

# add user
RUN useradd -u 1000 uwe && \
    usermod -a -G docker uwe && \
    echo uwe:dummy | chpasswd && \
    mkdir -p /home/uwe/.ssh
COPY ssh-authorized-keys.txt /home/uwe/.ssh/authorized_keys
RUN chown -R uwe /home/uwe && \
    chgrp -R uwe /home/uwe && \
    chmod 644 /home/uwe/.ssh/authorized_keys && \
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

# set up directory structure once
RUN service ssh start && service docker start

EXPOSE 22

COPY startup.sh /startup.sh
CMD ["/startup.sh"]
