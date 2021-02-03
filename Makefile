obj-m	:= src/hid-asus-rog.o
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD       := $(shell pwd)

all: default

default:
	# for newer 5.10.x kernels with x<=4
	sudo sh -c "sed '$ d' $(KERNELDIR)/scripts/module.lds.S > $(KERNELDIR)/scripts/module.lds"
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install

clean:
	rm -rf src/*.o src/*~ src/.*.cmd src/*.ko src/*.mod.c \
		.tmp_versions modules.order Module.symvers
	sudo sh -c "rm -f $(KERNELDIR)/scripts/module.lds"



dkmsclean:
	dkms remove -m hid-asus-rog -v 0.4.5 --all || true
	dkms remove -m hid-asus-rog -v 0.5.0 --all || true
	dkms remove -m hid-asus-rog -v 0.5.1 --all || true
	dkms remove -m hid-asus-rog -v 0.6.0 --all || true

dkms: dkmsclean
	dkms add .
	dkms install -m hid-asus-rog -v 0.6.0

onboot:
	echo "blacklist hid-asus" > /etc/modprobe.d/asus-rog.conf

noboot:
	rm -f /etc/modprobe/asus-rog.conf
