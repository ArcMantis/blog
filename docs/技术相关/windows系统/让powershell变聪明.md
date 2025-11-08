---
sidebar_position: 2
---
# 让powershell变聪明
# 安装oh-my-posh，posh-git和Readline 

## 管理员打开powershell7并执行： 
```powershell
Install-Module posh-git -Scope CurrentUser  
Install-Module oh-my-posh -Scope CurrentUser 
```
 

 

## 打开配置文件 
```powershell
notepad.exe $Profile 
```
 

## 加入配置 
```powershell
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/gmay.omp.json" | Invoke-Expression 

Import-Module posh-git 
Import-Module PSReadLine 

# 设置预测文本来源为历史记录 
Set-PSReadLineOption -PredictionSource History  

# 设置 Tab 为菜单补全和 Intellisense 
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete 

# 每次回溯输入历史，光标定位于输入内容末尾 
Set-PSReadLineOption -HistorySearchCursorMovesToEnd  

# 设置向上键为后向搜索历史记录 
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward  

# 设置向下键为前向搜索历史纪录 
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward  

```