# JDK 21

> tips: 未验证！

- https://www.oracle.com/java/technologies/downloads/#jdk21-mac
- https://adoptium.net/zh-CN/temurin/releases?version=21&os=any&arch=any

```shell
# 安装
brew install --cask temurin@21

# 检查
java -version
# temurin@17 cask 会自动装到 /Library/Java/JavaVirtualMachines/temurin-17.jdk，并被 /usr/libexec/java_home 识别。
/usr/libexec/java_home -V
```