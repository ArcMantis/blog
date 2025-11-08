---
sidebar_position: 2
---
# kvm安装手册
# 软件安装
```
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system virt-manager  virtiofsd
```

# 将当前用户加入到组
sudo adduser zane libvirt
sudo adduser zane kvm

