# docker-hexo

![buildx](https://github.com/ryjer/docker-hexo/workflows/buildx/badge.svg)
[![Docker Stars](https://img.shields.io/docker/stars/ryjer/hexo.svg)](https://hub.docker.com/r/ryjer/hexo/)
[![Docker Pulls](https://img.shields.io/docker/pulls/ryjer/hexo.svg)](https://hub.docker.com/r/ryjer/hexo/)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Usage
Use this image in docker
### 1. Pull image
```bash
docker pull wryjer/hexo
```
### 2. Learn hexo
Read the basic usage of Hexo [Basic Usage](https://hexo.io/docs/commands.html)
### 3. hexo init
```bash
docker run --rm -it \
  -v $PWD:/hexo \
  wryjer/hexo \
  hexo init
```
### 4. hexo new
```bash
docker run --rm -it \
  -v $PWD:/hexo \
  wryjer/hexo \
  hexo new [layout] <title>
```
### 5. hexo generate
```bash
docker run --rm -it \
  -v $PWD:/hexo \
  wryjer/hexo \
  hexo generate
```
### 6. hexo server
```bash
docker run --name hexo -d \
  -v $PWD:/hexo \
  -p 80:4000 \
  wryjer/hexo \
  hexo server
```
### More
Read the basic usage of Hexo [Basic Usage](https://hexo.io/docs/commands.html)
---

### 使用说明：

你需要将 hexo 博客目录(该目录内会有 **_config.yml等文件**和**source themes scaffolds 等文件夹**)映射到 docker 容器中的 **/hexo** 目录中，如果你需要hexo 作为服务器运行或者预览结果的话。还需要将端口映射到docker容器的 **4000** 端口上。
#### 一、拉取镜像 
```bash
docker pull wryjer/hexo
```
**问题：docker 中的npm 软件源为默认设置，可能会下载缓慢，你可以选择预先配置了淘宝npm源的镜像版本**
```bash
docker pull wryjer/hexo:tb
```
### 二、进入 hexo 博客目录
``` bash
# 具体路径由你决定，以下路径仅用于演示
cd /root/hexo
```
#### 三、hexo init 初始化hexo目录
详细命令见 [Hexo 官方文档链接](https://hexo.io/zh-cn/docs/commands)
```bash
# 使用相对路径，在当前目录下进行 hexo init 初始化
docker run --rm -it \
  -v $PWD:/hexo \
  wryjer/hexo:tb \
  hexo init
```
#### 四、hexo new 新建文章
```bash
# 使用相对路径，需要进入hexo 博客目录
docker run --rm -it \
  -v $PWD:/hexo \
  wryjer/hexo:tb \
  hexo new "文章标题"
```
#### 五、hexo g 生成静态文件
注意：该命令会生成静态网站的所有文件到你映射目录（以下例子中为 **/root/hexo** 目录）下的 public 文件夹中
```bash
# 使用相对路径，需进入一个hexo博客的目录
docker run --rm -it \
  -v $PWD:/hexo \
  wryjer/hexo:tb \
  hexo g
```
#### 六、hexo s 启动服务器
hexo s 会将映射目录下的 public 目录（首先你要有public）挂载到网站根目录下，然后在容器内的 4000端口提供访问。所以需要额外映射主机端口，下面的例子中将本机80端口映射到容器的4000端口。
```bash
# 使用相对路径，需进入一个hexo博客的目录
docker run --name hexo -d \
  -v $PWD:/hexo \
  -p 80:4000 \
  wryjer/hexo:tb \
  hexo s
```
#### 其他：本镜像安装了hexo 和 git，需要除git之外其他软件包运行的命令可能会无法运行。
