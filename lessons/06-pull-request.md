# 第 06 關：用 Pull Request 協作

**劇情：** 你的筆記已推到 GitHub，但正式合併前，團隊要知道「為什麼改、改了什麼、如何確認」。

## 任務 A：先建立 Issue

在你的 fork 或練習 repo：

1. 開啟 **Issues → New issue**。
2. 選擇 `✨ 功能任務` 範本（若 fork 沒有顯示範本，也可建立空白 Issue）。
3. 寫清楚動機、完成條件與預計作法。
4. 建立後記下編號，例如 `#3`。

Issue 用來描述問題與共識，不是只貼一句「不能動」。好的 Issue 讓尚未參與討論的人也能接手。

## 任務 B：開 Pull Request

GitHub 通常會在剛推送的 branch 顯示 **Compare & pull request**。點進去後：

- Base branch 選 `main`。
- Compare branch 選 `docs/my-learning-note`。
- 標題說清楚成果。
- 內容使用 PR 範本，加入 `Closes #<Issue 編號>`。
- 先建立 Draft PR 也可以；準備好再標示 Ready for review。

## 任務 C：像隊友一樣 Review

兩人一組時，交換 PR：

1. 先看 **Files changed**，不要只讀作者摘要。
2. 留一則具體留言，例如「這段是否能補一個實際例子？」
3. 作者在原 branch 修改、commit、push；PR 會自動更新。
4. Reviewer 確認問題處理後 Approve。
5. 合併 PR，並刪除遠端功能 branch。

一個人練習時，請自己從 reviewer 角度核對：變更是否只包含預期檔案？commit 是否清楚？Markdown 是否正常？

## 任務 D：同步本機

PR 在 GitHub 合併後，本機 `main` 還不知道：

```bash
git switch main
git pull --ff-only
git branch -d docs/my-learning-note
git log --oneline --graph --decorate -8
```

## 驗收

- Issue 能獨立說明需求，並列出完成條件。
- PR 連結 Issue，描述測試方式。
- `Files changed` 沒有密碼、token、編輯器暫存檔或無關改動。
- Review 完成後才 merge。

最後一關：[第 07 關：自主挑戰](07-final-challenge.md)。
