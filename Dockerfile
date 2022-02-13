FROM debian:latest


RUN apt-get update && \
    apt-get install -y openssh-server docker.io && \
    apt-get autoclean

# set up directory structure once
RUN service ssh start && service docker start

EXPOSE 22

COPY startup.sh /startup.sh
CMD ["/startup.sh"]
