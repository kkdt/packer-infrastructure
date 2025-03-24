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
      root_password_encrypted = "$6$2WdY/4PHlOmGN4g3$teQZ/liUdj1EotM1M6QRtcj50DT1FKHvoDe/Ke/9JY.E.0iisy2YVaUdwpblbbM5ygaF//cnZa16D8GQXBTyk1",
      vm_disk_partitions = var.vm_disk_partitions,
      vm_volgroup = var.vm_volgroup,
      vm_swap_size = var.vm_swap_size,
      vm_logical_volumes = var.vm_logical_volumes
    })
  }

}

source "qemu" "main" {
  qemu_binary = "/usr/libexec/qemu-kvm"
  iso_url = "iso/rhel-8.10-x86_64-dvd.iso"
  iso_checksum = "sha256:9b3c8e31bc2cdd2de9cf96abb3726347f5840ff3b176270647b3e66639af291b"
  output_directory = "dist"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  disk_size = "80G"
  disk_interface = "virtio"
  boot_wait = "30s"
  memory = 8192
  # display = "vnc=:1"
  headless = true
  format = "qcow2"
  accelerator = "kvm"
  http_content = local.data_source_content
  # cd_content = local.data_source_content
  ssh_username = "root"
  ssh_password = "simplep@ssword"
  ssh_timeout = "20m"
  vm_name = "rhel8.qcow2"
  net_device = "virtio-net"
  boot_command = [
    "<wait><tab><wait>",
    "<end><spacebar><wait>",
    "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><wait5>",
    "text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg",
    # "text inst.ks=cdrom:/ks.cfg",
    "<wait><enter>"
  ]
  vnc_bind_address = "127.0.0.1"
  vnc_port_min = 5901
  vnc_port_max = 5901
}

build {
  sources = ["source.qemu.main"]
}

