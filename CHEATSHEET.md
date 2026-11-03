# Git & GitHub 小抄

## 每天最常用

```bash
git status                 # 我在哪裡？現在有哪些變動？
git diff                   # 尚未 add 的改動
git diff --staged          # 已 add、準備 commit 的改動
git add <file>             # 把指定檔案放進暫存區
git commit -m "訊息"       # 保存暫存區內容
git log --oneline --graph --all
```

## 分支

```bash
git branch                 # 列出分支
git switch -c feature/menu # 建立並切換
git switch main            # 切回 main
git merge feature/menu     # 把指定分支合併到目前分支
git branch -d feature/menu # 刪除已合併的本機分支
```

## 遠端

```bash
git remote -v
git push -u origin feature/menu # 第一次推送並設定追蹤
git push                        # 後續推送
git pull --ff-only              # 只允許安全的快轉更新
git fetch                       # 下載遠端資訊，不改工作區
```

## 安全復原

```bash
git restore <file>              # 丟棄尚未 add 的檔案改動
git restore --staged <file>     # 取消 add，保留檔案內容
git commit --amend              # 修改「尚未分享」的上一個 commit
git revert <commit-id>          # 用新 commit 反轉已分享的 commit
```

> `restore` 可能丟掉尚未保存的內容；執行前先用 `git diff`。已推送的共同歷史優先用 `revert`，不要任意 force push。

## Commit 訊息

好訊息說明「這個 commit 做了什麼」，使用動詞開頭、一次只講一件事：

```text
Add seasonal latte to menu
Fix typo in opening hours
Update contribution guide
```

避免 `update`、`fix`、`final final` 這種無法從歷史辨識用途的訊息。

## Merge conflict 四步驟

```bash
git status                 # 1. 找出衝突檔
# 2. 編輯檔案，移除 <<<<<<<、=======、>>>>>>>
git add <resolved-file>    # 3. 標記已解決
git commit                 # 4. 完成 merge
```

想取消整次合併：

```bash
git merge --abort
```

## 一個實用協作流程

```text
Issue → branch → 小步 commit → push → Pull Request → review → merge → 刪 branch
```
