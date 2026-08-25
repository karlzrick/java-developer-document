# mise 安装（macOS）

https://github.com/jdx/mise

[mise](https://mise.jdx.dev/) 是一个开发工具版本管理器，可以统一管理 Java、Node.js、Python、Go、Maven、Gradle 等工具，并根据项目目录自动切换版本。

## 1. 安装

```shell
curl https://mise.run | sh
```

## 2. 配置 Zsh

```shell
echo 'eval "$(~/.local/bin/mise activate zsh)"' >> ~/.zshrc
source ~/.zshrc
```

## 3. 检查

```shell
mise --version
mise doctor
```

## 4. 常用命令

```shell
# 查看当前生效版本
mise ls --current
# Tool  Version          Source                             Requested       
# java  zulu-8.96.0.205  MISE_JAVA_VERSION=zulu-8.96.0.205  zulu-8.96.0.205
# node  24.11.0          ~/.config/mise/config.toml         24.11.0

# 查看已安装版本
mise ls

# 升级 mise
mise self-update
```
