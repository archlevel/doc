一、创建指定命名空间下的账号密码

kubectl create secret docker-registry default --docker-server=hub.harbor.com --docker-username=admin --docker-password=Harbor12345 --docker-email="test@qq.com" --namespace=${namespace}
1
二、配置特定命名空间下拉去镜像所使用的默认密码

kubectl patch sa default --namespace="${namespace}" -p '{"imagePullSecrets": [{"name": "default"}]}'
