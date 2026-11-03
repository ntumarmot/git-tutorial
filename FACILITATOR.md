# 工作坊帶領指南

## 建議設定

- 對象：第一次接觸 Git，或只會 `add/commit` 的學員
- 人數：8–24 人，兩人一組
- 時間：完整 120 分鐘；精簡版 60 分鐘可略過第 02 與第 07 關
- 角色：每組一位 Driver 操作鍵盤，一位 Navigator 先預測結果；每關互換

## 120 分鐘流程

| 時間 | 活動 |
| ---: | --- |
| 0–10 | 環境健檢、建立 playground、說明三個區域 |
| 10–30 | 第 01 關：第一次 commit，互相比較 commit 訊息 |
| 30–45 | 第 02 關：故意改壞與復原 |
| 45–65 | 第 03 關：feature branch 與 merge |
| 65–90 | 第 04 關：衝突演練；讓學員先讀衝突標記 |
| 90–110 | 第 05、06 關：推送、Issue、PR、同伴 review |
| 110–120 | 最終挑戰與回顧 |

## 開場說法

「Git 是本機的版本歷史；GitHub 是放置 Git repository 並協助團隊討論、review 與自動化的平台。今天只記三個問題：在哪個 branch、改了什麼、下一個 commit 放什麼。」

## 示範技巧

- 指令執行前，請大家先投票預測 `git status` 會出現什麼。
- `git add` 後立刻比較 `git diff` 與 `git diff --staged`。
- 解衝突時不要直接給答案；先問三段標記各自代表誰的內容。
- PR review 要求至少留一則具體建議，不只按 Approve。

## 常見卡點

- **Commit 顯示身分未設定：** 回到第 00 關設定 `user.name` 與 `user.email`。
- **在教材 repo 而非 playground 操作：** 用 `pwd`、`git status` 確認位置。
- **無法 push：** 確認學員是否 fork、是否登入 GitHub，以及 `git remote -v` 指向哪裡。
- **合併沒有衝突：** 通常兩個 branch 沒改到同一行；重新依第 04 關建立 `conflict-lab`。
- **進入 Vim：** 按 `Esc`，輸入 `:wq` 後 Enter；或用 `git config --global core.editor "code --wait"`。

## 收尾問題

1. staging area 的價值是什麼？
2. 為什麼功能要開 branch？
3. conflict 是 Git 壞掉，還是 Git 在請人做決策？
4. 哪些動作只在本機？哪些會影響 GitHub 與隊友？

答案重點：暫存區讓 commit 可被精準策展；branch 隔離未完成工作；conflict 是無法自動判斷意圖時的正常保護；只有 push 等遠端操作會把本機歷史分享出去。
