#!/bin/bash
set -euxo pipefail
cd "$(dirname "$0")"

# Execute playbook
LANG=C.UTF-8 ansible-playbook -i inventory.yaml entrypoint.yaml --ask-become-pass