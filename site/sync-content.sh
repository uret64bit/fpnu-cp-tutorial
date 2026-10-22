#!/usr/bin/env bash
# 把 vault 根目录的笔记同步到 site/content/，CI 与本地预览共用。
# 用 tar 管道复制（不依赖 rsync），排除工具/框架目录。
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONTENT_DIR="$REPO_ROOT/site/content"

rm -rf "$CONTENT_DIR"
mkdir -p "$CONTENT_DIR"

tar -cf - \
  --exclude='./.git' \
  --exclude='./.obsidian' \
  --exclude='./.claude' \
  --exclude='./.github' \
  --exclude='./.gitignore' \
  --exclude='./site' \
  --exclude='./docs' \
  --exclude='./Outlines' \
  --exclude='node_modules' \
  -C "$REPO_ROOT" . | tar -xf - -C "$CONTENT_DIR"

# README 是现成的入口页，复制为 Quartz 首页
cp "$REPO_ROOT/README.md" "$CONTENT_DIR/index.md"

echo "synced: $(find "$CONTENT_DIR" -name '*.md' | wc -l) md files -> $CONTENT_DIR"
