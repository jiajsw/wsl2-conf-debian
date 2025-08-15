#!/bin/bash

# 定义标志文件路径
SCRIPT_FLAG="/var/log/.wsl2_debian_bash"

# 检查标志文件是否存在
if [ -f "$SCRIPT_FLAG" ]; then
    echo "脚本已经执行过，跳过执行。"
    exit 0
fi

# 如果存在 /etc/apt/sources.list.bak 跳过 , 避免多次覆盖 /etc/apt/sources.list.bak
if [ ! -f /etc/apt/sources.list.bak ]; then
    # 备份原地址
    sudo cp  /etc/apt/sources.list /etc/apt/sources.list.bak

    # 修改镜像源
    sudo sed -i "s@http://deb.debian.org/debian@http://mirrors.tencent.com/debian@g" /etc/apt/sources.list

fi

sudo apt update

sudo apt upgrade -y

# 部分图形界面 中文 显示问题
sudo apt install -y fonts-wqy-microhei fonts-wqy-zenhei


sudo apt install -y fonts-firacode

# 刷新字体
sudo fc-cache -f -v


sudo apt install vim -y

# 设置 vim 显示行号
sudo echo "set nu" | sudo tee -a /etc/vim/vimrc > /dev/null

# 安装 man 中文 手册
sudo apt install -y man-db manpages-zh

# 其他必要工具
sudo apt install -y curl wget xz-utils

# 快速访问主机的下载文件目录 , jsw 为主机用户名, 换成自己的
sudo ln -s /mnt/c/Users/jsw/Downloads/ ~/host_download

# 编译 内核
sudo apt install -y gcc make bc libssl-dev libelf-dev flex bison libncurses-dev

# 个人配置
# 命令提示符 换个行
sudo echo 'export PS1="$PS1\n\\$ "' | sudo tee -a ~/.bashrc > /dev/null
# 打印 系统信息, neowofetch , screenfetch 或 fastfetch 都可以
sudo apt install -y fastfetch
# 模拟《黑客帝国》中“数字雨”效果
sudo apt install -y cmatrix



# TAB 补全
sudo apt install -y bash-completion

# 配置 root 也可以 tab 键补全 , 内容是从 /etc/bash.bashrc 复制的
sudo echo '# enable bash completion in interactive shells' | sudo tee -a /etc/bash.bashrc > /dev/null
sudo echo 'if ! shopt -oq posix; then' | sudo tee -a /etc/bash.bashrc > /dev/null
sudo echo '  if [ -f /usr/share/bash-completion/bash_completion ]; then' | sudo tee -a /etc/bash.bashrc > /dev/null
sudo echo '    . /usr/share/bash-completion/bash_completion' | sudo tee -a /etc/bash.bashrc > /dev/null
sudo echo '  elif [ -f /etc/bash_completion ]; then' | sudo tee -a /etc/bash.bashrc > /dev/null
sudo echo '    . /etc/bash_completion' | sudo tee -a /etc/bash.bashrc > /dev/null
sudo echo '  fi' | sudo tee -a /etc/bash.bashrc > /dev/null
sudo echo 'fi' | sudo tee -a /etc/bash.bashrc > /dev/null

# 隔离 Win 主机的 PATH
sudo echo '[interop]' | sudo tee -a /etc/wsl.conf > /dev/null
sudo echo 'enabled=false' | sudo tee -a /etc/wsl.conf > /dev/null
sudo echo 'appendWindowsPath=false' | sudo tee -a /etc/wsl.conf > /dev/null


# 设置中文
sudo dpkg-reconfigure locales

# 创建标志文件，表示脚本已执行
sudo touch "$SCRIPT_FLAG"
echo "脚本执行完成，已创建标志文件 $SCRIPT_FLAG"