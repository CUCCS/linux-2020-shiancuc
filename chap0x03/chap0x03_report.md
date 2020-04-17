# 第三章实验报告

## 1.软件环境
- Ubuntu 18.04 Server 64bit
- asciinema

## 2.实验要求
- 参照这两篇文章进行实验
  - [Systemd 入门教程：命令篇 by 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html/)
  - [Systemd 入门教程：实战篇 by 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html)
- 参照第2章作业的要求，完整实验操作过程通过asciinema进行录像并上传，文档通过github上传

## 3.实验过程

- ### 命令篇
  - ##### 开关机重启命令未录
  [![asciicast](https://asciinema.org/a/64I4t2oxvvEJE1L9CHRgrkJwc.svg)](https://asciinema.org/a/64I4t2oxvvEJE1L9CHRgrkJwc)

- ### 实战篇
  [![asciicast](https://asciinema.org/a/KY9JFy4IPMvNYhRCZqeezsj9g.svg)](https://asciinema.org/a/KY9JFy4IPMvNYhRCZqeezsj9g)

## 4.自查清单

- 如何添加一个用户并使其具备sudo执行程序的权限？
  - 添加用户：`sudo adduser XXX`或者`useradd XXX -m -s /bin/bash -d /home/username -g groupname`并设置密码`sudo passwd XXX`
  - 赋予sudo权限：`sudo usermod -G sudo -a XXX`

- 如何将一个用户添加到一个用户组？
  - `usermod -a -G groupname username`

- 如何查看当前系统的分区表和文件系统详细信息？
  - `fdisk -l`

- 如何实现开机自动挂载Virtualbox的共享目录分区？
  - 用root用户在文件 /etc/rc.local 中追加命令：`mount -t vboxsf sharing /mnt/share
`

- 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？
  - 扩容：`lvextend -L 2G /dev/VGtest/LVtest1`
  - 缩减：`lvreduce -L 1G /dev/VGtest/LVtest1`

- 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？
  - 修改网络连接配置文件systemd-networkd的`[Service]`部分
    - `ExecStartPost=指定脚本 start`
    - `ExecStopPost=另一个脚本 start`

- 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？
  - `sudo systemctl vi` + `脚本文件名`
  - 修改配置文件，`restart`字段设为`always`，保存退出

## 参考资料

- [Systemd 入门教程：命令篇 by 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html/)
- [Systemd 入门教程：实战篇 by 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html)
- [Linux系统与网络管理 第三章 Linux 服务器系统管理基础 1/2](https://www.bilibili.com/video/BV1Q7411W75x)
- [Linux系统与网络管理 第三章 Linux 服务器系统管理基础 2/2](https://www.bilibili.com/video/av86370626)