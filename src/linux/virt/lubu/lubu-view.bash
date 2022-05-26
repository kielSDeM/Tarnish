#!/bin/bash
if qemu-img info ~/tarnish/src/linux/virt/lubu/lubu.qcow2 | grep -i "disk size: 4 KiB"
then
	echo "lubuntu is not installed"
else
	alacritty -e remote-viewer spice://127.0.0.1:3002
fi

