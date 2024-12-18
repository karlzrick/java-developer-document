﻿@[TOC](文章目录)

### 一、前言

SourceTree安装和简单使用说明。

### 二、SourceTree安装

> 下载地址 [https://www.sourcetreeapp.com](https://www.sourcetreeapp.com)
> ![](./images/03-SourceTree安装使用-20230728105538752.png)

![](./images/03-SourceTree安装使用-20230728105539295.png)
![](./images/03-SourceTree安装使用-20230728105539318.png)
![](./images/03-SourceTree安装使用-20230728105539339.png)
![](./images/03-SourceTree安装使用-20230728105539360.png)

### 三、SourceTree使用

#### 1、`克隆仓库`&`拉取代码`&`推送代码`

这里先新建一个仓库`git-project`
![](./images/03-SourceTree安装使用-20230728105539382.png)
克隆
![](./images/03-SourceTree安装使用-20230728105539403.png)
随便写点内容，然后暂存到本地
![](./images/03-SourceTree安装使用-20230728105539425.png)
然后写点提交信息，推送到远程仓库
![](./images/03-SourceTree安装使用-20230728105539448.png)
对于不想要的文件，可以进行移除，或者丢弃本次修改的内容。
![](./images/03-SourceTree安装使用-20230728105539470.png)
如果远程仓库有代码更新，可点击拉取最新代码。
![](./images/03-SourceTree安装使用-20230728105539490.png)

#### 2、`创建分支`&`合并分支代码`

创建`dev`分支
![](./images/03-SourceTree安装使用-20230728105539512.png)
写点内容提交
![](./images/03-SourceTree安装使用-20230728105539534.png)
合并dev分支代码到master分支
![](./images/03-SourceTree安装使用-20230728105539557.png)
合并完了记得推送到远程仓库
![](./images/03-SourceTree安装使用-20230728105539581.png)
![](./images/03-SourceTree安装使用-20230728105539603.png)

如果遇到冲突(即2个人在同一文件同一位置修改了内容)

![](./images/03-SourceTree安装使用-20230728105539623.png)
![](./images/03-SourceTree安装使用-20230728105539653.png)
打开此冲突文件进行合并修改再提交即可
![](./images/03-SourceTree安装使用-20230728105539676.png)

#### 3、标签

用于对项目重要里程碑节点标识记录  ex:线上发版1.0.0
![](./images/03-SourceTree安装使用-20230728105539710.png)
![](./images/03-SourceTree安装使用-20230728105539729.png)

#### 4、子模块

将另外一个git仓库作为子模块存储。

> ex: maven多模块项目开发中可引入一个公共的子模块

![](./images/03-SourceTree安装使用-20230728105539749.png)
![](./images/03-SourceTree安装使用-20230728105539770.png)
![](./images/03-SourceTree安装使用-20230728105539790.png)

![](./images/03-SourceTree安装使用-20230728105539810.png)
如果对子模块下的内容作修改，需要在双击在子模块中提交修改
![](./images/03-SourceTree安装使用-20230728105539831.png)

#### 5、子树

和子模块有点类似，但子树包含其历史提交版本记录。
![](./images/03-SourceTree安装使用-20230728105539851.png)
![](./images/03-SourceTree安装使用-20230728105539869.png)
![](./images/03-SourceTree安装使用-20230728105539887.png)
![](./images/03-SourceTree安装使用-20230728105539907.png)

对子树下的内容修改之后，可进行单独的推送/拉取
![](./images/03-SourceTree安装使用-20230728105539927.png)
也可查看子树修改的内容
![](./images/03-SourceTree安装使用-20230728105539949.png)

#### 6、贮藏

1.部分个人配置，不方便提交，比如数据库配置文件`jdbc.properties`。每次pull都会覆盖掉自己的配置。
2.代码功能未写完，但又要临时写新功能代码。之前功能的代码由于未写完，不能提交。

这时候就可以使用`贮藏`功能。
![](./images/03-SourceTree安装使用-20230728105539975.png)
下次写新功能时，应用贮藏区数据，之前的配置就乖乖回来了。
![](./images/03-SourceTree安装使用-20230728105539999.png)

#### 7、重置提交

1. `版本3`：add 3.txt
2. `版本4`：add 4.txt
3. `版本5`：add 5.txt

ex：由于新需求提交的`版本4`和`版本5`做错了，想要回归至`版本3`，但又可能在有些场景需要保留`版本4`和`版本5`的内容或彻底不要，这时候就可以使用`重置提交`。
![](./images/03-SourceTree安装使用-20230728105540044.png)
![](./images/03-SourceTree安装使用-20230728105540067.png)

##### a、`软合并`：保持所有本地改动

3之后提交的文件不会丢失，且加入git版本管理
![](./images/03-SourceTree安装使用-20230728105540086.png)

##### b、`混合合并`：保持工作副本并重置索引

3之后提交的文件不会丢失，且移出git版本管理
![](./images/03-SourceTree安装使用-20230728105540106.png)

##### c、`强行合并`：丢弃所有改动过的工作副本

3之后提交的文件丢失
![](./images/03-SourceTree安装使用-20230728105540126.png)

---

以`强行合并`为例，操作之后需要`强制推送`，因为本地仓库的HEAD指向的版本比远程仓库的旧。
![](./images/03-SourceTree安装使用-20230728105540144.png)
这里无法勾选强制推送，那就使用如下命令完成此操作即可。

```shell
git push -f
```

![](./images/03-SourceTree安装使用-20230728105540165.png)
![](./images/03-SourceTree安装使用-20230728105540183.png)
查看远程仓库
![](./images/03-SourceTree安装使用-20230728105540204.png)

#### 8、回滚提交

1. `版本6`：add 6.txt
2. `版本7`：add 7.txt
3. `版本8`：add 8.txt

ex：发现之前提交的`版本6`有bug，想要撤销`版本6`的提交，但又想保留`版本7`和`版本8`的提交，这时候就可以使用`回滚提交`。
![](./images/03-SourceTree安装使用-20230728105540225.png)
![](./images/03-SourceTree安装使用-20230728105540250.png)
推送
![](./images/03-SourceTree安装使用-20230728105540272.png)

### 四、Git工作流

1. `master`：主分支，用于最终发布版本，整个项目中有且只有一个。
2. `develop`：开发分支，原则上项目中有且只有一个。
3. `feature`：功能分支，用于开发一个新的功能。
4. `release`：预发布版本，介于develop和master之间的一个版本，主要用于测试。
5. `hotfix`：修复补丁，用于修复master上的bug。


初始化

> tips: 需要先创建一个`develop`分支

![](./images/03-SourceTree安装使用-20230728105540292.png)
在`develop`分支`建立新的功能`
![](./images/03-SourceTree安装使用-20230728105540315.png)
开发商品功能
![](./images/03-SourceTree安装使用-20230728105540338.png)
随便写点内容提交
![](./images/03-SourceTree安装使用-20230728105540357.png)
`完成新功能开发`
![](./images/03-SourceTree安装使用-20230728105540379.png)

> tips: `变基`和`merge`类似。
> 变基可将分支历史并入主线。
> ![](./images/03-SourceTree安装使用-20230728105540405.png)

![](./images/03-SourceTree安装使用-20230728105540427.png)
开发完新功能之后，`建立新的发布版本`
![](./images/03-SourceTree安装使用-20230728105540445.png)
![](./images/03-SourceTree安装使用-20230728105540469.png)
`完成发布版本`，即合并到master分支进行上线部署准备
![](./images/03-SourceTree安装使用-20230728105540487.png)
![](./images/03-SourceTree安装使用-20230728105540513.png)
在远程仓库查看此次发版信息
![](./images/03-SourceTree安装使用-20230728105540533.png)
如果线上出现bug，需要修复，则`建立新的修复补丁`
![](./images/03-SourceTree安装使用-20230728105540556.png)
![](./images/03-SourceTree安装使用-20230728105540577.png)
将bug修复之后提交代码
![](./images/03-SourceTree安装使用-20230728105540600.png)
`完成修复补丁`
![](./images/03-SourceTree安装使用-20230728105540625.png)
![](./images/03-SourceTree安装使用-20230728105540645.png)
整条流水线如下
![](./images/03-SourceTree安装使用-20230728105540667.png)

关于SourceTree的使用，自己多点点应用下，很简单的`^_^`

--- 

> 今日分享语句：
> 要从容地着手去做一件事，一旦开始，就要坚持到底。

