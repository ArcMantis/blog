---
sidebar_position: 2
---
# 庸通NAS自定义服务开机自启
## 查看电池优化白名单： 
```shell
cmd deviceidle whitelist 
```
 

## 授予“忽略电池优化”权限 
```shell
adb shell cmd deviceidle whitelist +com.termux 
```
 

## 用root方式执行命令
```shell
su root  ls  /etc 
```


 

## 从电池优化移除 
```shell
adb shell cmd deviceidle whitelist -com.termux 
```
## 让sshd开机自启动，以termux服务的方式； 

管理方式：现在你应该使用 sv 命令来管理 sshd 服务： 

    启动服务：sv up sshd 

    停止服务：sv down sshd 

    查看状态：sv status sshd 

    重启服务：sv restart sshd 

这样不用自己写脚本了 