# 如何配置无人值守安装iso并在Virtualbox中完成自动化安装。

#### 配置好网卡后，使用xshell连接Linux虚拟机。

#### 将Ubuntu18.04镜像文件用xshell传进虚拟机

#### 使用xshell登录虚拟机命令行，在当前用户目录下（/home/cuc-shian）创建一个用于挂载iso镜像文件的目录。

#### 挂载iso镜像文件到该目录，创建一个工作目录用于克隆光盘内容，同步光盘内容到目标工作目录，再卸载iso镜像。

![1.同步完光盘内容并卸载iso镜像](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E5%90%8C%E6%AD%A5%E5%AE%8C%E5%85%89%E7%9B%98%E5%86%85%E5%AE%B9%E5%B9%B6%E5%8D%B8%E8%BD%BDiso%E9%95%9C%E5%83%8F.PNG)

#### 进入目标工作目录，编辑Ubuntu安装引导界面增加一个新菜单项入口。

![1.编辑安装引导界面一](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E7%BC%96%E8%BE%91%E5%AE%89%E8%A3%85%E5%BC%95%E5%AF%BC%E7%95%8C%E9%9D%A2%E4%B8%80.PNG)

#### 添加以下内容到该文件后强制保存退出。

![1.编辑安装引导界面二](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E7%BC%96%E8%BE%91%E5%AE%89%E8%A3%85%E5%BC%95%E5%AF%BC%E7%95%8C%E9%9D%A2%E4%BA%8C.PNG)

#### 参考老师的示例文件改写ubuntu-server-autoinstall.seed，并将该文件保存到刚才创建的工作目录/home/cuc-shian/cd/preseed/ubuntu-server-autoinstall.seed

![1.保存.seed文件到文件夹](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E4%BF%9D%E5%AD%98.seed%E6%96%87%E4%BB%B6%E5%88%B0%E6%96%87%E4%BB%B6%E5%A4%B9.PNG)

#### 修改isolinux/isolinux.cfg，增加内容timeout 10。

![1.修改.cfg增加内容](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E4%BF%AE%E6%94%B9.cfg%E5%A2%9E%E5%8A%A0%E5%86%85%E5%AE%B9.PNG)

#### 重新生成md5sum.txt

![1.重新生成md5](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E9%87%8D%E6%96%B0%E7%94%9F%E6%88%90md5.PNG)

#### 封闭改动后的目录到.iso

![1.封闭iso一](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E5%B0%81%E9%97%ADiso%E4%B8%80.PNG)

#### 生成iso文件

![1.封闭iso二](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E5%B0%81%E9%97%ADiso%E4%BA%8C.PNG)

#### 导出iso文件到宿主机上

![1.导出iso](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E5%AF%BC%E5%87%BAiso.PNG)

#### 进行无人值守安装

![1.无人值守安装一](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85%E4%B8%80.PNG)

![1.无人值守安装二](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85%E4%BA%8C.PNG)

![1.无人值守安装三](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85%E4%B8%89.PNG)

![1.无人值守安装四](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/1.%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85%E5%9B%9B.PNG)

## 文件夹中附上无人值守iso安装录屏（已裁剪）





#Virtualbox安装完Ubuntu之后新添加的网卡如何实现系统开机自动启用和自动获取ip？

#### 修改文档添加第二块网卡

![2.配置网卡第一步](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/2.%E9%85%8D%E7%BD%AE%E7%BD%91%E5%8D%A1%E7%AC%AC%E4%B8%80%E6%AD%A5.PNG)

![2.配置网卡第二步](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/2.%E9%85%8D%E7%BD%AE%E7%BD%91%E5%8D%A1%E7%AC%AC%E4%BA%8C%E6%AD%A5.PNG)

#### 保存修改文档并应用

![2.配置网卡第三步](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/2.%E9%85%8D%E7%BD%AE%E7%BD%91%E5%8D%A1%E7%AC%AC%E4%B8%89%E6%AD%A5.PNG)

#### 配置完成

![2.配置完成](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/2.%E9%85%8D%E7%BD%AE%E5%AE%8C%E6%88%90.PNG)





# 如何使用sftp在虚拟机和宿主机之间传输文件？

#### 我使用了xshell语法命令rz和sz

![3.用xshell传文件第一步](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/3.%E7%94%A8xshell%E4%BC%A0%E6%96%87%E4%BB%B6%E7%AC%AC%E4%B8%80%E6%AD%A5.PNG)

#### xshell弹出文件传输对话框

![3.传文件跳出文件夹第二步](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/3.%E4%BC%A0%E6%96%87%E4%BB%B6%E8%B7%B3%E5%87%BA%E6%96%87%E4%BB%B6%E5%A4%B9%E7%AC%AC%E4%BA%8C%E6%AD%A5.PNG)

#### 传输成功

![3.传输成功](https://github.com/CUCCS/linux-2020-shiancuc/blob/chap0x01/chap0x01/img/3.%E4%BC%A0%E8%BE%93%E6%88%90%E5%8A%9F.PNG)
