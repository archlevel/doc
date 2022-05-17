基于国外服务器搭建属于自己的VPN的详细教程
A-A+ yantaisolo  2021年10月9日  0  8152 次浏览 运维经验
我们很多人在工作和生活中都需要用到翻墙，但由于种种原因，现在第三方已经不那么容易使用了。下面小编与大家分享如何利用国外服务器构建我们自己的私人VPN。

首先这个方法不是免费的

第一步：你需要有一台国外的服务器，或者香港服务器也可以，云服务平台有很多，如果只是单纯的搭建VPN，可以买便宜的服务器。

第二步：服务器配置，安装Shadowsocks Server

1、执行如下命令

wget –no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh

2、上面的命令执行结束后，执行下面的命令

chmod +x shadowsocks-all.sh

3、上面的命令执行结束后，执行下面的命令

./shadowsocks-all.sh 2>&1| tee shadowsocks-all.log

4、执行上述命令会有相关输入提示操作;根据需要选择。不明白的话就直接选1或者直接默认回车;之后会提示你输入密码和端口，对应设置即可，或者直接使用默认的;由于 iPhone端的wingy目前只支持到cfb，所以加密方式选择aes-256-cfb也就是选择7;全部执行完成之后就会出现如下信息：

StartingShadowsocks success

Congratulations, Shadowsocks-Python server install completed!

YourServer IP : 你的IP

YourServerPort: 在第四步提示设置的端口号

YourPassword: 在第四步提示设置的密码

YourEncryptionMethod: aes-256-cfb

Your QR Code: (ForShadowsocksWindows, OSX, Androidand iOS clients)

ss://YWVzLTI1Ni1jZmI6emh1aTA4MTA0MTJaaaccuMjmmLjU1LjE5MTo4tdVg4

Your QR Code has been saved as a PNG file path:

/root/shadowsocks_python_qr.png

Welcome to visit: https://teddysun.com/486.html

Enjoy it!

5、看到以上信息就说明安装完成了，然后根据不同的终端设备进行设置就可以了

第三步、使用Shadowsocks终端体验VPN

1、下载对应客户端

Windows：https://github.com/shadowsocks/shadowsocks-windows/releases

Mac：https://github.com/yangfeicheung/Shadowsocks-X/releases

Android：https://github.com/shadowsocks/shadowsocks-android/releases

iPhone：App Store上下载ShadowLink，这个要用国外appid才可以下载哦。国内的搜不到的，因为shadowrocket收费的

2、配置Shadowsocks

windows

下载之后运行就会看到右下角有小飞机，然后右键编辑服务器;对应的服务器地址、端口、密码、加密方式就是第二步中4步骤中看到的信息，对应填写确定即可;

见证奇迹的时刻到了浏览器打开https://www.google.com/

android手机

安装好上面对应的客户端如下图左边的填写对应的服务ip、端口、密码、加密方式然后保存;然后点击中间图下面的小飞机，看到手机上面有个钥匙的就是成功了，然后你就可以用浏览器访问Google了
