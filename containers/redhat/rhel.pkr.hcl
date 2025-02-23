packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

locals {
  ansible_requirements_yml = pathexpand("${path.cwd}/ansible/requirements.yml")
  ansible_playbook = pathexpand("${path.cwd}/ansible/playbook.yml")
  ansible_roles_path = pathexpand("${path.cwd}/build/.ansible-galaxy/roles")
  ansible_collections_path = pathexpand("${path.cwd}/build/.ansible-galaxy/collections")
  ansible_log = pathexpand("${path.cwd}/build/ansible.log")
}

source "docker" "redhat" {
  image  = var.container_image
  commit = var.commit
}

build {
  name = "redhat"

  sources = [
    "source.docker.redhat"
  ]

  provisioner "ansible" {
    only = ["docker.redhat"]
    except = []
    roles_path = "${local.ansible_roles_path}"
    collections_path = "${local.ansible_collections_path}"
    galaxy_force_install = true
    galaxy_file = "${local.ansible_requirements_yml}"
    playbook_file = "${local.ansible_playbook}"
    user = "${var.ssh_username}"

    ansible_env_vars = [
      "ANSIBLE_HOST_KEY_CHECKING=false",
      "ANSIBLE_LOG_PATH=${local.ansible_log}",
      "ANSIBLE_ROLES_PATH=${path.cwd}/ansible/roles:${local.ansible_roles_path}",
      "ANSIBLE_COLLECTIONS_PATH=${local.ansible_collections_path}"
    ]

    extra_arguments = [
      "-v"
    ]
  }

  post-processors {
    post-processor "docker-tag" {
      repository =  var.tag_repository
      tags = [var.tag_version]
    }
  }
}

