#!/bin/bash

# 备份原地址
sudo cp  /etc/apt/sources.list /etc/apt/sources.list.bak
# 修改镜像源
sudo sed -i "s@http://deb.debian.org/debian@http://mirrors.tencent.com/debian@g" /etc/apt/sources.list

sudo apt update

sudo apt upgrade -y

# 部分图形界面 中文 显示问题
sudo apt install -y fonts-wqy-microhei fonts-wqy-zenhei

# 刷新字体
sudo fc-cache -f -v


sudo apt install vim -y

# 设置 vim 显示行号
sudo echo "set nu" | sudo tee -a /etc/vim/vimrc > /dev/null

# 安装 man 中文 手册
sudo apt install man-db manpages-zh

# 其他必要工具
sudo apt install curl wget xz-utils

# 快速访问主机的下载文件目录 , jsw 为主机用户名
sudo ln -s /mnt/c/Users/jsw/Downloads/ host_download

# 编译 内核
sudo apt install gcc make bc libssl-dev libelf-dev flex bison libncurses-dev

# 设置中文
sudo dpkg-reconfigure locales