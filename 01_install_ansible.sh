#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")"

# Install Ansible
DEBIAN_FRONTEND=noninteractive
apt-get update \
 && apt-get install --yes software-properties-common \
 && apt-add-repository --yes --update ppa:ansible/ansible \
 && apt-get install --yes \
    ansible \
    ansible-lint
