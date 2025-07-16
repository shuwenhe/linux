#!/bin/bash
# rename-user.sh - 一键将 Linux 用户改名，包括用户名、主目录、用户组

set -e

OLD_USER="$1"
NEW_USER="$2"

if [[ -z "$OLD_USER" || -z "$NEW_USER" ]]; then
  echo "❌ 用法: sudo ./rename-user.sh <旧用户名> <新用户名>"
  exit 1
fi

if [[ "$(whoami)" == "$OLD_USER" ]]; then
  echo "⚠️ 不能直接在被改名用户下执行此脚本，请使用 root 或其他 sudo 用户运行。"
  exit 1
fi

echo "🔁 将用户 $OLD_USER 改为 $NEW_USER"

# 1. 修改用户名
echo "🧍 重命名用户..."
sudo usermod -l "$NEW_USER" "$OLD_USER"

# 2. 重命名用户主目录
echo "📁 修改主目录路径..."
sudo usermod -d "/home/$NEW_USER" -m "$NEW_USER"

# 3. 修改用户组名
echo "👥 修改用户组名..."
sudo groupmod -n "$NEW_USER" "$OLD_USER"

# 4. 检查 sudo 权限
if groups "$NEW_USER" | grep -q '\bsudo\b'; then
  echo "✅ $NEW_USER 已拥有 sudo 权限"
else
  echo "➕ 添加 sudo 权限"
  sudo usermod -aG sudo "$NEW_USER"
fi

echo "✅ 用户改名完成：$OLD_USER → $NEW_USER"
echo "📌 请注销并使用新用户名登录，或使用：su - $NEW_USER"

