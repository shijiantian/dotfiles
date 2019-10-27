#!/bin/bash
sudo pacman -Syu
##安装输入法
sudo pacman -S community/fcitx-im community/fcitx-googlepinyin community/fcitx-configtool
##配置compton
sudo pacman -S community/compton
mkdir ~/.config/compton
wget -O ~/.config/compton/config "https://raw.githubusercontent.com/shijiantian/dotfiles/master/compton/config"
##配置urxvt
sudo pacman -S community/rxvt-unicode
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
