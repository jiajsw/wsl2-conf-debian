# WSL2 安装 Linux

### 设置默认 WSL 版本

```
wsl --set-default-version <Version>

建议 WSL2
wsl --set-default-version 2 

单独修改 某个分发版的 WSL 版本
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

### 安装 默认 Ubuntu 分发版

```
wsl --install
```

### 列出已安装的 Linux 分发版

```
wsl --list --verbose
wsl -l -v
```

### 设置默认 Linux 分发版

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