#!/bin/bash

_OLD_PS1="$PS1"
_MY_VAR_INIT=1
PROMPT_COMMAND='PS1="$_OLD_PS1[$_MY_VAR_INIT]\n\\$ ";((_MY_VAR_INIT++))'

sudo apt update && sudo apt upgrade -y

sudo apt install -y vim fonts-firacode fonts-wqy-microhei fonts-wqy-zenhei 

# 刷新字体
sudo fc-cache -f -v

# 设置 vim 显示行号
echo "set nu" | sudo tee -a /etc/vim/vimrc > /dev/null


