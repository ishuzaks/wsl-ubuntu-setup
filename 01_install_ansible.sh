#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")"

# Install Ansible
apt-get update \
 && apt-get install --yes software-properties-common \
 && apt-add-repository --yes --update ppa:ansible/ansible \
 && DEBIAN_FRONTEND=noninteractive apt-get install --yes ansible
