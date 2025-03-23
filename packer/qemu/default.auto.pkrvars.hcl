vm_disk_partitions = {
  boot = {
    label = "boot",
    fstype = "ext4",
    size = 512,
    fsoptions = "nodev,nosuid,noexec"
  },
  pv = {
    label = "pv.01",
    size = 1
  }
}

vm_volgroup = {
  name = "VolGroup",
  pesize = 4096,
  # must match 'pv' attribute above
  partition_name = "pv.01"
}

# All logical volumes on the VM
vm_logical_volumes = {
  root = {
    mount = "/",
    name = "root",
    fstype = "ext4",
    size = 10240,
    grow = true,
    fsoptions = ""
  },
  home = {
    mount = "/home",
    name = "home",
    fstype = "ext4",
    size = 5120,
    grow = false,
    fsoptions = "nodev"
  },
  tmp = {
    mount = "/tmp",
    name = "tmp",
    fstype = "ext4",
    size = 5120,
    grow = false,
    fsoptions = "nodev,nosuid"
  },
  var = {
    mount = "/var",
    name = "var",
    fstype = "ext4",
    size = 5120,
    grow = false,
    fsoptions = "nodev"
  }
}