#!/bin/bash

__directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# sets PATH to the local bin directory
export PATH=${__directory}/build/bin:$PATH

# Packer configurations
export PACKER_CONFIG_DIR=${__directory}/build/.packer
export PACKER_CACHE_DIR=${__directory}/build/.packer/packer_cache
export PACKER_LOG_PATH=${__directory}/build/.packer/packer.log
export PACKER_PLUGIN_PATH=${__directory}/build/.packer/plugins
export PACKER_LOG=1

# project-specific
export PACKER_INFRASTRUCTURE_ANSIBLE_ROLES_PATH=${__directory}/build/.ansible-galaxy/roles
export PACKER_INFRASTRUCTURE_ANSIBLE_COLLECTIONS_PATH=${__directory}/build/.ansible-galaxy/collections/ansible_collections
