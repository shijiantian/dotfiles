#!/bin/bash
## 分区
#fdisk -l
read -p "请输入要操作的硬盘，如sda(该操作会彻底删除硬盘上的数据，请认真核对，数据丢失概不负责):"  diskName

echo "d
n
p
1


w
" | fdisk /dev/$diskName && mkfs.ext4 /dev/${diskName}1

#挂载分区
echo "挂载分区..."
mount /dev/${diskName}1 /mnt
echo "修改镜像源..."
#修改镜像源
mirrors=` cat /etc/pacman.d/mirrorlist |grep 'tuna\|zju' |sed -e 's/#//g'`
if [ ! $mirrors ];then
	echo $mirrors >> /etc/pacman.d/mirrorlist
	cat /etc/pacman.d/mirrorlist
fi
