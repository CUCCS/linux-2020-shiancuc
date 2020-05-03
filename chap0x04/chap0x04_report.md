# 第四章：shell脚本编程基础

## 实验任务

**√** 任务一：用bash编写一个图片批处理脚本，实现以下功能：
- 支持命令行参数方式使用不同功能
- 支持对指定目录下所有支持格式的图片文件进行批处理
- 支持以下常见图片批处理功能的单独使用或组合使用
  - 支持对jpeg格式图片进行图片质量压缩
  - 支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
  - 支持对图片批量添加自定义文本水印
  - 支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）
  - 支持将png/svg图片统一转换为jpg格式图片

**√** 任务二：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务： 
- 2014世界杯运动员数据
  - 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比
  - 统计不同场上位置的球员数量、百分比
  - 名字最长的球员是谁？名字最短的球员是谁？
  - 年龄最大的球员是谁？年龄最小的球员是谁？

**√** 任务二：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：
- Web服务器访问日志
  - 统计访问来源主机TOP 100和分别对应出现的总次数
  - 统计访问来源主机TOP 100 IP和分别对应出现的总次数
  - 统计最频繁被访问的URL TOP 100
  - 统计不同响应状态码的出现次数和对应百分比
  - 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
  - 给定URL输出TOP 100访问来源主机

## 实验过程

### 任务一 用bash编写一个图片批处理脚本

- [代码](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/task1.sh)
<br/>
- 支持命令行参数方式使用不同功能

> bash task1.sh --help

![1.0](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/1.0.PNG)

- 支持对jpeg格式图片进行图片质量压缩

> bash task1.sh -d ./Pic/testPic/ -j 45

![1.1](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/1.1.PNG)

- 支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率

> bash task1.sh -d ./Pic/testPic/ -c 100

![1.2](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/1.2.PNG)

- 支持对图片批量添加自定义文本水印

> bash task1.sh -d ./Pic/testPic/ -e "hello"

![1.3](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Pic/testPic/2.png)![1.3'](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Pic/e-output/2.png)

- 支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）

> bash task1.sh -d ./Pic/testPic/ -p "pre"
> bash task1.sh -d ./Pic/testPic/ -s "suffix"

![1.4](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/1.4.PNG)

- 支持将png/svg图片统一转换为jpg格式图片
> bash task1.sh -d ./Pic/testPic/ -v

![1.5](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/1.5.PNG)


### 任务二：用bash编写一个文本批处理脚本(2014世界杯运动员数据)

- [代码](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/task2.sh)
<br/>

> bash task2.sh

- 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比

[2.1统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比数据](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Data/2.1%E7%BB%9F%E8%AE%A1%E4%B8%8D%E5%90%8C%E5%B9%B4%E9%BE%84%E5%8C%BA%E9%97%B4%E8%8C%83%E5%9B%B4%EF%BC%8820%E5%B2%81%E4%BB%A5%E4%B8%8B%E3%80%81%5B20-30%5D%E3%80%8130%E5%B2%81%E4%BB%A5%E4%B8%8A%EF%BC%89%E7%9A%84%E7%90%83%E5%91%98%E6%95%B0%E9%87%8F%E3%80%81%E7%99%BE%E5%88%86%E6%AF%94.txt)

![2.1](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/2.1.PNG)

- 统计不同场上位置的球员数量、百分比

[2.2统计不同场上位置的球员数量、百分比数据](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Data/2.2%E7%BB%9F%E8%AE%A1%E4%B8%8D%E5%90%8C%E5%9C%BA%E4%B8%8A%E4%BD%8D%E7%BD%AE%E7%9A%84%E7%90%83%E5%91%98%E6%95%B0%E9%87%8F%E3%80%81%E7%99%BE%E5%88%86%E6%AF%94.txt)

![2.2](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/2.2.PNG)

- 名字最长的球员是谁？名字最短的球员是谁？

[2.3名字最长的球员是谁？名字最短的球员是谁？数据](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Data/2.3%E5%90%8D%E5%AD%97%E6%9C%80%E9%95%BF%E7%9A%84%E7%90%83%E5%91%98%E6%98%AF%E8%B0%81%EF%BC%9F%E5%90%8D%E5%AD%97%E6%9C%80%E7%9F%AD%E7%9A%84%E7%90%83%E5%91%98%E6%98%AF%E8%B0%81%EF%BC%9F.txt)

![2.3](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/2.3.PNG)

- 年龄最大的球员是谁？年龄最小的球员是谁？

[2.4年龄最大的球员是谁？年龄最小的球员是谁？数据](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Data/2.4%E5%B9%B4%E9%BE%84%E6%9C%80%E5%A4%A7%E7%9A%84%E7%90%83%E5%91%98%E6%98%AF%E8%B0%81%EF%BC%9F%E5%B9%B4%E9%BE%84%E6%9C%80%E5%B0%8F%E7%9A%84%E7%90%83%E5%91%98%E6%98%AF%E8%B0%81%EF%BC%9F.txt)

![2.4](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/2.4.PNG)


### 任务二：用bash编写一个文本批处理脚本(Web服务器访问日志)

- [代码](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/task3.sh)

- 截图未截出全部结果，全部结果另附报告
<br/>
- 查看帮助文档

> bash task3.sh --help

![3.0](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/3.0.PNG)

- 统计访问来源主机TOP 100和分别对应出现的总次数

> bash task3.sh -d web_log.tsv -h 100

[3.1统计访问来源主机TOP 100和分别对应出现的总次数数据](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Data/3.1%E7%BB%9F%E8%AE%A1%E8%AE%BF%E9%97%AE%E6%9D%A5%E6%BA%90%E4%B8%BB%E6%9C%BATOP%20100%E5%92%8C%E5%88%86%E5%88%AB%E5%AF%B9%E5%BA%94%E5%87%BA%E7%8E%B0%E7%9A%84%E6%80%BB%E6%AC%A1%E6%95%B0.txt)

![3.1](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/3.1.PNG)

- 统计访问来源主机TOP 100 IP和分别对应出现的总次数

> bash task3.sh -d web_log.tsv -i 100

[3.2统计访问来源主机TOP 100 IP和分别对应出现的总次数数据](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Data/3.2%E7%BB%9F%E8%AE%A1%E8%AE%BF%E9%97%AE%E6%9D%A5%E6%BA%90%E4%B8%BB%E6%9C%BATOP%20100%20IP%E5%92%8C%E5%88%86%E5%88%AB%E5%AF%B9%E5%BA%94%E5%87%BA%E7%8E%B0%E7%9A%84%E6%80%BB%E6%AC%A1%E6%95%B0.txt)

![3.2](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/3.2.PNG)

- 统计最频繁被访问的URL TOP 100

> bash task3.sh -d web_log.tsv -u 100

[3.3统计最频繁被访问的URL TOP 100数据](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Data/3.3%E7%BB%9F%E8%AE%A1%E6%9C%80%E9%A2%91%E7%B9%81%E8%A2%AB%E8%AE%BF%E9%97%AE%E7%9A%84URL%20TOP%20100.txt)

![3.3](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/3.3.PNG)

- 统计不同响应状态码的出现次数和对应百分比

> bash task3.sh -d web_log.tsv -r

[3.4统计不同响应状态码的出现次数和对应百分比数据](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Data/3.4%E7%BB%9F%E8%AE%A1%E4%B8%8D%E5%90%8C%E5%93%8D%E5%BA%94%E7%8A%B6%E6%80%81%E7%A0%81%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%E5%92%8C%E5%AF%B9%E5%BA%94%E7%99%BE%E5%88%86%E6%AF%94.txt)

![3.4](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/3.4.PNG)

- 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数

> bash task3.sh -d web_log.tsv -x 100

[3.5分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数数据](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Data/3.5%E5%88%86%E5%88%AB%E7%BB%9F%E8%AE%A1%E4%B8%8D%E5%90%8C4XX%E7%8A%B6%E6%80%81%E7%A0%81%E5%AF%B9%E5%BA%94%E7%9A%84TOP%2010%20URL%E5%92%8C%E5%AF%B9%E5%BA%94%E5%87%BA%E7%8E%B0%E7%9A%84%E6%80%BB%E6%AC%A1%E6%95%B0.txt)

![3.5](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/3.5.PNG)

- 给定URL输出TOP 100访问来源主机

> bash task3.sh -d web_log.tsv -l "/images/NASA-logosmall.gif"

[3.6给定URL输出TOP 100访问来源主机数据](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/Data/3.6%E7%BB%99%E5%AE%9AURL%E8%BE%93%E5%87%BATOP%20100%E8%AE%BF%E9%97%AE%E6%9D%A5%E6%BA%90%E4%B8%BB%E6%9C%BA.txt)

![3.6](https://github.com/shiancuc/linux-2020-shiancuc/blob/chap0x04/chap0x04/ScreenShot/3.6.PNG)


## 问题

- git push不成功，有文件过大，删除文件也没有用？
  - 因为文件已被commit，应将作业备份，使用```git log --online```查看commit情况，并用```git reset --hard HEAD~3```删除相应3条commit记录

- travis-ci编译通过但图标还是unknown？
  - 图标的分支仍处于master分支，应将其改成chapx0x04分支


## 参考资料

[Linux系统与网络管理 第四章 Shell脚本编程基础](https://www.bilibili.com/video/BV1H7411s7xH)

[Shell 脚本编程示例 - JSON 爬虫](https://www.bilibili.com/video/BV1ME411N76f)

[2015-linux-public-U2Vino](https://github.com/CUCCS/2015-linux-public-U2Vino/tree/HW-4)

[linux中sed用法](https://www.cnblogs.com/zwgblog/p/6013975.html)

[linux shell 中 %% *的含义](https://blog.csdn.net/qq_30130417/article/details/80911989)

[Hexo博客搭建中的坑](https://www.jianshu.com/p/588cb1cc077a)

[Linux命令之basename使用](https://blog.csdn.net/wutao_water/article/details/39478631)

[Linux find命令](https://www.runoob.com/linux/linux-comm-find.html)

[linux awk命令详解](https://www.cnblogs.com/ggjucheng/archive/2013/01/13/2858470.html)
