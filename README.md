# ubuntu-gcc-cmake-docker
> ubuntu 18.04 + gcc 7.5.0 + cmake 3.16.0

------

## 说明

这是集成了 ![](https://img.shields.io/badge/ubuntu|18.04-brightgreen.svg) ![](https://img.shields.io/badge/gcc|7.5.0-brightgreen.svg) ![](https://img.shields.io/badge/cmake|3.16.0-brightgreen.svg) 的 docker 镜像。

> 因 gcc 环境安装耗时极长，故这主要是为了编译加速而设


## 使用步骤

1. 首次使用时在系统安装 [git](https://git-scm.com/)、 [docker](https://www.docker.com/) 和 [docker-compose](https://docs.docker.com/compose/install/)
2. 拉取此仓库到本地任意位置 `git clone https://github.com/lyy289065406/ubuntu-gcc-cmake-docker`
4. [`bin`](./bin) 目录下为 docker 操作脚本，`*.sh` 为 linux/mac 脚本，`*.ps1` 为 windows 脚本，按需选用即可：
  - 清理镜像：[`bin/clean.sh`](./bin/clean.sh) 或 [`bin/clean.ps1`](./bin/clean.ps1)
  - 构建镜像：[`bin/build.sh`](./bin/build.sh) 或 [`bin/clean.ps1`](./bin/build.ps1) （首次执行耗时较长）
  - 发布镜像：[`bin/deploy.sh`](./bin/deploy.sh) 或 [`bin/deploy.ps1`](./bin/deploy.ps1) （如需发布到自己的空间请修改 `NAMESPACE`）
  - 运行容器：[`bin/run.sh`](./bin/run.sh) 或 [`bin/run.ps1`](./bin/run.ps1)
  - 停止容器：[`bin/stop.sh`](./bin/stop.sh) 或 [`bin/stop.ps1`](./bin/stop.ps1)


> 最新镜像已发布到 docker hub : [`docker pull expm02/ubuntu-gcc-cmake-docker:latest`](https://hub.docker.com/r/expm02/ubuntu-gcc-cmake-docker)
