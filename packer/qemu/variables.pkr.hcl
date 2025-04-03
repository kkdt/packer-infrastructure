variable "ks_file" {
  type = string
  description = "The full path to the kickstart template file to use; default sample.pkrtpl.hcl file will be used"
  default = ""
}

variable "vm_disk_partitions" {
  type = object({
    boot = object({
      label = string,
      fstype = string,
      size = number,
      fsoptions = string
    }),
    pv = object({
      label = string,
      size = number
    })
  })
  description = "Disk partitions will be for boot and the primary volume"
}

variable "vm_volgroup" {
  type = object({
    name = string,
    pesize = number,
    partition_name = string
  })
  description = "The single volume group attributes on the server, i.e. VolGroup"
}

variable "vm_logical_volumes" {
  type = object({
    root = object({
      mount = string,
      name = string,
      fstype = string,
      size = number,
      grow = bool,
      fsoptions = string
    }),
    home = object({
      mount = string,
      name = string,
      fstype = string,
      size = number,
      grow = bool,
      fsoptions = string
    }),
    tmp = object({
      mount = string,
      name = string,
      fstype = string,
      size = number,
      grow = bool,
      fsoptions = string
    }),
    var = object({
      mount = string,
      name = string,
      fstype = string,
      size = number,
      grow = bool,
      fsoptions = string
    })
  })
  description = "List out all logical volumes and their attributes"
}

variable "vm_swap_size" {
  type = number
  description = "The swap size in MB"
  default = 2048
}