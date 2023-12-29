FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
    git \
    sudo \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install ansible-lint

ARG USERNAME=test_user
ARG GROUPNAME=test_users
ARG PASSWORD=test

RUN groupadd ${GROUPNAME} \
    && useradd -g ${GROUPNAME} -m -s $(which bash) ${USERNAME} \
    && echo ${USERNAME}:${PASSWORD} | chpasswd

RUN echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" | EDITOR='tee -a' visudo

USER ${USERNAME}:${GROUPNAME}
