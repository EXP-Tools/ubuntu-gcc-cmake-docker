FROM ubuntu:20.04
MAINTAINER EXP

RUN apt-get clean && \
    apt-get update -y && \
    apt-get upgrade -y

# 校准服务器时间
ENV TZ=Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN apt-get install tzdata

# 安装系统 GBK 和 UTF-8 中文语言包
RUN apt-get install -y language-pack-zh-hans language-pack-zh-hans-base \
                    language-pack-gnome-zh-hans language-pack-gnome-zh-hans-base
RUN apt-get install -y locales && \
    echo 'zh_CN.GBK GBK' >> /etc/locale.gen && \
    echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen && \
    echo "LANG=zh_CN.UTF-8" >> /etc/environment && \
    locale-gen

# 安装系统必要组件
RUN apt-get install -y curl wget vim zip unzip git telnet net-tools cron logrotate rsyslog procps tofrodos
RUN apt-get install -y python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/todos /usr/bin/unix2dos && \
    ln -s /usr/bin/fromdos /usr/bin/dos2unix 
RUN python -m pip install --upgrade pip

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


RUN echo "alias ll='ls -al'" >> /root/.bashrc
ENTRYPOINT [ "/bin/bash" ]