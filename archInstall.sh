#!/bin/bash
## 分区
#fdisk -l
read -p "input the disk name,such as (sda).Becareful,the opration is dangerous:"  diskName

echo "d
y
n
p
1


w
" | fdisk /dev/$diskName && mkfs.ext4 /dev/${diskName}1

#挂载分区
echo "mounting..."
mount /dev/${diskName}1 /mnt
echo "changing the mirrors..."
#修改镜像源
mirrors=` cat /etc/pacman.d/mirrorlist |grep 'tuna' |head -n 1`
if [ ! $mirrors ];then
	echo "no mirrors,exit. "
else
	echo $mirrors >> /etc/pacman.d/mirrorlist
	cat /etc/pacman.d/mirrorlist
fi
