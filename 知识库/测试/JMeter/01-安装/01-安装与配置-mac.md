### 一、安装

#### 1、JDK8

下载 [https://www.oracle.com/java/technologies/javase-downloads.html](https://www.oracle.com/java/technologies/javase-downloads.html)

```shell
# 配置环境变量
open ~/.bash_profile


############################## ↓↓↓↓↓↓ set java environment ↓↓↓↓↓↓ #############################
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_271.jdk/Contents/Home
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib/rt.jar
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME CLASSPATH PATH
###############################################################################################

# 使配置生效
source ~/.bash_profile

# 验证
java
javac
java -version
```

#### 2、JMeter

下载 [https://jmeter.apache.org/download_jmeter.cgi](https://jmeter.apache.org/download_jmeter.cgi)
![](images/jmeter-download.png)

运行

```shell
cd apache-jmeter-5.4.3/bin
sh jmeter
```

![](images/jmeter-sh.png)

### 二、配置环境变量快捷启动jmeter

```shell
# 配置环境变量
open ~/.bash_profile


############################## ↓↓↓↓↓↓ set jmeter environment ↓↓↓↓↓↓ #############################
JMETER_HOME=/zhengqingya/soft/soft-dev/apache-jmeter-5.4.3
CLASSPATH=.:$JMETER_HOME/lib/ext/ApacheJMeter_core.jar:$JMETER_HOME/lib/jorphan.jar
PATH=$PATH:$JMETER_HOME/bin
export JMETER_HOME CLASSPATH PATH
###############################################################################################


# 使配置生效
source ~/.bash_profile

# 验证 => 在任意地方执行jmeter即可运行程序
jmeter
```

![](images/jmeter-sh-2.png)

### 三、Apple Silicon + JDK8 启动报错

```text
Error: VM option 'UseG1GC' is experimental and must be enabled via -XX:+UnlockExperimentalVMOptions.
Error: Could not create the Java Virtual Machine.
```

原因：JMeter 默认启用 G1GC，而 Oracle JDK8 arm64 需要先解锁实验功能。执行以下命令创建配置：

```shell
cat > /zhengqingya/soft/soft-dev/apache-jmeter-5.4.3/bin/setenv.sh <<'EOF'
#!/bin/sh

# Apple Silicon 的 Oracle JDK8 需先解锁实验功能，再启用 G1GC。
export GC_ALGO="-XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:G1ReservePercent=20"
EOF
```

然后重新启动：

```shell
jmeter
```
