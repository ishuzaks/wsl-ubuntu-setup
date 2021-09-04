#!/bin/bash

cd $(dirname $0)

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install --yes ansible ansible-lint python3-apt

cd ${PWD}/playbook
ansible-playbook --ask-become-pass --connection local --inventory localhost, entry-point.yaml