#!/bin/bash
## 分区
umount /mnt
fdisk -l
read -p "input the disk name,such as (sda).Becareful,the opration is dangerous:"  diskName

if [ ! "$diskName" ]; then
	echo "input disk name, please!"
	exit
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
	exit
else
	echo $mirrors >> /etc/pacman.d/mirrorlist
fi

#安装基本包
pacstrap /mnt base base-devel linux linux-firmware

#配置fstab
genfstab -U /mnt >> /mnt/etc/fstab

#Change reoot
arch-chroot /mnt

#安装联网需要的包
pacman -S iwd
iwctl device list
read -p "input the device name,such as wlan0:" deviceName
touch /etc/systemd/network/25-wireless.network
cat >/etc/systemd/network/25-wireless.network<<EOF
[Match]
Name=$deviceName

[Network]
DHCP=yes
EOF

sed -i '/Before=network.target/a After=systemd-networkd.service' /etc/systemd/system/multi-user.target.wants/iwd.service
systemctl enable iwd
systemctl enable systemd-networkd

#设置root密码
echo "input the password for root,please!"
passwd

#install grub
pacman -S grub
grub-install --target=i386-pc /dev/${diskName} --recheck
grub-mkconfig -o /boot/grub/grub.cfg

exit
reboot
