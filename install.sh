#!/bin/bash

cd $(dirname $0)

DEBIAN_FRONTEND=noninteractive

sudo apt-get update && sudo apt-get --yes upgrade
sudo apt-get install --yes software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install --yes ansible 

cd ${PWD}/playbook
LANG=C ansible-playbook --ask-become-pass --connection local --inventory localhost, main.yaml
