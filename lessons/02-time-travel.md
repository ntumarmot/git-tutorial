# 第 02 關：時光救援

**劇情：** 一隻土撥鼠踩到鍵盤，把營業時間改壞了。你還沒 commit，現在要找出並救回正確內容。

## 任務 A：尚未 add 的改動

1. 把 `about.md` 的營業時間任意改成錯誤內容並存檔。
2. 找出差異：

   ```bash
   git status
   git diff about.md
   ```

3. 確認這些改動真的不要後，復原檔案：

   ```bash
   git restore about.md
   git status
   ```

`git restore` 會丟棄該檔案尚未提交的變動，執行前一定要先看 diff。

## 任務 B：不小心 add 了

再次修改 `about.md`，接著：

```bash
git add about.md
git status
git restore --staged about.md
git status
```

注意：`--staged` 只把檔案移出暫存區，內容仍留在工作區。最後用 `git restore about.md` 清掉這次實驗。

## 任務 C：考古

```bash
git log --oneline --decorate --graph --all
git show HEAD
git show HEAD~1:menu.md
```

- `HEAD` 是目前所在分支指向的 commit。
- `HEAD~1` 是它的上一個 commit。
- `git show <commit>:<file>` 能直接看某一版本的檔案，不必切換過去。

## 已經分享出去的錯誤怎麼辦？

共同分支上優先使用：

```bash
git revert <commit-id>
```

它會建立一個反向的新 commit，保留完整歷史。不要為了讓歷史「看起來乾淨」就改寫隊友已經取得的 commit。

## 驗收

`git status` 顯示 `nothing to commit, working tree clean`，而 `about.md` 的營業時間仍是原始內容。

下一關：[第 03 關：新品秘密開發](03-branches.md)。
