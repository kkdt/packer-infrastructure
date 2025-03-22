packer {
  required_plugins {
    
    ansible = {
      version = ">= 1.1.2"
      source = "github.com/hashicorp/ansible"
    }

    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }

  }
}

locals {
  ansible_playbook = pathexpand("${path.cwd}/${var.build_playbook}")
  ansible_roles_path_local=pathexpand("${path.cwd}/ansible/roles")
  ansible_roles_path = pathexpand("${path.cwd}/build/.ansible-galaxy/roles")
  ansible_collections_path = pathexpand("${path.cwd}/build/.ansible-galaxy/collections")
  ansible_log = pathexpand("${path.cwd}/build/ansible.log")
}

source "docker" "image" {
  image  = var.container_image
  commit = var.commit
}

source "docker" "file" {
  build {
    path = "${path.cwd}/${var.container_file}"
  }
  commit = var.commit
}

build {
  name = "default"

  sources = var.packer_build_sources

  # Requires the container to have ansible installed; Ansible will be invoked local/within the container
  provisioner "ansible-local" {

    # Must explictly set ANSIBLE_ROLES_PATH since Packer uploads to 'roles' and we want both the ones from
    # requirements.ansible.yml and the local Ansible roles/collections with this project.
    command = "ANSIBLE_FORCE_COLOR=1 ANSIBLE_ROLES_PATH=${var.container_staging_directory}/roles/roles ansible-playbook"

    staging_directory = var.container_staging_directory

    role_paths = [
      "${local.ansible_roles_path}",
      "${local.ansible_roles_path_local}"
    ]

    collection_paths = [
      "${local.ansible_collections_path}"
    ]

    playbook_file = "${local.ansible_playbook}"

    extra_arguments = [
      "-vvv",
      "--extra-vars", "container_staging_directory=${var.container_staging_directory}"
    ]

    # ansible_env_vars = [
    #   "ANSIBLE_HOST_KEY_CHECKING=false",
    #   "ANSIBLE_LOG_PATH=${local.ansible_log}",
    #   "ANSIBLE_ROLES_PATH=${path.cwd}/ansible/roles:${local.ansible_roles_path}",
    #   "ANSIBLE_COLLECTIONS_PATH=${local.ansible_collections_path}"
    # ]

  }

  post-processors {

    post-processor "docker-tag" {
      repository =  var.tag_repository
      tags = [var.tag_version]
      force = true
    }

    post-processor "docker-save" {
      path = "${path.cwd}/build/images/${var.container_tar_filename}"
      keep_input_artifact = var.keep_input_artifact
    }

  }
}

