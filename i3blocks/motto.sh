#!/bin/bash
num=68;
sed -n ${num}p ~/.config/i3blocks/motto
if [ $num -lt 160 ]
then
	let num+=1;
else
	let num=1;	
fi
sed -i "2s/.*/num=${num};/g" ~/.config/i3blocks/motto.sh
