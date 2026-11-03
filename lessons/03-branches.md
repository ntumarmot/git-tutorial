# 第 03 關：新品秘密開發

**劇情：** 你要開發季節限定甜點，但在完成前不能影響正式菜單。

## 任務 A：建立功能分支

```bash
git switch -c feature/acorn-cake
git branch
```

`*` 表示你現在所在的位置。分支不是另一份龐大的資料夾，而是一個會隨 commit 前進的輕量指標。

在 `menu.md` 加入：

```text
- 橡實造型蛋糕 — NT$180
```

提交它：

```bash
git add menu.md
git commit -m "Add seasonal acorn cake"
```

## 任務 B：比較兩條時間線

```bash
git log --oneline --graph --decorate --all
git switch main
```

切回 `main` 後，剛才的蛋糕會從 `menu.md` 消失。別緊張：它安全地待在功能分支。

```bash
git switch feature/acorn-cake
```

內容又回來了。

## 任務 C：合併

先切到「要接收改動」的分支，再指定「要帶進來」的分支：

```bash
git switch main
git merge feature/acorn-cake
git log --oneline --graph --decorate --all
```

這次很可能是 `fast-forward`：因為 `main` 沒有分岔，Git 只需把指標往前移。

確認合併完成後可刪除本機功能分支：

```bash
git branch -d feature/acorn-cake
```

## 驗收

- `git branch` 顯示你在 `main`。
- `menu.md` 有橡實造型蛋糕。
- `git log` 包含 `Add seasonal acorn cake`。

下一關：[第 04 關：衝突大對決](04-conflict.md)。
