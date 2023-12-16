FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    ca-certificates \
    curl \
    git \
    openssh-client \
    sudo \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG USERNAME=test_user
ARG GROUPNAME=test_users
ARG PASSWORD=test

RUN echo "${USERNAME} ALL=(ALL) ALL" | EDITOR='tee -a' visudo

RUN groupadd ${GROUPNAME} \
 && useradd -g ${GROUPNAME} -m -s $(which bash) ${USERNAME} \
 && echo ${USERNAME}:${PASSWORD} | chpasswd

USER ${USERNAME}:${GROUPNAME}

WORKDIR /home/${USERNAME}/
