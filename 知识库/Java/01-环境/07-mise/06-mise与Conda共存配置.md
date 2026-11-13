# mise 与 Conda 共存配置

问题：mise 调整 `PATH` 后，可能导致 Conda 环境名已切换，但 `python`、`pip` 仍指向 base。

## 1. 配置

将 `~/.zshrc` 末尾顺序调整为：**mise 初始化 → 当前 Conda 环境路径前置 → Conda 初始化**。

在 mise 及其他 `PATH` 配置之后、已有的完整 `conda initialize` 配置块之前添加：

```shell
# 初始化前修正路径，避免命令匹配错误及 Conda 路径越界。
if [[ -n "$CONDA_PREFIX" ]]; then
    path=("$CONDA_PREFIX/bin" "${(@)path:#$CONDA_PREFIX/bin}")
fi
```

Conda 初始化块内部不改。路径前置必须在初始化之前执行，避免本机 Conda 26.1.1 在环境路径位于末尾时触发 `IndexError`。mise 的 Java、Node.js 管理及目录自动切换功能保留。

## 2. 生效

```shell
source ~/.zshrc
conda activate langchain1.2
python -V
which python
which pip
```

预期结果：Python 为 `3.13.12`，Python 和 pip 路径均包含 `/envs/langchain1.2/`。
