# 第 07 關：咖啡館正式開幕

這一關不再逐行給指令。請用前面學到的流程完成一項改善。

## 任選一張任務卡

### A. 無障礙改善

替首頁補上 `lang="zh-Hant"`，確認標題層級合理，並讓 footer 的文字更容易閱讀。

### B. 新增套餐

在 `menu.md` 新增一組「工程師續命套餐」，包含飲品、甜點與價格；同時更新首頁的一句介紹。

### C. 修復營業資訊

讓 `about.md` 與首頁顯示一致的營業時間，並在 commit 訊息說明哪一份是正確來源。

### D. 自訂任務

找一個你真的想改善的地方。先寫完成條件，避免一路做到失焦。

## 必須遵守的流程

1. 建立 Issue，寫出動機與完成條件。
2. 從最新 `main` 建立命名清楚的 branch。
3. 至少做一個範圍單純、訊息清楚的 commit。
4. 推送 branch 並建立 Pull Request。
5. 查看 diff，執行驗收腳本：

   ```bash
   ./scripts/check.sh
   ```

6. 請隊友 review，或依下方清單自行 review。
7. 合併後同步本機 `main` 並刪除已合併 branch。

## 自我 Review 清單

- [ ] `git status` 沒有忘記的檔案
- [ ] `git diff main...HEAD` 只出現任務相關改動
- [ ] 沒有 `<<<<<<<` 等衝突標記
- [ ] 沒有帳密、token 或個人敏感資料
- [ ] 網頁能開啟，文字與連結正常
- [ ] PR 描述如何驗證，並連結 Issue

## 通關回顧

不看小抄，試著向隊友解釋：

1. `add` 和 `commit` 差在哪裡？
2. branch 解決什麼問題？
3. push 前後，哪些人看得到你的 commit？
4. 衝突時 Git 為什麼需要人類？
5. Issue、commit、PR 各自記錄哪一層資訊？

如果你能用自己的例子回答，就已具備參與一般 GitHub 團隊專案的核心能力。下一步可以研究 `rebase`、`cherry-pick`、protected branches 與 GitHub Actions，但先把這套小步協作流程用熟，比多背十個指令更重要。
