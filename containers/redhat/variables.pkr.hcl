
variable "commit" {
  type = bool
  description = "Commit the container image after build"
  default = true
}

variable "container_image" {
  type = string
  description = "The base image to use for the build"
  default = "docker.io/redhat/ubi8:8.10"
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
