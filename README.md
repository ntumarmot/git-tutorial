# 🐿️ Git & GitHub 實戰：拯救土撥鼠咖啡館

這不是一本要從頭背到尾的指令手冊，而是一場約 **2 小時的協作任務**。

你剛加入「土撥鼠咖啡館」網站團隊。店長會一路派任務給你：保存菜單、救回誤刪內容、開發新品、處理兩位同事改到同一行的衝突，最後把成果送到 GitHub，經過 Pull Request 才正式上線。

完成後，你會真的做過：

- 用 `status → add → commit` 保存一份版本
- 用 `log`、`diff`、`restore` 找問題與安全復原
- 用 branch 隔離工作，再 merge 回主線
- 親手解一次 merge conflict
- 連接 GitHub，練習 `push`、`pull`、Issue 與 Pull Request
- 看懂一個適合小團隊使用的協作流程

## 開始之前

你需要：

- 一台可以使用終端機的電腦
- [Git](https://git-scm.com/downloads)
- 一個 [GitHub](https://github.com/) 帳號
- 約 2 小時；兩人一組會更有趣，但一個人也能完整練習

先執行環境健檢：

```bash
git clone https://github.com/ntumarmot/git-tutorial.git
cd git-tutorial
./scripts/doctor.sh
```

接著閱讀 [START-HERE.md](START-HERE.md)，開始第一個任務。

## 任務地圖

| 關卡 | 主題 | 建議時間 | 完成標誌 |
| --- | --- | ---: | --- |
| [00 準備出發](lessons/00-setup.md) | 安裝、設定、心智模型 | 10 分 | 看懂工作區、暫存區、版本庫 |
| [01 保存菜單](lessons/01-first-commit.md) | status、add、commit | 15 分 | 做出第一個 commit |
| [02 時光救援](lessons/02-time-travel.md) | log、diff、restore | 15 分 | 救回被改壞的檔案 |
| [03 新品秘密開發](lessons/03-branches.md) | branch、switch、merge | 20 分 | 合併 feature branch |
| [04 衝突大對決](lessons/04-conflict.md) | merge conflict | 20 分 | 解完一次真實衝突 |
| [05 前進 GitHub](lessons/05-github.md) | remote、push、pull | 15 分 | 把 branch 推上遠端 |
| [06 團隊協作](lessons/06-pull-request.md) | Issue、PR、Review | 20 分 | 完成一個 Pull Request |
| [07 最終挑戰](lessons/07-final-challenge.md) | 綜合演練 | 15 分 | 通過驗收清單 |

卡關時先看 [小抄](CHEATSHEET.md)，再看每關底部的提示。講師或帶領者可使用 [FACILITATOR.md](FACILITATOR.md)。

## 這份教材怎麼使用

- **自己練：** 每關照著「任務」做，先別展開提示；完成後再核對驗收。
- **讀書會：** 兩人一組，一人操作、一人觀察，每關交換角色。
- **工作坊：** 建議 8–24 人，兩人一組。第 06 關讓隊友互相 review PR。

每次想重來，都可以建立一個全新的練習場：

```bash
./scripts/new-playground.sh
cd playground
```

這會在 `playground/` 建立獨立的 Git repository；教材本身不會被你的練習 commit 弄亂。

## 一張圖記住 Git

```text
你正在改的檔案          下一次要保存的內容             已保存的歷史
Working directory  --add-->  Staging area  --commit-->  Repository
       ^                         |
       +-------- restore --------+

Repository --push--> GitHub remote
Repository <--pull-- GitHub remote
```

Git 的核心不是背指令，而是隨時回答三個問題：**我在哪個 branch？改了什麼？下一個 commit 要放什麼？**

## 專案結構

```text
lessons/       任務式教學
starter/       咖啡館網站初始素材
scripts/       環境健檢、沙盒建立與驗收工具
.github/       Issue、PR 範本與自動檢查
```

歡迎用 Issue 回報卡關處，或用 Pull Request 改善教材。刻意做錯、再學會救回來，才是這場冒險最好玩的部分。
