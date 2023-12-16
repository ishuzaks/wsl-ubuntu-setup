FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install --yes --no-install-recommends \
    ca-certificates \
    curl \
    git \
    openssh-client \
    sudo \
    python3-pip \
    python3-venv \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install ansible-lint

ARG USERNAME=test_user
ARG GROUPNAME=test_users
ARG PASSWORD=test

RUN echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" | EDITOR='tee -a' visudo

RUN groupadd ${GROUPNAME} \
 && useradd -g ${GROUPNAME} -m -s $(which bash) ${USERNAME} \
 && echo ${USERNAME}:${PASSWORD} | chpasswd

USER ${USERNAME}:${GROUPNAME}
