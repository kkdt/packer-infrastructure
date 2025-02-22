packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "redhat" {
  image  = "docker.io/redhat/ubi8:latest"
  commit = true
}

build {
  name = "sample-redhat"
  sources = [
    "source.docker.redhat"
  ]

  post-processors {
    post-processor "docker-tag" {
      repository =  "kkdt/redhat"
      tags = ["0.1"]
    }
  }

}

