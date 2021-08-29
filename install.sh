#!/bin/bash

cd $(dirname $0)

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install --yes ansible ansible-lint

