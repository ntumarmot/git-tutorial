#!/usr/bin/env bash

set -u

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
failures=0

ok() {
  printf '✅ %s\n' "$1"
}

fail() {
  printf '❌ %s\n' "$1"
  failures=$((failures + 1))
}

printf '🐿️  教材驗收\n\n'

required_files='README.md START-HERE.md CHEATSHEET.md FACILITATOR.md starter/site/index.html starter/site/style.css starter/site/menu.md starter/site/about.md'
for file in $required_files; do
  if [ -s "$repo_dir/$file" ]; then
    ok "$file 存在"
  else
    fail "$file 不存在或為空"
  fi
done

if grep -R -nE '^(<<<<<<<|=======|>>>>>>>)' \
  "$repo_dir/starter" "$repo_dir/README.md" "$repo_dir/START-HERE.md" >/dev/null 2>&1; then
  fail '發現尚未解決的 merge conflict 標記'
else
  ok '沒有 merge conflict 標記'
fi

if grep -q '<html lang="zh-Hant">' "$repo_dir/starter/site/index.html"; then
  ok '首頁已設定繁體中文語系'
else
  fail '首頁缺少 lang="zh-Hant"'
fi

lesson_count=$(find "$repo_dir/lessons" -type f -name '*.md' | wc -l | tr -d ' ')
if [ "$lesson_count" -eq 8 ]; then
  ok '8 個任務關卡都存在'
else
  fail "預期 8 個關卡，實際找到 $lesson_count 個"
fi

printf '\n'
if [ "$failures" -eq 0 ]; then
  printf '全部通過，可以送出 Pull Request！\n'
else
  printf '共有 %s 項未通過。修正後再執行一次。\n' "$failures"
  exit 1
fi
