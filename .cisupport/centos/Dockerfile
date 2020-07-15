ARG OS_VERSION=latest
FROM centos:$OS_VERSION

RUN dnf install -y  \
      curl \
      git \
      sudo
RUN mkdir -p /usr/local && \
    git clone https://github.com/sstephenson/bats.git

WORKDIR bats
RUN ./install.sh /usr/local

COPY entrypoint.sh ./
ENTRYPOINT ["./entrypoint.sh"]
