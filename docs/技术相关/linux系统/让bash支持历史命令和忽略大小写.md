---
sidebar_position: 6
---
# 优化bash

在.bashrc 追加如下内容，既可以实现按👆，实现智能历史搜索。
``` shell
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

```
