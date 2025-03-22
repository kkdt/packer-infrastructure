# Kickstart file for Red Hat Enterprise Linux 8.10

# --- Installation Options ---
text
keyboard --x-layouts "us"
rootpw --iscrypted root:${root_password_encrypted}
timezone America/New_York --isUtc
# --- Partitioning ---
bootloader --location=mbr --active_partition
clearpart --dsize=1024 --initimage
rootfs --fstype ext4 --size=1024
swap --size=2048
# --- Network ---
network --bootproto dhcp --device eth0 --ipaddress 192.168.1.10 --netmask 255.255.255.0 --gateway 192.168.1.1 --nameserver 8.8.8.8
# --- Packages ---
base
# --- Firewall ---
firewall --disabled
# --- SELinux ---
selinux --enforcing --policy=targeted
# --- Post-Installation ---
firstboot --disable
# --- User ---
user --name=packer --password=packer --first_name=Packer --last_name=Qemu --groups=users
# --- Subscription ---
#subscription --url=https://www.example.com/subscription
# --- Language ---
lang en_US.UTF-8
# --- Services ---
services --enabled=sssd
services --disabled=NetworkManager