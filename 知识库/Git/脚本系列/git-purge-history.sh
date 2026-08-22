#!/bin/bash

####################################
# @description 从 Git 历史中清理指定目录并强制推送远端 -- tips: 如果远端旧历史本身已超限会拒绝强推，导致操作失败。
#              解决仓库过大导致的 Push rejected for repository [size exceeds limit]
# @params $1 => Git 仓库路径
# @params $2... => 一个或多个待清理目录（相对于仓库根目录）
# @example => sh git-purge-history.sh /path/to/repository path/to/dir-1 path/to/dir-2
# @author zhengqingya
# @date 2026/8/21
####################################

# TODO 安装并验证
# brew install git-filter-repo
# git filter-repo --version


# 命令失败或使用未定义变量时立即退出
set -eu

if [ "$#" -lt 2 ]; then
  echo "用法：sh $0 <仓库路径> <目录1> [目录2...]"
  exit 1
fi

repository_path="$1"
shift
target_dirs=("$@")

cd "$repository_path"

# 避免历史改写丢失未提交代码
if [ -n "$(git status --porcelain)" ]; then
  git status --short
  echo "仓库存在未提交或未跟踪文件，请先处理。"
  exit 1
fi

repository_root="$(git rev-parse --show-toplevel)"
repository_name="$(basename "$repository_root")"
origin_url="$(git remote get-url origin)"
backup_path="$(dirname "$repository_root")/${repository_name}-before-filter-$(date +%Y%m%d-%H%M%S).bundle"

echo "********************************************************************"
echo "1. 备份 Git 完整历史：${backup_path}"
git bundle create "$backup_path" --all
git bundle verify "$backup_path"

# 一次清理多个目录，避免重复改写历史
filter_args=()
for target_dir in "${target_dirs[@]}"; do
  target_dir="${target_dir%/}"
  filter_args+=(--path "${target_dir}/")
  echo "2. 待清理目录：${target_dir}"
done

git filter-repo "${filter_args[@]}" --invert-paths --force

# git-filter-repo 会删除 origin，清理后恢复原远端
git remote remove origin >/dev/null 2>&1 || true
git remote add origin "$origin_url"

echo "3. 检查清理后的 Git 对象库"
git fsck --full
git count-objects -vH

echo "4. 强制推送所有分支和标签"
git push origin --force --all
git push origin --force --tags

echo "*** [√] Git 历史清理完成"
echo "*** [√] 完整备份：${backup_path}"
echo "*** [!] 请在远端仓库设置中执行一次存储库 GC"
