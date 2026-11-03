#!/usr/bin/env bash

set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repo_dir=$(CDPATH= cd -- "$script_dir/.." && pwd)
target_name=${1:-playground}

case "$target_name" in
  /*) target_dir=$target_name ;;
  *) target_dir="$repo_dir/$target_name" ;;
esac

if [ -e "$target_dir" ]; then
  printf '停止：%s 已存在，不會覆蓋。\n' "$target_dir" >&2
  printf '請換一個名稱，例如：./scripts/new-playground.sh playground-2\n' >&2
  exit 1
fi

mkdir -p "$target_dir"
cp -R "$repo_dir/starter/site/." "$target_dir/"

git -C "$target_dir" init -b main >/dev/null 2>&1 || {
  git -C "$target_dir" init >/dev/null
  git -C "$target_dir" checkout -b main >/dev/null 2>&1
}

git -C "$target_dir" add .

if ! git -C "$target_dir" commit -m "Initial cafe website" >/dev/null 2>&1; then
  printf '無法建立初始 commit。請先設定 Git 身分：\n' >&2
  printf '  git config --global user.name "你的名字"\n' >&2
  printf '  git config --global user.email "你的 Email"\n' >&2
  exit 1
fi

printf '🐿️  練習場建立完成：%s\n' "$target_dir"
printf '下一步：cd %s && git status\n' "$target_name"
