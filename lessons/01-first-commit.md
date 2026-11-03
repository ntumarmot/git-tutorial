# 第 01 關：保存今日菜單

**劇情：** 店長決定新增「肉桂拿鐵」，請你把它放進菜單並留下清楚紀錄。

## 任務

1. 打開 `menu.md`，在飲品區新增一行：

   ```text
   - 肉桂拿鐵 — NT$150
   ```

2. 觀察 Git：

   ```bash
   git status
   git diff
   ```

3. 把這個檔案放進下一個 commit：

   ```bash
   git add menu.md
   git status
   git diff --staged
   ```

4. 確定 staged diff 只包含你想保存的內容後提交：

   ```bash
   git commit -m "Add cinnamon latte to menu"
   ```

5. 檢查結果：

   ```bash
   git log --oneline -3
   git status
   ```

## Bonus：一次只提交一件事

同時修改 `menu.md` 與 `about.md`，但只 `git add menu.md`。比較：

```bash
git diff
git diff --staged
```

你會看到未 staged 與已 staged 的變動可以分開。這就是 staging area 的用途：不是「全部存檔」，而是策展下一個有意義的版本。

完成實驗後，可以提交 `menu.md`，再把 `about.md` 另做一個 commit；或用 `git restore` 丟棄刻意做的實驗改動。

## 驗收

```bash
git log -1 --oneline
git status
```

- 最新 commit 訊息能說明新增了什麼。
- working tree 應該乾淨；若做了 Bonus，確認沒有忘記的修改。

下一關：[第 02 關：時光救援](02-time-travel.md)。
