#!/bin/bash
## 分区
umount /mnt
fdisk -l
read -p "input the disk name,such as (sda).Becareful,the opration is dangerous:"  diskName

if [ ! "$diskName" ]; then
	echo "input disk name, please!"
else
	echo "d
	n
	p
	1


	y
	w
	" | fdisk /dev/$diskName && mkfs.ext4 /dev/${diskName}1

	#挂载分区
	echo "mounting..."
	mount /dev/${diskName}1 /mnt
fi

echo "changing the mirrors..."
#修改镜像源
mirrors=` cat /etc/pacman.d/mirrorlist |grep 'tuna' |head -n 1`
if [ ! "$mirrors" ];then
	echo "no mirrors,exit. "
else
	echo $mirrors >> /etc/pacman.d/mirrorlist
fi
