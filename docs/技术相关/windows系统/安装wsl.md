---
sidebar_position: 1
---
# 安装wsl
## 安装前的准备
wsl有1和2，安装一个即可，不管安装哪个，先开启相关windows功能，且wsl1和wsl2开启的功能不同。  
首先进入控制面板(查看方式小图标)->控制和功能->左侧"启用和关闭windows功能"  ，然后根据你需要wsl1还是wsl2开启不同开关

### ***wsl1***
只要开启"适用于Linux的windows子系统"即可。  
随后**管理员**方式打开powershell
```powershell
 wsl --set-default-version 1 
```

### ***wsl2***
需要开启3个功能    
- "适用于Linux的windows子系统"  
- "Hyper-V"  
- "Virtual Machine Platform"   
随后**管理员**方式打开powershell  
```powershell
 wsl --set-default-version 12
```

## 最后的安装
重启电脑，去微软商店搜索debian安装即可 

 
