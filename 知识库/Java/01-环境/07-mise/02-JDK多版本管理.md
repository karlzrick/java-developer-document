# JDK 多版本管理

## 1. 查看版本

```shell
# 查看可安装的 Temurin JDK
mise ls-remote java | grep temurin

# 查看已安装的 JDK
mise ls java

# 查看当前生效的 JDK
mise ls --current java
```

## 2. 安装 JDK

安装 JDK 8、17、21：

> tips: Apple Silicon 没有可用的 Temurin JDK 8，JDK 8 使用 Zulu：

```shell
mise install java@zulu-8
mise install java@temurin-17
mise install java@temurin-21
```

## 3. 切换 JDK

```shell
# 设置全局默认 JDK 8
mise use --global java@zulu-8

# 当前终端临时使用 JDK 21
mise shell java@temurin-21
```

## 4. 检查

```shell
java -version
javac -version
echo "$JAVA_HOME"
```

## 5. 卸载 JDK

```shell
mise uninstall java@temurin-17
```
