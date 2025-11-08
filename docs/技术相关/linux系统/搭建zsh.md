---
sidebar_position: 4
---
# 搭建zsh

### 1.安装zsh

``` shell
sudo apt install zsh 
```

### 2.安装on-my-zsh，并把zsh设置为默认的终端
``` shell
bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
```
上述命令执行完成后请重启电脑

### 3.安装自动建议和自动高亮
``` shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

sed -i "s/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)/" .zshrc 
```





