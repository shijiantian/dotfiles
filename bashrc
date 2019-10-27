#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias tr='trash'

#终端提示符配置
PS1='\[\e[36;1m\][\u@\h \[\e[33;1m\]\W\[\e[36;1m\]]\[\e[34;1m\]\$\[\e[32;1m\] '

#命令自动补全
complete -c man which
complete -cf sudo

#代理
#export http_proxy=http://127.0.0.1:12333
#export https_proxy=http://127.0.0.1:12333
