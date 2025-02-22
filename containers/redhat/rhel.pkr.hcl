packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
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

  post-processors {
    post-processor "docker-tag" {
      repository =  var.tag_repository
      tags = [var.tag_version]
    }
  }
}

