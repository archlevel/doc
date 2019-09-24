Docker最佳实践：5个方法精简镜像

### 精简Docker镜像大小的必要性

Docker镜像由很多镜像层（Layers）组成（最多127层），镜像层依赖于一系列的底层技术，比如文件系统(filesystems)、写时复制(copy-on-write)、联合挂载(union mounts)等技术，你可以查看Docker社区文档以了解更多有关Docker存储驱动的内容，这里就不再赘述技术细节。总的来说，Dockerfile中的每条指令都会创建一个镜像层，继而会增加整体镜像的尺寸。

下面是精简Docker镜像尺寸的好处：

1、减少构建时间

2、减少磁盘使用量

3、减少下载时间

4、因为包含文件少，攻击面减小，提高了安全性

5、提高部署速度

### 五点建议减小Docker镜像尺寸

#### 优化基础镜像

优化基础镜像的方法就是选用合适的更小的基础镜像，常用的 Linux 系统镜像一般有 Ubuntu、CentOs、Alpine，其中Alpine更推荐使用。大小对比如下：
```
lynzabo@ubuntu ~/s> docker images
REPOSITORY         TAG             IMAGE ID            CREATED             SIZE
ubuntu             latest        74f8760a2a8b        8 days ago          82.4MB
alpine             latest        11cd0b38bc3c        2 weeks ago         4.41MB
centos               7           49f7960eb7e4        7 weeks ago         200MB
debian             latest        3bbb526d2608        8 days ago          101MB
lynzabo@ubuntu ~/s>
```
Alpine是一个高度精简又包含了基本工具的轻量级Linux发行版，基础镜像只有4.41M，各开发语言和框架都有基于Alpine制作的基础镜像，强烈推荐使用它。

查看上面的镜像尺寸对比结果，你会发现最小的镜像也有4.41M，那么有办法构建更小的镜像吗？答案是肯定的，例如 gcr.io/google_containers/pause-amd64:3.1 镜像仅有742KB。为什么这个镜像能这么小？在为大家解密之前，再推荐两个基础镜像：

##### scratch镜像 

scratch是一个空镜像，只能用于构建其他镜像，比如你要运行一个包含所有依赖的二进制文件，如Golang程序，可以直接使用scratch作为基础镜像。现在给大家展示一下上文提到的Google pause镜像Dockerfile：
```
FROM scratch
ARG ARCH
ADD bin/pause-${ARCH} /pause
ENTRYPOINT ["/pause"]
```
Google pause镜像使用了scratch作为基础镜像，这个镜像本身是不占空间的，使用它构建的镜像大小几乎和二进制文件本身一样大，所以镜像非常小。当然在我们的Golang程序中也会使用。对于一些Golang/C程序，可能会依赖一些动态库，你可以使用自动提取动态库工具，比如ldd、linuxdeployqt等提取所有动态库，然后将二进制文件和依赖动态库一起打包到镜像中。

##### busybox镜像

scratch是个空镜像，如果希望镜像里可以包含一些常用的Linux工具，busybox镜像是个不错选择，镜像本身只有1.16M，非常便于构建小镜像。串联 Dockerfile 指令

大家在定义Dockerfile时，如果太多的使用RUN指令，经常会导致镜像有特别多的层，镜像很臃肿，而且甚至会碰到超出最大层数（127层）限制的问题，遵循 Dockerfile 最佳实践，我们应该把多个命令串联合并为一个 RUN（通过运算符&&和/ 来实现），每一个 RUN 要精心设计，确保安装构建最后进行清理，这样才可以降低镜像体积，以及最大化的利用构建缓存。

下面是一个优化前Dockerfile：
```
FROM ubuntu

ENV VER     3.0.0  
ENV TARBALL http://download.redis.io/releases/redis-$VER.tar.gz  
# ==> Install curl and helper tools...
RUN apt-get update  
RUN apt-get install -y  curl make gcc  
# ==> Download, compile, and install...
RUN curl -L $TARBALL | tar zxv  
WORKDIR  redis-$VER  
RUN make  
RUN make install  
#...
# ==> Clean up...
WORKDIR /  
RUN apt-get remove -y --auto-remove curl make gcc  
RUN apt-get clean  
RUN rm -rf /var/lib/apt/lists/*  /redis-$VER  
#...
CMD ["redis-server"]
```
构建镜像，名称叫 test/test:0.1。

我们对Dockerfile做优化，优化后Dockerfile：
```
FROM ubuntu

ENV VER     3.0.0  
ENV TARBALL http://download.redis.io/releases/redis-$VER.tar.gz

RUN echo "==> Install curl and helper tools..."  && \  
    apt-get update                      && \
    apt-get install -y  curl make gcc   && \
    echo "==> Download, compile, and install..."  && \
    curl -L $TARBALL | tar zxv  && \
    cd redis-$VER               && \
    make                        && \
    make install                && \
    echo "==> Clean up..."  && \
    apt-get remove -y --auto-remove curl make gcc  && \
    apt-get clean                                  && \
    rm -rf /var/lib/apt/lists/*  /redis-$VER
#...
CMD ["redis-server"]
```
构建镜像，名称叫 test/test:0.2。

对比两个镜像大小：
```
root@k8s-master:/tmp/iops# docker images
REPOSITORY       TAG           IMAGE ID            CREATED             SIZE
test/test        0.2         58468c0222ed        2 minutes ago       98.1MB
test/test        0.1         e496cf7243f2        6 minutes ago       307MB
root@k8s-master:/tmp/iops#
```
可以看到，将多条RUN命令串联起来构建的镜像大小是每条命令分别RUN的三分之一。

提示：为了应对镜像中存在太多镜像层，Docker 1.13版本以后，提供了一个压扁镜像功能，即将 Dockerfile 中所有的操作压缩为一层。这个特性还处于实验阶段，Docker默认没有开启，如果要开启，需要在启动Docker时添加-experimental 选项，并在Docker build 构建镜像时候添加 –squash 。我们不推荐使用这个办法，请在撰写 Dockerfile 时遵循最佳实践编写，不要试图用这种办法去压缩镜像。使用多阶段构建

Dockerfile中每条指令都会为镜像增加一个镜像层，并且你需要在移动到下一个镜像层之前清理不需要的组件。实际上，有一个Dockerfile用于开发（其中包含构建应用程序所需的所有内容）以及一个用于生产的瘦客户端，它只包含你的应用程序以及运行它所需的内容。这被称为“建造者模式”。Docker 17.05.0-ce版本以后支持多阶段构建。使用多阶段构建，你可以在Dockerfile中使用多个FROM语句，每条FROM指令可以使用不同的基础镜像，这样您可以选择性地将服务组件从一个阶段COPY到另一个阶段，在最终镜像中只保留需要的内容。

下面是一个使用COPY --from 和 FROM ... AS ... 的Dockerfile：
```
# Compile
FROM golang:1.9.0 AS builder
WORKDIR /go/src/v9.git...com/.../k8s-monitor
COPY . .
WORKDIR /go/src/v9.git...com/.../k8s-monitor
RUN make build
RUN mv k8s-monitor /root

# Package
# Use scratch image
FROM scratch
WORKDIR /root/
COPY --from=builder /root .
EXPOSE 8080
CMD ["/root/k8s-monitor"]
```
构建镜像，你会发现生成的镜像只有上面COPY 指令指定的内容，镜像大小只有2M。这样在以前使用两个Dockerfile（一个Dockerfile用于开发和一个用于生产的瘦客户端），现在使用多阶段构建就可以搞定。

### 构建业务服务镜像技巧

Docker在build镜像的时候，如果某个命令相关的内容没有变化，会使用上一次缓存（cache）的文件层，在构建业务镜像的时候可以注意下面两点：

1、不变或者变化很少的体积较大的依赖库和经常修改的自有代码分开；

2、因为cache缓存在运行Docker build命令的本地机器上，建议固定使用某台机器来进行Docker build，以便利用cache。

下面是构建Spring Boot应用镜像的例子，用来说明如何分层。其他类型的应用，比如Java WAR包，Nodejs的npm 模块等，可以采取类似的方式。

1、在Dockerfile所在目录，解压缩maven生成的jar包

$ unzip <path-to-app-jar>.jar -d app
2、Dockerfile 我们把应用的内容分成4个部分COPY到镜像里面：其中前面3个基本不变，第4个是经常变化的自有代码。最后一行是解压缩后，启动spring boot应用的方式。
```
FROM openjdk:8-jre-alpine

LABEL maintainer "opl-xws@xiaomi.com"
COPY app/BOOT-INF/lib/ /app/BOOT-INF/lib/
COPY app/org /app/org
COPY app/META-INF /app/META-INF
COPY app/BOOT-INF/classes /app/BOOT-INF/classes
EXPOSE 8080
CMD ["/usr/bin/java", "-cp", "/app", "org.springframework.boot.loader.JarLauncher"]
```
这样在构建镜像时候可大大提高构建速度。

### 其他优化办法

当然，除了以上4类办法外，还有其他优化办法可以精简镜像；

1. RUN命令中执行apt、apk或者yum类工具技巧

如果在RUN命令中执行apt、apk或者yum类工具，可以借助这些工具提供的一些小技巧来减少镜像层数量及镜像大小。举几个例子：

（1）在执行apt-get install -y 时增加选项— no-install-recommends ，可以不用安装建议性（非必须）的依赖，也可以在执行apk add 时添加选项--no-cache 达到同样效果；

（2）执行yum install -y 时候， 可以同时安装多个工具，比如yum install -y gcc gcc-c++ make ...。将所有yum install 任务放在一条RUN命令上执行，从而减少镜像层的数量；

（3）组件的安装和清理要串联在一条指令里面，如 apk --update add php7 && rm -rf /var/cache/apk/* ，因为Dockerfile的每条指令都会产生一个文件层，如果将apk add ...和 rm -rf ... 命令分开，清理无法减小apk命令产生的文件层的大小。Ubuntu或Debian可以使用 rm -rf /**var**/lib/apt/lists/* 清理镜像中缓存文件；CentOS等系统使用yum clean all 命令清理。

2. 压缩镜像

Docker 自带的一些命令还能协助压缩镜像，比如 export 和 import

$ docker run -d test/test:0.2
$ docker export 747dc0e72d13 | docker import - test/test:0.3
使用这种方式需要先将容器运行起来，而且这个过程中会丢失镜像原有的一些信息，比如：导出端口，环境变量，默认指令。

查看这两个镜像history信息，如下，可以看到test/test:0.3 丢失了所有的镜像层信息：
```
root@k8s-master:/tmp/iops# docker history test/test:0.3
IMAGE               CREATED             CREATED BY          SIZE                COMMENT
6fb3f00b7a72        15 seconds ago                          84.7MB              Imported from -
root@k8s-master:/tmp/iops# docker history test/test:0.2
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
58468c0222ed        2 hours ago         /bin/sh -c #(nop)  CMD ["redis-server"]         0B      
1af7ffe3d163        2 hours ago         /bin/sh -c echo "==> Install curl and helper…   15.7MB  
8bac6e733d54        2 hours ago         /bin/sh -c #(nop)  ENV TARBALL=http://downlo…   0B      
793282f3ef7a        2 hours ago         /bin/sh -c #(nop)  ENV VER=3.0.0                0B      
74f8760a2a8b        8 days ago          /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B      
<missing>           8 days ago          /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B
<missing>           8 days ago          /bin/sh -c sed -i 's/^#\s*\(deb.*universe\)$…   2.76kB
<missing>           8 days ago          /bin/sh -c rm -rf /var/lib/apt/lists/*          0B
<missing>           8 days ago          /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   745B    
<missing>           8 days ago          /bin/sh -c #(nop) ADD file:5fabb77ea8d61e02d…   82.4MB  
root@k8s-master:/tmp/iops#
```
社区里还有很多压缩工具，比如Docker-squash ，用起来更简单方便，并且不会丢失原有镜像的自带信息，大家有兴趣可以试试。
