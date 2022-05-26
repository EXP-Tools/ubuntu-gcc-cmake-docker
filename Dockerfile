FROM ubuntu:18.04
MAINTAINER EXP

RUN apt-get clean && \
    apt-get update -y && \
    apt-get upgrade -y

# 安装系统必要组件
RUN apt-get install -y python3 python3-pip wget

# 安装 gcc/g++ 编译套件
RUN apt-get install -y build-essential

# 安装 cmake 依赖库
RUN apt-get install -y openssl libssl-dev

# 下载、编译安装 cmake 3.16
RUN cd /tmp && \
    wget https://github.com/Kitware/CMake/releases/download/v3.16.0-rc1/cmake-3.16.0-rc1.tar.gz && \
    tar -xzvf cmake-3.16.0-rc1.tar.gz && \
    cd cmake-3.16.0-rc1 && \
    ./bootstrap && \
    make -j4 && \
    make install && \
    cd .. && \
    rm -rf cmake-*


RUN echo "alias ll='ls -l'" >> /root/.bashrc
ENTRYPOINT [ "/bin/bash" ]