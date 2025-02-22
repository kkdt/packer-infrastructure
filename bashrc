#!/bin/bash

__directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# sets PATH to the local bin directory
export PATH=${__directory}/bin:$PATH

# Packer configurations
export PACKER_CONFIG_DIR=${__directory}/build/.packer
export PACKER_CACHE_DIR=${__directory}/build/.packer/packer_cache
export PACKER_LOG_PATH=${__directory}/build/.packer/logs
export PACKER_PLUGIN_PATH=${__directory}/build/.packer/plugins
export PACKER_LOG=1

local-download-packer() {
  local __version="1.8.3"
  if [ ! -z "${1}" ]; then
    __version="${1}"
  fi
  local __package="packer_${__version}_linux_amd64.zip"

  mkdir -p ${__directory}/build
  mkdir -p ${__directory}/bin
  mkdir -p ${PACKER_CONFIG_DIR}
  mkdir -p ${PACKER_CACHE_DIR}
  mkdir -p ${PACKER_LOG_PATH}
  mkdir -p ${PACKER_PLUGIN_PATH}

  wget -O ${__directory}/build/${__package} https://releases.hashicorp.com/packer/${__version}/${__package}
  unzip ${__directory}/build/${__package} -d ${__directory}/bin
  env | grep PACKER
}

local-clean() {
  rm -rf ${__directory}/build
  rm -rf ${__directory}/bin
}