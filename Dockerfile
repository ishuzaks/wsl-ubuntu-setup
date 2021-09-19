FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --yes --no-install-recommends \
    ca-certificates \
    curl \
    git \
    openssh-client \
    sudo \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG USERNAME=test-user
ARG GROUPNAME=test-users
ARG PASSWORD=test

RUN groupadd ${GROUPNAME} && \
    useradd -g ${GROUPNAME} -G sudo -m -s $(which bash) ${USERNAME} && \
    echo ${USERNAME}:${PASSWORD} | chpasswd

RUN USER=${USERNAME} && \
    GROUP=${GROUPNAME} && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.5/fixuid-0.5-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

USER ${USERNAME}:${GROUPNAME}

WORKDIR /home/${USERNAME}/

ENTRYPOINT [ "fixuid" ]
