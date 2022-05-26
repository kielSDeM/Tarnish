#!/bin/bash
if qemu-img info ~/tarnish/src/linux/virt/kali.qcow2 | grep -i "disk size: 4 KiB"
then
	echo "kali is not installed"
else
	alacritty -e remote-viewer spice://127.0.0.1:3000
fi

