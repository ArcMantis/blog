---
sidebar_position: 3
---
# 内核相关
# 显示当前正在用的内核
``` shell
uname -r
```

# 列出系统中已安装的所有内核
``` shell
dpkg -l | grep linux-image
```
注意：linux-image-amd64 是一个元数据包（meta），它总是指向当前推荐的最新稳定内核，用于确保系统更新时能自动升级内核。不要删除这个包。

# 删除旧的不用的内核
``` shell
sudo apt purge linux-image-xxx
```

