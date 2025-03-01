#!/bin/bash

SOURCE_DIR="built/local"
TARGET_DIR="/workspaces/ts-lib/lib"

# 检查源目录是否存在
if [ ! -d "$SOURCE_DIR" ]; then
  echo "错误: 源目录 $SOURCE_DIR 不存在。"
  exit 1
fi

# 检查目标目录是否存在，如果不存在则创建
if [ ! -d "$TARGET_DIR" ]; then
  echo "目标目录 $TARGET_DIR 不存在，正在创建..."
  mkdir -p "$TARGET_DIR" || {
    echo "错误: 无法创建目标目录 $TARGET_DIR。"
    exit 1
  }
fi

# 使用 rsync 移动文件和文件夹
echo "正在将 $SOURCE_DIR 下的内容移动到 $TARGET_DIR..."
rsync -a "$SOURCE_DIR/" "$TARGET_DIR/"

# 检查 rsync 是否成功
if [ $? -eq 0 ]; then
  echo "移动完成。"
else
  echo "错误: 移动过程中出现问题。"
  exit 1
fi

cp package.json /workspaces/ts-lib/package.json