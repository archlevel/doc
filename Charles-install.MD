charles 安装：

+ 1，登陆到百度盘，下载charles 4.2.7.dmg;
+ 2，安装charles 4.2.7；
+ 3，运行java -jar keygen.jar

+ name:TEAM MESMERiZE
+ key:FC91D362FB19D6E6CF

+ Name:https://zhile.io
+ Key: 48891cf209c6d32bf4

+ 4，安装电脑证书：help-->SSL Proxy--->Save Charles Root Certificate...

保存为证书：charles-ssl-proxying-certificate.pem

+ 5，打开 前往-->实用工具-->钥匙串访问：导入上面保存的charles证书到系统根证书并调整为<<始终信任>>；

+ 6，代理设置
  + proxy-->proxy setting; port:8888,enable transparent http proxying=true
  + proxy--> SSL proxy setting; enable SSL proxying=true；add host：*

+ 手机端设置：【手机和pc机器必须是同一无线网络】

+ http 代理设置

设置代理ip【备注：必须是代理机器的无线网络的ip地址】&端口，http抓包就可以了；

+ https 代理设置：

+ 1，打开手机端Safari，访问chls.pro/ssl;弹出证书下载提示，按照提示操作即可；
+ 2，安装手机端证书：通用-->描述文件-->安装证书
+ 3，信任手机端证书：通用-->关于本机-->证书信任设置-->信任charles相关证书；【】
+ 4，设置代理ip及端口；
+ 5，愉快的抓包。。。

