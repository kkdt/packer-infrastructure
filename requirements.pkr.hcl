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

    qemu = {
      version = "= 1.1.1"
      source  = "github.com/hashicorp/qemu"
    }
  }
}