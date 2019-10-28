#!/bin/bash
sudo pacman -Syu
##安装工具
sudo pacman -S core/curl extra/wget core/net-tools
##安装输入法
sudo pacman -S community/fcitx-im community/fcitx-googlepinyin community/fcitx-configtool
##配置compton
#sudo pacman -S community/compton
#mkdir ~/.config/compton
#wget -O ~/.config/compton/config "https://raw.githubusercontent.com/shijiantian/dotfiles/master/compton/config"
##配置urxvt
sudo pacman -S community/rxvt-unicode community/wqy-zenhei
wget -O ~/.Xresources "https://raw.githubusercontent.com/shijiantian/dotfiles/master/rxvt-unicode/Xresources"
xrdb -load ~/.Xresources
##配置i3-gaps
sudo pacman -S community/i3-gaps community/i3blocks  extra/feh
wget -O ~/.config/i3/config "https://raw.githubusercontent.com/shijiantian/dotfiles/master/i3-gaps/config"
wget -O ~/.config/i3blocks/motto "https://raw.githubusercontent.com/shijiantian/dotfiles/master/i3blocks/motto"
wget -O ~/.config/i3blocks/motto.sh "https://raw.githubusercontent.com/shijiantian/dotfiles/master/i3blocks/motto.sh"
wget -O ~/.config/i3blocks/config "https://raw.githubusercontent.com/shijiantian/dotfiles/master/i3blocks/config"
wget -O ~/.config/i3/wallpaper.jpeg "http://5b0988e595225.cdn.sohucs.com/images/20190611/1c82de041981448bbb4f40ad1ecedc9a.jpeg"

##配置rofi
sudo pacman -S community/rofi
mkdir ~/.config/rofi/themes
wget -O ~/.config/rofi/config "https://raw.githubusercontent.com/shijiantian/dotfiles/master/rofi/config"
wget -O ~/.config/rofi/themes/onedark.rasi "https://raw.githubusercontent.com/shijiantian/dotfiles/master/rofi/themes/onedark.rasi"
i3-msg reload

##设置时区
sudo ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
sudo hwclock --systohc
##设置locale
sudo sed -i "s/^#en_US.UTF-8/en_US.UTF-8/g" /etc/locale.gen
sudo sed -i "s/^#zh_CN.UTF-8/zh_CN.UTF-8/g" /etc/locale.gen
sudo sed -i "s/^#zh_HK.UTF-8/zh_HK.UTF-8/g" /etc/locale.gen
sudo sed -i "s/^#zh_TW.UTF-8/zh_TW.UTF-8/g" /etc/locale.gen
sudo locale-gen
sudo bash -c 'echo "LANG=en_US.UTF-8" > /etc/locale.conf'
##设置主机名
sudo bash -c 'echo "myArch" > /etc/hostname'
##设置hosts
sudo bash -c 'echo "127.0.0.1    localhost" >> /etc/hosts'
sudo bash -c 'echo "::1          localhost" >> /etc/hosts'
sudo bash -c 'echo "127.0.0.1    myArch.localdomain myArch" >>/etc/hosts'

##安装trash命令
sudo pacman -S community/trash-cli

wget -O ~/.bashrc "https://raw.githubusercontent.com/shijiantian/dotfiles/master/bashrc"
source ~/.bashrc
wget -O ~/.vimrc "https://raw.githubusercontent.com/shijiantian/dotfiles/master/vimrc"

##设置lightdm
sudo wget -O /etc/ligthdm/lightdm-gtk-greeter.conf "https://raw.githubusercontent.com/shijiantian/dotfiles/master/lightdm/lightdm-gtk-greeter.conf"
sudo wget -O /etc/lightdm/wallpaper.jpg "https://raw.githubusercontent.com/shijiantian/dotfiles/master/wallpaper.jpg"


