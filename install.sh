#!/bin/bash

DEBIAN_FRONTEND=noninteractive sudo apt-get update && sudo apt-get --yes upgrade
DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes software-properties-common
DEBIAN_FRONTEND=noninteractive sudo apt-add-repository --yes --update ppa:ansible/ansible
DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes ansible 

LANG=C ansible-playbook --ask-become-pass --connection local --inventory localhost, "$1"
sudo apt-get autoremove --yes
