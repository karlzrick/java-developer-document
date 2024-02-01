# Kali 安装

https://www.kali.org/

### 方式一：虚拟机

下载虚拟机版本 https://www.kali.org/get-kali/#kali-virtual-machines
![](./images/01-Kali-1706757290616.png)

> tips: 个人实践后，`Hyper-V`和`VMware`方式安装都失败了... 于是最后使用iso镜像方式安装

#### `VMware`

![](./images/01-Kali-1706758669481.png)

双击`kali-linux-2023.4-vmware-amd64.vmx`
![](./images/01-Kali-1706768480500.png)

运行
![](./images/01-Kali-1706768533046.png)

###### 问题

https://kb.vmware.com/s/article/76918?lang=zh_cn

![](./images/01-Kali-1706768774041.png)

`Hyper-V`和`VMware`无法共存...

###### 解决

网上有说这种方式可以解决，但测试无效...

```shell
# 查看服务状态
Dism /online /Get-Features
# 开启
Enable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform -All
# 禁用
Disable-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform
```

![](./images/01-Kali-1706770182564.png)
![](./images/01-Kali-1706770232127.png)
![](./images/01-Kali-1706770265077.png)

---

### 方式二：`Hyper-V` + `iso` 镜像

通过`kali-linux-2023.4-installer-amd64.iso`镜像安装
![](./images/01-Kali-1706772376644.png)

> tips：如果官网下载不了，可使用阿里云镜像源下载 https://mirrors.aliyun.com/kali-images/current/

打开 Hyper-V 管理器
![](./images/01-Kali-1706758759008.png)

快速创建虚拟机
![](./images/01-Kali-1706771968590.png)
![](./images/01-Kali-1706772075968.png)

启动&连接
![](./images/01-Kali-1706772235100.png)
![](./images/01-Kali-1706772272002.png)
![](./images/01-Kali-1706772287899.png)
![](./images/01-Kali-1706772421468.png)

设置账号密码
![](./images/01-Kali-1706772745692.png)

之后的一些配置默认或根据自己的情况设置即可

安装完成后，登录
![](./images/01-Kali-1706773961855.png)
![](./images/01-Kali-1706774003565.png)

