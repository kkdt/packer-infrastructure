packer {
  required_plugins {
    ansible = {
      version = ">= 1.1.2"
      source = "github.com/hashicorp/ansible"
    }

    qemu = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

locals {
  data_source_content = {
    "/ks.cfg" = templatefile("${abspath(path.root)}/data/sample.pkrtpl.hcl", {
      root_password_encrypted = "$6$2WdY/4PHlOmGN4g3$teQZ/liUdj1EotM1M6QRtcj50DT1FKHvoDe/Ke/9JY.E.0iisy2YVaUdwpblbbM5ygaF//cnZa16D8GQXBTyk1"
    })
  }

}

source "qemu" "main" {
  qemu_binary = "/usr/libexec/qemu-kvm"
  # qemu_binary = "/usr/bin/virt-install"
  iso_url = "iso/rhel-8.10-x86_64-dvd.iso"
  iso_checksum = "sha256:9b3c8e31bc2cdd2de9cf96abb3726347f5840ff3b176270647b3e66639af291b"
  output_directory = "dist"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  disk_size = "61440M"
  memory = 512
  # display = "vnc=:1"
  headless = true
  format = "qcow2"
  accelerator = "kvm"
  http_content = local.data_source_content
  ssh_username = "root"
  ssh_password = "s0m3password"
  ssh_timeout = "20m"
  vm_name = "rhel8"
  net_device = "virtio-net"
  disk_interface = "virtio"
  boot_wait = "30s"
  boot_command = [
    "<wait><tab><wait5>",
    "<end><spacebar><wait5>",
    "text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg",
    "<wait5><enter>"
  ]
  vnc_bind_address = "127.0.0.1"
  vnc_port_min = 5900
  vnc_port_max = 5900
}

build {
  sources = ["source.qemu.main"]
}

