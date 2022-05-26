git clone https://gitlab.com/qemu-project/qemu.git
cd qemu
git submodule init
git submodule update --recursive
./configure --enable-spice --enable-libusb
make

sudo pacman -Sy ninja pixman glib2 pixman base-devel \
	cairo pango libjpeg-turbo giflib librsvg gtk3 libguestfs libusb

