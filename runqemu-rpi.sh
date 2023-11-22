# Shell script to start Raspberry Pi 3 (64-bit) on QEMU
#!/bin/sh
#	qemu-system-aarch64 \
 #   -M virt  \
  #  -cpu cortex-a53 -nographic -smp 1 \
   # -kernel buildroot/output/images/Image \
#    -append "rootwait root=/dev/vda console=ttyAMA0" \
#    -netdev user,id=eth0,hostfwd=tcp::10022-:22,hostfwd=tcp::9000-:9000 \
#    -device virtio-net-device,netdev=eth0 \
#    -drive file=buildroot/output/images/rootfs.ext4,if=none,format=raw,id=hd0 \
#    -device virtio-blk-device,drive=hd0 -device virtio-rng-pci
#	-device sdhci-pci \


KERNEL="buildroot/output/images/Image"
DTB="buildroot/output/images/bcm2710-rpi-3-b.dtb" 
ROOTFS="buildroot/output/images/rootfs.ext2"

if [ ! -e $KERNEL ]
then
	echo "$KERNEL does not exist"
	exit 1
fi

if [ ! -e $DTB ]
then
	echo "$DTB does not exist"
	exit 1
fi

if [ ! -e $ROOTFS ]
then
	echo "$ROOTFS does not exist"
	exit 1
fi


qemu-system-aarch64 \
	-M raspi3 \
	-kernel $KERNEL \
	-dtb $DTB \
	-m 1024 -nographic \
	-append "rw console=ttyAMA0,115200 root=/dev/mmcblk0 fsck.repair=yes rootwait" \
	-device sd-card,drive=mycard -drive if=none,file=$ROOTFS,format=raw,id=mycard



