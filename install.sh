#!/bin/bash

cd $(dirname $0)

DEBIAN_FRONTEND=noninteractive

sudo apt-get update && sudo apt-get --yes upgrade
sudo apt-get install --yes ansible ansible-lint python3-apt

cd ${PWD}/playbook
ansible-playbook --ask-become-pass --connection local --inventory localhost, main.yaml
