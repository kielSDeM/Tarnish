#!/bin/bash
FILE1=ubu-server.qcow2
FILE2=qemu_iso/https://mirror.arizona.edu/ubuntu-releases/
# creates a virtual disk for lxle if there is not one
if [ ! -f "$FILE1" ]
then
    echo "Going to create a lubuntu virt-disk"
    qemu-img create -f raw ubuserver.qcow2 10G 
else
    echo "files exists"
fi
# downloads lxle.iso if it does not exist in current directory.
if [ ! -f "$FILE2" ]
then
echo "going to download lubuntu"
wget -P qemu_iso https://mirror.arizona.edu/ubuntu-releases/
else
    echo "lubuntu downloaded"
fi
# starts qemu with the iso if it is not installed or starts the vm.
if qemu-img info ~/tarnish/src/linux/virt/ubu-server.qcow2 | grep -i "disk size: 4 KiB"
then
    qemu-system-x86_64 -drive file=~/tarnish/src/linux/virt/ubuserver.qcow2,format=raw -boot d \
    -cdrom ~/tarnish/src/linux/virt/qemu_iso/ubuntu-20.04.4-live-server-amd64.iso  -m 2048M -cpu host \
    -smp 1\
    -vga qxl -enable-kvm 
    echo "vm creation successfully completed"
else
    qemu-system-x86_64 -drive file=~/tarnish/src/linux/virt/ubuserver.qcow2,format=raw -boot d \
    -m 1024M -cpu host -device intel-hda -device hda-duplex \
    -smp 1 -spice port=3002,disable-ticketing=on \
    -netdev user,id=mynet0,net=192.168.76.0/24,dhcpstart=192.168.76.15 \
    -device e1000,netdev=mynet0,mac=89:4d:32:31:f2:fa  \
    -vga qxl -enable-kvm 
    echo "starting lubuntu"
fi 
