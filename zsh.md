某些文件

配置终端启动时自动执行一些命令, 一般是source命令,

可以在 ~/.bashrc, ~/.bash_profile, ~/.profile, 或者 ~/.zshrc 文件添加这些命令，

然后重新启动终端。

关于~/.zshrc

当 Zsh 启动时，它会按照顺序依次读取下面的配置文件：

/etc/zsh/zshenv

该文件应该包含用来设置PATH 环境变量[broken link: invalid section]以及其他一些环境变量的命令；不应该包含那些可以产生输出结果或者假设终端已经附着到 tty 上的命令。

~/.zshenv

该文件和 /etc/zsh/zshenv 相似，但是它是针对每个用户而言的。一般来说是用来设置一些有用的环境变量。

/etc/zsh/zprofile

这是一个全局的配置文件，在用户登录的时候加载。一般是用来在登录的时候执行一些命令。请注意，在 Arch Linux 里该文件默认包含一行配置，用来加载 /etc/profile 文件，详见 #全局配置文件。

/etc/profile

在登录时，该文件应该被所有和伯克利（Bourne）终端相兼容的终端加载：它在登录的的时候会加载应用相关的配置（/etc/profile.d/*.sh）。注意在 Arch Linux 里，Zsh 会默认加载该文件。

~/.zprofile

该文件一般用来在登录的时候自动执行一些用户脚本。

/etc/zsh/zshrc

当 Zsh 被作为交互式终端的时候，会加载这样一个全局配置文件。

~/.zshrc

当 Zsh 被作为交互式终端的时候，会加载这样一个用户配置文件。

/etc/zsh/zlogin

在登录完毕后加载的一个全局配置文件。

~/.zlogin

和 /etc/zsh/zlogin 相似，但是它是针对每个用户而言的。

/etc/zsh/zlogout

在注销的时候被加载的一个全局配置文件。

~/.zlogout

和 /etc/zsh/zlogout 相似，但是它是针对每个用户而言的.
