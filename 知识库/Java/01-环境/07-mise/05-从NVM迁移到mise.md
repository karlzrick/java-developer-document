# 从 NVM 迁移到 mise

## 1. 安装原 Node.js 版本

```shell
mise use --global node@24.11.0
```

## 2. 停止加载 NVM

注释或删除 `~/.zshrc` 中的 NVM 初始化配置：

```shell
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

保留 mise 配置：

```shell
eval "$(~/.local/bin/mise activate zsh)"
```

## 3. 重新加载并检查

```shell
source ~/.zshrc
mise which node
node -v
```

NVM 中安装的全局 npm 包需要重新安装。
