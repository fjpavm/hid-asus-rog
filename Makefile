obj-m	:= src/hid-asus-rog.o

KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)

all: default

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install

clean:
	rm -rf src/*.o src/*~ src/.*.cmd src/*.ko src/*.mod.c \
		.tmp_versions modules.order Module.symvers

dkmsclean:
	dkms remove -m hid-asus-rog -v 0.4.1 --all || true

dkms: dkmsclean
	dkms add .
	dkms install -m hid-asus-rog -v 0.4.1

onboot:
	echo "blacklist hid-asus" > /etc/modprobe.d/asus-rog.conf

noboot:
	rm -f /etc/modprobe/asus-rog.conf
