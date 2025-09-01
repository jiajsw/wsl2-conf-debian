# WSL2 安装 Linux

- 主要参考 [WSL文档](https://learn.microsoft.com/zh-cn/windows/wsl/basic-commands)
- 建议使用 `PowerShell`
- 发行版 分发版 没个球区别

### 最佳实践

```
wsl --install -d Debian --location F:/wsl/jia --name jia 
```

### 设置默认 WSL 版本

```
wsl --set-default-version <Version>

建议 WSL2
wsl --set-default-version 2 

单独修改 某个发行版的 WSL 版本
wsl --set-version <distribution name> <versionNumber>
```

### WSL2 更新

```
wsl --update
```

### 查看可用发行版列表

```PS
wsl --list --online
wsl -l -o
```

### 安装默认发行版

> 默认安装 Ubuntu

```
wsl --install
```

### 安装指定发行版

```
wsl --install -d <DistroName>

> 个人偏好 Debian
wsl --install -d Debian 
> 可以 安装多个相同发行版 通过 --name 区分 
wsl --install -d Debian --name mydebian
```

### 列出已安装的 Linux 发行版

```
wsl --list --verbose
wsl -l -v
```

### 设置默认 Linux 发行版

- 直接 wsl 默认登录的发行版, 可以是 --name 指定的名字

```
wsl --set-default <Distribution Name> 
```

### 检查 WSL 状态

```
wsl --status
```

### 检查 WSL 版本

```
wsl --version
```

### Help 命令

```
wsl --help
```

### 关机

```
wsl --shutdown
```

### 更改发行版的默认用户

```
<DistributionName> config --default-user <Username>
```

### 终止

```
wsl --terminate <Distribution Name>
wsl -t <Distribution Name>
```

### 注销或卸载 Linux 发行版

```
wsl --unregister <DistributionName>
```

### 导入, 导出

```
wsl --import <Distribution Name> <InstallLocation> <FileName>

wsl --export <Distribution Name> <FileName>
```