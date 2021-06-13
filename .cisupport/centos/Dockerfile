ARG OS_VERSION=latest
FROM centos:$OS_VERSION

# Install curl, git and sudo
RUN dnf install -y  \
      curl-7.61.1 \
      git-2.27.0 \
      sudo-1.8.29 && \
    dnf clean all

# Install bats
WORKDIR /tmp
RUN git clone https://github.com/sstephenson/bats.git
WORKDIR /tmp/bats
RUN ./install.sh /usr/local

WORKDIR /app
COPY branch ./
RUN cat branch
COPY entrypoint.sh ./
ENTRYPOINT ["./entrypoint.sh"]
