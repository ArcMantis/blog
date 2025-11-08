---
sidebar_position: 1
---
# docker的安装  

## 本体安装
``` shell
sudo apt install docker.io docker-compose docker-cli docker-doc docker-clean
```
解释：

docker.io
→ 核心的 Docker 引擎（daemon + client），这是你最少需要安装的。

docker-compose
→ 用来管理多容器应用（比如你要同时起数据库 + web 服务）。常用，建议装。

docker-doc
→ 文档包（man pages、离线文档），可选。

docker-buildx
→ 高级构建工具（跨架构镜像构建等），不装也能用，除非有特殊需求。

docker-registry
→ 私有镜像仓库服务，一般不需要。

docker-clean
→ 清理容器/镜像的小工具，可选。

docker-cli
→ 有些时候 docker.io 依赖里已经带了 CLI，不需要单独装。

## 管理器安装
```shell
flatpak install flathub com.github.sdv43.whaler
```

# docker使用
## 确认 Docker 服务已启动
```shell
systemctl status docker
```

## 跑一个官方测试容器
```shell
sudo docker run hello-world
```

## 容器和镜像的位置
镜像默认在
/var/lib/docker/

容器默认在
/var/lib/docker/containers/

查看本地的镜像
docker images

查看正在运行的容器
docker ps

查看所有容器(包括停止的)
docker ps -a

删除容器
docker rm <容器id>

删除镜像 
docker rmi <镜像id>

