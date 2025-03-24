# Kickstart file for RHEL 8.10

### Installs from the first attached CD-ROM/DVD on the system.
cdrom

### Performs the kickstart installation in text mode. 
### By default, kickstart installations are performed in graphical mode.
text

### Accepts the End User License Agreement.
eula --agreed

# Install language
lang en_US.UTF-8

# Keyboard layout
keyboard us

# Network configuration
network --bootproto=dhcp

# Root password
# openssl passwd -6
rootpw --plaintext simplep@ssword

### Configure firewall settings for the system.
### --enabled	reject incoming connections that are not in response to outbound requests
### --ssh		allow sshd service through the firewall
firewall --disabled

### Sets up the authentication options for the system.
### The SSDD profile sets sha512 to hash passwords. Passwords are shadowed by default
### See the manual page for authselect-profile for a complete list of possible options.
authselect select sssd

### Sets the state of SELinux on the installed system.
selinux --disabled

# timezone
timezone America/New_York --isUtc

### Sets how the boot loader should be installed.
bootloader --location=mbr

### Initialize any invalid partition tables found on disks.
# ignoredisk --only-use=sda
zerombr

### Removes partitions from the system, prior to creation of new partitions. 
### By default, no partitions are removed.
### --linux	erases all Linux partitions.
### --initlabel Initializes a disk (or disks) by creating a default disk label for all disks in their respective architecture.
clearpart --all --linux --initlabel

autopart

# # Create primary system partitions (required for installs)
# part /boot --fstype=${vm_disk_partitions.boot.fstype} --size=${vm_disk_partitions.boot.size} --fsoptions="${vm_disk_partitions.boot.fsoptions}" --label=${vm_disk_partitions.boot.label}
# part ${vm_disk_partitions.pv.label} --grow --size=${vm_disk_partitions.pv.size}

# # Create a Logical Volume Management (LVM) group (optional)
# volgroup ${vm_volgroup.name} --pesize=${vm_volgroup.pesize} ${vm_volgroup.partition_name}

# # Create particular logical volumes (optional)
# logvol ${vm_logical_volumes.root.mount} --fstype=${vm_logical_volumes.root.fstype} --name=${vm_logical_volumes.root.name} --vgname=${vm_volgroup.name} --size=${vm_logical_volumes.root.size} %{ if vm_logical_volumes.root.grow ~} --grow %{ endif ~} %{ if vm_logical_volumes.root.fsoptions != "" ~} --fsoptions="${vm_logical_volumes.root.fsoptions}" %{ endif ~}

# # Ensure /home Located On Separate Partition
# logvol ${vm_logical_volumes.home.mount} --fstype=${vm_logical_volumes.home.fstype} --name=${vm_logical_volumes.home.name} --vgname=${vm_volgroup.name} --size=${vm_logical_volumes.home.size} %{ if vm_logical_volumes.home.grow ~} --grow %{ endif ~} %{ if vm_logical_volumes.home.fsoptions != "" ~} --fsoptions="${vm_logical_volumes.home.fsoptions}" %{ endif ~}

# # Ensure /tmp Located On Separate Partition
# logvol ${vm_logical_volumes.tmp.mount} --fstype=${vm_logical_volumes.tmp.fstype} --name=${vm_logical_volumes.tmp.name} --vgname=${vm_volgroup.name} --size=${vm_logical_volumes.tmp.size} %{ if vm_logical_volumes.tmp.grow ~} --grow %{ endif ~} %{ if vm_logical_volumes.tmp.fsoptions != "" ~} --fsoptions="${vm_logical_volumes.tmp.fsoptions}" %{ endif ~}

# # Ensure /var Located On Separate Partition
# logvol ${vm_logical_volumes.var.mount} --fstype=${vm_logical_volumes.var.fstype} --name=${vm_logical_volumes.var.name} --vgname=${vm_volgroup.name} --size=${vm_logical_volumes.var.size} %{ if vm_logical_volumes.var.grow ~} --grow %{ endif ~} %{ if vm_logical_volumes.var.fsoptions != "" ~} --fsoptions="${vm_logical_volumes.var.fsoptions}" %{ endif ~}

# # swap volumn group
# logvol swap --name=swap --vgname=${vm_volgroup.name} --size=${vm_swap_size}

### Packages selection.
%packages --excludedocs
@base
@core
kernel
# kernel-headers
# kernel-devel
%end

### Reboot after the installation is complete.
### --eject attempt to eject the media before rebooting.
reboot --eject