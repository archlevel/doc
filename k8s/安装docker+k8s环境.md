# mac安装docker：

brew cask install docker

当然也可以直接去官网下载docker的pkg文件安装

mac的docker国内镜像：网易的镜像地址：http://hub-mirror.c.163.com。

# 下载&安装kubernetes

参考下面两篇文章即可：

https://github.com/maguowei/k8s-docker-for-mac(https://github.com/shengulong/k8s-docker-for-mac)

注意 https://github.com/maguowei/k8s-docker-for-mac里的文件images最后不要有空行。

最后给下成功启动k8s的具体成功步骤：

1、设置镜像[Registry mirrors]：https://registry.docker-cn.com

2,使用默认代理配置：因为本地没有开启代理，所以这里的系统代理就是没有代理

3、关键的一步：配置k8s所需要的镜像（之前成功启动过，记录了k8s启动所需的镜像），然后执行脚本：./load_images.sh可以快速的安装完镜像，时间不超过5分钟。

```
1，git clone https://github.com/maguowei/k8s-docker-for-mac
2，cd k8s-docker-for-mac
3，./load_images.sh

mac新版本的docker自带Kubernetes，Enable后就会自动开启下载，需要注意的是，下载的时候需要翻墙，解决办法：代理；寻找国内镜像
下载一般要很久，总概要下载10+个镜像，大约在几个小时内。观察镜像是否增加，判断是否在下载中。
```

# 开启K8S功能

点击docker desktop-->preferences-->kubernetes

选中 Enable Kubernetes

选中 Deploy Docker Stacks to Kubernetes by Default

点击 apply

看到docker engine is running && kubernetes is running [表示kubernetes安装正常]

验证：

1，kubectl cluster-info

2，kubectl get nodes

# 开启本机访问代理

$ kubectl proxy 【注意：别退出，不然访问不了下面地址】

通过下面的连接访问 Dashboard: http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

# Create Service Account

参考：https://github.com/kubernetes/dashboard/wiki/Creating-sample-user

kubectl apply -f dashboard-adminuser.yaml

dashboard-adminuser.yaml 内容如下：

```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kube-system
```

# 通过如下命令获取token值

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')


