#!/usr/bin/env bash

set -u

pass_count=0
warn_count=0

pass() {
  printf '✅ %s\n' "$1"
  pass_count=$((pass_count + 1))
}

warn() {
  printf '⚠️  %s\n' "$1"
  warn_count=$((warn_count + 1))
}

printf '🐿️  Git 冒險環境健檢\n\n'

if command -v git >/dev/null 2>&1; then
  pass "Git 已安裝：$(git --version)"
else
  warn '找不到 Git，請先到 https://git-scm.com/downloads 安裝。'
fi

if command -v git >/dev/null 2>&1 && [ -n "$(git config --global user.name 2>/dev/null || true)" ]; then
  pass "Git 姓名：$(git config --global user.name)"
else
  warn '尚未設定姓名：git config --global user.name "你的名字"'
fi

if command -v git >/dev/null 2>&1 && [ -n "$(git config --global user.email 2>/dev/null || true)" ]; then
  pass "Git Email 已設定"
else
  warn '尚未設定 Email：git config --global user.email "你的 Email"'
fi

if command -v ssh >/dev/null 2>&1; then
  pass 'SSH 工具可用（使用 HTTPS clone 也完全沒問題）'
else
  warn '找不到 SSH；本課程仍可使用 HTTPS。'
fi

printf '\n結果：%s 項通過，%s 項提醒。\n' "$pass_count" "$warn_count"

if [ "$warn_count" -eq 0 ]; then
  printf '準備完成！執行 ./scripts/new-playground.sh 開始冒險。\n'
else
  printf '處理上方必要提醒後，就可以開始。SSH 提醒可忽略。\n'
fi
