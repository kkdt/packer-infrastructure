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

local-build() {
  local __version="1.8.3"
  if [ ! -z "${1}" ]; then
    __version="${1}"
  fi
  local __package="packer_${__version}_linux_amd64.zip"

  echo "----------------------------------------------------"
  echo "1. Setting up directories"
  echo "----------------------------------------------------"
  mkdir -p ${__directory}/build/bin
  mkdir -p ${__directory}/build/images

  mkdir -p ${PACKER_CONFIG_DIR}
  mkdir -p ${PACKER_CACHE_DIR}
  mkdir -p ${PACKER_PLUGIN_PATH}
  touch ${PACKER_LOG_PATH}

  mkdir -p ${PACKER_INFRASTRUCTURE_ANSIBLE_ROLES_PATH}
  mkdir -p ${PACKER_INFRASTRUCTURE_ANSIBLE_COLLECTIONS_PATH}

  echo "----------------------------------------------------"
  echo "2. Local install of Ansible roles and collections"
  echo "----------------------------------------------------"
  ansible-galaxy role install --roles-path ${PACKER_INFRASTRUCTURE_ANSIBLE_ROLES_PATH} -r ${__directory}/requirements.ansible.yml
  ansible-galaxy collection install --collections-path ${PACKER_INFRASTRUCTURE_ANSIBLE_COLLECTIONS_PATH} -r ${__directory}/requirements.ansible.yml

  echo "----------------------------------------------------"
  echo "3. Local install of Packer"
  echo "----------------------------------------------------"
  wget -O ${__directory}/build/${__package} https://releases.hashicorp.com/packer/${__version}/${__package}
  unzip ${__directory}/build/${__package} -d ${__directory}/build/bin

  echo "----------------------------------------------------"
  echo "4. Local install of Packer plugins"
  echo "----------------------------------------------------"
  packer init ${__directory}/requirements.pkr.hcl

  echo "----------------------------------------------------"
  echo "5. Environment"
  echo "----------------------------------------------------"
  env | grep PACKER | sort
}

local-clean() {
  rm -rf ${__directory}/build
}