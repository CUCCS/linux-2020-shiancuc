# 第二章：From GUI to CLI

## 1.软件环境
- Ubuntu 18.04 Server 64bit
- 在asciinema注册一个账号，并在本地安装配置好asciinema

## 2.实验要求
- 确保本地已经完成asciinema auth，并在asciinema成功关联了本地账号和在线账号
- 上传本人亲自动手完成的vimtutor操作全程录像
- 在自己的github仓库上新建markdown格式纯文本文件附上asciinema的分享URL

## 3.实验过程

- ### Lesson 1
  [![asciicast](https://asciinema.org/a/jL9rM9IrEor8Mnj2cHk9nXkjF.svg)](https://asciinema.org/a/jL9rM9IrEor8Mnj2cHk9nXkjF)

- ### Lesson 2
  [![asciicast](https://asciinema.org/a/FeAQFHnd3TGycFioG79TLI4ph.svg)](https://asciinema.org/a/FeAQFHnd3TGycFioG79TLI4ph)

- ### Lesson 3
  [![asciicast](https://asciinema.org/a/AGvvR8pcjKijv8Ik7ooIn8NRd.svg)](https://asciinema.org/a/AGvvR8pcjKijv8Ik7ooIn8NRd)

- ### Lesson 4
  [![asciicast](https://asciinema.org/a/bWve0P2h77p61i1tLGN1fP62A.svg)](https://asciinema.org/a/bWve0P2h77p61i1tLGN1fP62A)

- ### Lesson 5
  [![asciicast](https://asciinema.org/a/8JbRfd4IB7PipevMGhQXoLA54.svg)](https://asciinema.org/a/8JbRfd4IB7PipevMGhQXoLA54)

- ### Lesson 6
  [![asciicast](https://asciinema.org/a/Q2k399QWNjNsxGztd7kKYU9Ec.svg)](https://asciinema.org/a/Q2k399QWNjNsxGztd7kKYU9Ec)

- ### Lesson 7
  [![asciicast](https://asciinema.org/a/hiqg2ZmGCA8nkFNdskUoEvTAS.svg)](https://asciinema.org/a/hiqg2ZmGCA8nkFNdskUoEvTAS)


## 4.自查清单
- 你了解vim有哪几种工作模式？
    - ***Normal mode 普通模式***：使用 Vim 编辑文件时，默认处于此模式。在此模式下，可以使用上、下、左、右键或者 k、j、h、l 命令进行光标移动，还可以对文件内容进行复制、粘贴、替换、删除等操作。
    - ***Insert mode 插入模式/编辑模式***：在此模式下可以对文件执行写操作。进入输入模式的方法是输入 i、a、o 等插入命令，编写完成后按`Esc`键即可返回普通模式。
    - ***Command line mode 命令行模式***：在命令行模式中可以输入会被解释成并执行的文本。例如执行命令（`:`键），搜索（`/`和`?`键）或者过滤命令（`!`键）。在命令执行之后，Vim返回到命令行模式之前的模式，通常是普通模式。
    - ***Visual mode 可视化模式***：在此模式下可以进行块状选择文本。用v、V、Ctrl + v均可进入可视化模式。

- Normal模式下，从当前行开始，一次向下移动光标10行的操作方法？如何快速移动到文件开始行和结束行？如何快速跳转到文件中的第N行？
    - `10j`
    - 文件开始行：`gg`；文件结束行：`G`
    - `N`+`G`，即行数G

- Normal模式下，如何删除单个字符、单个单词、从当前光标位置一直删除到行尾、单行、当前行开始向下数N行？
    - 删除单个字符：`x`
    - 删除单个单词：光标移至准备要删除的单词的开始，输入`dw`
    - 删除到行尾：`d$`
    - 删除一整行：`dd`
    - 当前行开始向下删除N行：`Ndd`，例如20dd则是删除光标所在的向下20行。

- 如何在vim中快速插入N个空行？如何在vim中快速输入80个-？
    - `N`+`o`，向下插入N个空行
    - `80i-`，插入80个-

- 如何撤销最近一次编辑操作？如何重做最近一次被撤销的操作？
    - 撤销最近一次编辑操作：`u`
    - 重做最近一次被撤销的操作:`CTRL-R`

- vim中如何实现剪切粘贴单个字符？单个单词？单行？如何实现相似的复制粘贴操作呢？
    - 剪切粘贴单个字符：进入可视化模式选中字符，`d`剪切，`p`粘贴
    - 剪切粘贴单个单词：进入可视化模式选中单词，`d`剪切，`p`粘贴
    - 剪切粘贴单行：`dd`剪切整行，`p`粘贴
    - `y`代替`d`表示复制，`p`粘贴

- 为了编辑一段文本你能想到哪几种操作方式（按键序列）？
    - 光标操作：`h,j,k,l,w,b`等
    - 查询：`/[search]`
    - 插入操作：`i,I,A,a,o,O,cw`等
    - 删除操作：`x,X,dd,dw,D`等
    - 保存并退出：`:wq`，`:q`等

- 查看当前正在编辑的文件名的方法？查看当前光标所在行的行号的方法？
    - `Ctrl`+`g`

- 在文件中进行关键词搜索你会哪些方法？如何设置忽略大小写的情况下进行匹配搜索？如何将匹配的搜索结果进行高亮显示？如何对匹配到的关键词进行批量替换？
    - `/[关键词]`，`n`下翻，`N`上翻
    - 忽略大小写：`:set ic`
    - 结果高亮显示：`:set hls is`
    - 批量替换：`:%s/old/new/g`全局；`:a,bs/old/new/g`ab两行内替换

- 在文件中最近编辑过的位置来回快速跳转的方法？
    - `Ctrl`+`o`，`Ctrl`+`i`

- 如何把光标定位到各种括号的匹配项？例如：找到(, [, or {对应匹配的),], or }
    - 光标放在 (、[ 或 { 处，`%`找到对应匹配的括号

- 在不退出vim的情况下执行一个外部程序的方法？
    - `:![外部程序名称]`

- 如何使用vim的内置帮助系统来查询一个内置默认快捷键的使用方法？如何在两个不同的分屏窗口中移动光标？
    - 查询一个内置默认快捷键的使用方法：`:help [快捷键]`
    - 移动光标到不同窗口：`Ctrl + w h/j/k/l`