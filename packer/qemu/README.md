# Packer Build - QEMU

`virt-host-validate`: Checks if your host is configured in a way that is suitable for running Libvirt hypervisor drivers, including QEMU.

## Packages

```
ipxe-roms-qemu.noarch                              20181214-11.git133f4c47.el8                                 @rhel-8-for-x86_64-appstream-rpms        
libvirt-client.x86_64                              8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-config-network.x86_64               8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-interface.x86_64             8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-network.x86_64               8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-nodedev.x86_64               8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-nwfilter.x86_64              8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-qemu.x86_64                  8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-secret.x86_64                8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-storage-core.x86_64          8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-storage-disk.x86_64          8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-storage-gluster.x86_64       8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-storage-iscsi-direct.x86_64  8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-storage-iscsi.x86_64         8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-storage-logical.x86_64       8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-storage-mpath.x86_64         8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-storage-rbd.x86_64           8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-storage-scsi.x86_64          8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-driver-storage.x86_64               8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon-kvm.x86_64                          8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-daemon.x86_64                              8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
libvirt-gconfig.x86_64                             3.0.0-1.el8                                                 @rhel-8-for-x86_64-appstream-rpms        
libvirt-glib.x86_64                                3.0.0-1.el8                                                 @rhel-8-for-x86_64-appstream-rpms        
libvirt-gobject.x86_64                             3.0.0-1.el8                                                 @rhel-8-for-x86_64-appstream-rpms        
libvirt-libs.x86_64                                8.0.0-23.3.module+el8.10.0+22462+a5794968                   @rhel-8-for-x86_64-appstream-rpms        
python3-libvirt.x86_64                             8.0.0-2.module+el8.9.0+18724+20190c23                       @rhel-8-for-x86_64-appstream-rpms        
qemu-guest-agent.x86_64                            15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-img.x86_64                                    15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-block-curl.x86_64                         15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-block-gluster.x86_64                      15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-block-iscsi.x86_64                        15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-block-rbd.x86_64                          15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-block-ssh.x86_64                          15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-common.x86_64                             15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-core.x86_64                               15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-docs.x86_64                               15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-hw-usbredir.x86_64                        15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-ui-opengl.x86_64                          15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm-ui-spice.x86_64                           15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
qemu-kvm.x86_64                                    15:6.2.0-53.module+el8.10.0+22375+ea5e8167.2                @rhel-8-for-x86_64-appstream-rpms        
virt-install.noarch                                3.2.0-4.1.el8_10                                            @rhel-8-for-x86_64-appstream-rpms        
virt-manager-common.noarch                         3.2.0-4.1.el8_10                                            @rhel-8-for-x86_64-appstream-rpms        
virt-manager.noarch                                3.2.0-4.1.el8_10                                            @rhel-8-for-x86_64-appstream-rpms        
VirtualBox-7.0.x86_64                              7.0.24_167081_el8-1                                         @virtualbox                              
virt-what.x86_64                                   1.25-4.el8                                                  @rhel-8-for-x86_64-baseos-rpms           
```

## List all virtual machines

```
virsh list --all
virsh list
```

## Example process command

```
/usr/libexec/qemu-kvm
  -device virtio-net,netdev=user.0 
  -name rhel8.qcow2 
  -m 8192M 
  -machine type=pc,accel=kvm 
  -vnc 127.0.0.1:1 
  -smp 1 
  -drive file=dist/rhel8.qcow2,if=virtio,cache=writeback,discard=ignore,format=qcow2 
  -drive file=/home/thinh/workspace/repos/packer-infrastructure/iso/rhel-8.10-x86_64-dvd.iso,media=cdrom 
  -boot once=d 
  -netdev user,id=user.0,hostfwd=tcp::3216-:22
```


[//]: Links

[conver-imags]: https://docs.openstack.org/image-guide/convert-images.html
[automate-packer-qemu-image-builds]: https://actuated.com/blog/automate-packer-qemu-image-builds
[create-a-kvm-rhel8-instance]: https://medium.com/@murat.bilal/create-a-kvm-rhel8-6-instance-from-rhel-iso-and-automate-custom-partitioning-with-kickstart-file-5851c128a905
[building-qemu-kvm-images-packer]: https://support.tools/building-qemu-kvm-images-packer/
[rhel-virt-packages]: https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/virtualization_host_configuration_and_guest_installation_guide/sect-virtualization_host_configuration_and_guest_installation_guide-host_installation-installing_kvm_packages_on_an_existing_red_hat_enterprise_linux_system#sect-Virtualization_Host_Configuration_and_Guest_Installation_Guide-Host_Installation-Installing_KVM_packages_on_an_existing_Red_Hat_Enterprise_Linux_system
