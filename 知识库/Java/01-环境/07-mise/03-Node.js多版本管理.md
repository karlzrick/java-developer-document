# Node.js 多版本管理

## 1. 查看版本

```shell
# 查看可安装版本
mise ls-remote node

# 查看已安装版本
mise ls node

# 查看当前生效版本
mise ls --current node
```

## 2. 安装和切换

```shell
# 安装并设置全局 Node.js 24.11.0
mise use --global node@24.11.0

# 当前终端临时使用指定版本
mise shell node@24.11.0
```

## 3. 检查

```shell
node -v
npm -v
mise which node
```

## 4. 安装 cnpm

```shell
npm install --global cnpm --registry=https://registry.npmmirror.com
cnpm -v
```

切换或安装新的 Node.js 版本后，需要为该版本重新安装 cnpm。

## 5. 卸载

```shell
mise uninstall node@24.11.0
```
