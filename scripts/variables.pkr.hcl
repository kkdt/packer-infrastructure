variable "build_playbook" {
  type = string
  description = "Relative path to the Ansible playbook"
  default = "ansible/playbook.yml"
}

variable "commit" {
  type = bool
  description = "Commit the container image after build"
  default = true
}

variable "container_file" {
  type = string
  description = "Relative path to the Containerfile to bootstrap the container image"
  default = "Containerfile"
}

variable "container_image" {
  type = string
  description = "The base image to use for the build"
  default = "docker.io/redhat/ubi8:8.10"
}

variable "packer_build_sources" {
  type = list(string)
  description = "Packer source to build: source.docker.image (default) or source.docker.file"
  default = ["source.docker.image"]
}

variable "ssh_username" {
  type = string
  description = "Ansible SSH user"
  default = "root"
}

variable "tag_repository" {
  type = string
  description = "Repository to use when tagging the container image"
  default = "kkdt.github.io/redhat"
}

variable "tag_version" {
  type = string
  description = "Container image tag version"
  default = "8.10-1"
}

variable "galaxy_force_install" {
  type = bool
  description = "Force Ansible galaxy to re-install the roles and collections specified by the requirements file"
  default = false
}