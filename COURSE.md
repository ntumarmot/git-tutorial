# 🐿️ Git & GitHub 實戰完整課程

> 單一檔案整合版：從環境準備、第一個 commit、branch、merge conflict，一路做到 GitHub Issue 與 Pull Request，不需要在不同教材檔案之間切換。

你剛加入「土撥鼠咖啡館」網站團隊。今天的任務是改善咖啡館網站，並把成果安全地送進團隊的正式版本。

完成這份課程後，你會真的做過：

- 用 `status → add → commit` 保存版本
- 用 `log`、`diff`、`restore` 找問題與安全復原
- 用 branch 隔離工作，再 merge 回主線
- 親手解一次 merge conflict
- 使用 `push`、`fetch`、`pull` 與 GitHub remote
- 建立 Issue、Pull Request，完成一次 code review
- 走完一套適合小團隊的 GitHub 協作流程

完整課程約需 **2 小時**。如果只有 30 分鐘，可優先完成第 01、03、04 關。

---

## 課程目錄

1. [開始之前](#開始之前)
2. [Git 的核心心智模型](#git-的核心心智模型)
3. [第 00 關：準備出發](#第-00-關準備出發)
4. [第 01 關：保存今日菜單](#第-01-關保存今日菜單)
5. [第 02 關：時光救援](#第-02-關時光救援)
6. [第 03 關：新品秘密開發](#第-03-關新品秘密開發)
7. [第 04 關：衝突大對決](#第-04-關衝突大對決)
8. [第 05 關：前進 GitHub](#第-05-關前進-github)
9. [第 06 關：Issue 與 Pull Request](#第-06-關issue-與-pull-request)
10. [第 07 關：咖啡館正式開幕](#第-07-關咖啡館正式開幕)
11. [每日工作流程](#每日工作流程)
12. [Git 指令小抄](#git-指令小抄)
13. [常見問題](#常見問題)

---

## 開始之前

### 需要準備

- 一台可以使用終端機的電腦
- [Git](https://git-scm.com/downloads)
- 一個 [GitHub](https://github.com/) 帳號
- 任意文字編輯器，例如 VS Code
- 約 2 小時

兩人一組時，建議一人擔任 **Driver** 操作鍵盤，另一人擔任 **Navigator**，在每個指令執行前預測結果；每一關交換角色。

### 取得教材

打開終端機，執行：

```bash
git clone https://github.com/ntumarmot/git-tutorial.git
cd git-tutorial
```

先執行環境健檢：

```bash
./scripts/doctor.sh
```

如果畫面提醒尚未設定 Git 姓名或 Email，請換成自己的資料：

```bash
git config --global user.name "你的名字"
git config --global user.email "你在 GitHub 使用的 Email"
```

若希望 GitHub 正確連結你的 commit，可以使用 GitHub 帳號中的 Email，或 GitHub 提供的 `noreply` Email。

### 建立獨立練習場

不要直接在教材 repository 裡練習。請執行：

```bash
./scripts/new-playground.sh
cd playground
```

這會建立一個獨立的 Git repository。原始教材不會被練習用的 commit 弄亂。

如果 `playground` 已存在，腳本會停止，不會覆蓋內容。想重新練習時可指定新名稱：

```bash
./scripts/new-playground.sh playground-2
cd playground-2
```

### 確認起點

```bash
git status
git log --oneline
```

預期結果：

- 目前位於 `main` branch
- 工作區乾淨
- 已有一個 `Initial cafe website` commit

用瀏覽器開啟 `index.html`，就能看到剛開張的土撥鼠咖啡館網站。

> 從這裡開始，除非步驟特別說明，所有 Git 指令都在 `playground` 目錄執行。

[回到目錄](#課程目錄)

---

## Git 的核心心智模型

### Git 和 GitHub 不一樣

- **Git** 是你電腦上的版本控制工具。離線也能 commit、branch、merge。
- **GitHub** 是遠端 repository 與協作平台，提供 Issue、Pull Request、Review、Actions 等功能。

### Git 的三個區域

```text
你正在改的檔案          下一次要保存的內容             已保存的歷史
Working directory  --add-->  Staging area  --commit-->  Repository
       ^                         |
       +-------- restore --------+

Repository --push--> GitHub remote
Repository <--pull-- GitHub remote
```

- **工作區：** 你正在看到、編輯的檔案。
- **暫存區：** 精選「下一個 commit」要收錄的內容。
- **版本庫：** 已經提交、可以回看的歷史。

Git 的核心不是背下所有指令，而是隨時回答三個問題：

1. 我目前在哪個 branch？
2. 我改了什麼？
3. 下一個 commit 要放什麼？

最常用來回答這些問題的指令是：

```bash
git status
git diff
git diff --staged
```

[回到目錄](#課程目錄)

---

## 第 00 關：準備出發

**劇情：** 店長把咖啡館網站交給你。在動工以前，先確認 Git 知道你是誰，也確認你位於正確的 repository。

### 步驟 1：確認 Git

```bash
git --version
git config user.name
git config user.email
```

三個指令都應該有輸出。

### 步驟 2：確認目前位置

```bash
pwd
git status
```

你應位於 `playground`，而且看到：

```text
On branch main
nothing to commit, working tree clean
```

### 步驟 3：觀察第一個 commit

```bash
git log --oneline
```

每一行前方的短代碼是 commit ID。`HEAD` 代表你目前所在 branch 指向的 commit。

### 第 00 關驗收

- [ ] `git --version` 能顯示版本
- [ ] Git 姓名與 Email 都有設定
- [ ] 目前位於 `playground`
- [ ] `git status` 顯示 `On branch main`
- [ ] 能在 `git log` 看到 `Initial cafe website`

[回到目錄](#課程目錄)

---

## 第 01 關：保存今日菜單

**劇情：** 店長決定新增「肉桂拿鐵」。你要把它放進菜單，並留下一筆清楚的版本紀錄。

### 步驟 1：修改檔案

打開 `menu.md`，在飲品區新增：

```text
- 肉桂拿鐵 — NT$150
```

儲存檔案。

### 步驟 2：觀察工作區

```bash
git status
git diff
```

此時 `menu.md` 應顯示為 modified。`git diff` 會顯示尚未放進暫存區的內容。

### 步驟 3：放入暫存區

```bash
git add menu.md
git status
```

現在 `menu.md` 應出現在 `Changes to be committed`。

比較這兩個指令：

```bash
git diff
git diff --staged
```

- `git diff`：顯示尚未 add 的改動
- `git diff --staged`：顯示下一個 commit 會收錄的改動

### 步驟 4：建立 commit

確定 staged diff 只包含肉桂拿鐵後：

```bash
git commit -m "Add cinnamon latte to menu"
```

好的 commit 訊息會說明「這個版本完成了什麼」，而不是只寫 `update`、`fix` 或 `final`。

### 步驟 5：檢查結果

```bash
git log --oneline -3
git status
```

最新一筆應是剛才的 commit，工作區應該乾淨。

### Bonus：體驗暫存區的用途

同時修改 `menu.md` 與 `about.md`，但只執行：

```bash
git add menu.md
```

接著比較：

```bash
git diff
git diff --staged
```

你會看到兩份改動被分開。暫存區不是「全部存檔」，而是用來策展下一個有意義的 commit。

完成實驗後，可以把兩份修改分別做成兩個 commit；如果只是刻意測試，請先閱讀下一關的復原方式。

### 第 01 關驗收

```bash
git log -1 --oneline
git status
```

- [ ] 最新 commit 訊息能說明新增了什麼
- [ ] `menu.md` 有肉桂拿鐵
- [ ] working tree 乾淨

[回到目錄](#課程目錄)

---

## 第 02 關：時光救援

**劇情：** 一隻土撥鼠踩到鍵盤，把營業時間改壞了。你還沒有 commit，現在要找出問題並救回正確內容。

### 任務 A：復原尚未 add 的改動

1. 打開 `about.md`。
2. 把營業時間任意改成錯誤內容。
3. 儲存檔案。

先觀察差異：

```bash
git status
git diff about.md
```

確認這些改動真的不要以後，再執行：

```bash
git restore about.md
git status
```

`git restore` 會丟棄該檔案尚未提交的修改。執行前一定要先看 `git diff`。

### 任務 B：取消不小心執行的 add

再次修改 `about.md`，接著執行：

```bash
git add about.md
git status
```

假設你還不想把它放進下一個 commit：

```bash
git restore --staged about.md
git status
```

注意：`--staged` 只把檔案移出暫存區，修改內容仍然留在工作區。

清掉這次實驗的工作區修改：

```bash
git restore about.md
git status
```

### 任務 C：閱讀歷史

```bash
git log --oneline --decorate --graph --all
git show HEAD
git show HEAD~1:menu.md
```

- `HEAD`：目前 branch 指向的 commit
- `HEAD~1`：上一個 commit
- `git show <commit>:<file>`：直接查看某一版本的檔案，不必切換過去

### 已經 commit，而且已經分享出去怎麼辦？

共同 branch 上優先使用：

```bash
git revert <commit-id>
```

`revert` 會建立一個反向的新 commit，保留完整歷史。不要為了讓歷史「看起來乾淨」，就改寫隊友已經取得的 commit。

### 第 02 關驗收

```bash
git status
```

- [ ] 顯示 `nothing to commit, working tree clean`
- [ ] `about.md` 的營業時間仍是原始內容
- [ ] 能說明 `restore file` 與 `restore --staged file` 的差異

[回到目錄](#課程目錄)

---

## 第 03 關：新品秘密開發

**劇情：** 你要開發季節限定甜點，但完成前不能影響正式菜單。

### 步驟 1：建立功能 branch

```bash
git switch -c feature/acorn-cake
git branch
```

`*` 表示你目前所在的 branch。Branch 不是複製整個專案，而是一個會隨 commit 前進的輕量指標。

### 步驟 2：在功能 branch 工作

打開 `menu.md`，在甜點區新增：

```text
- 橡實造型蛋糕 — NT$180
```

接著提交：

```bash
git status
git diff
git add menu.md
git diff --staged
git commit -m "Add seasonal acorn cake"
```

### 步驟 3：比較兩條時間線

```bash
git log --oneline --graph --decorate --all
git switch main
```

切回 `main` 後，橡實造型蛋糕會從 `menu.md` 消失。

這不是檔案遺失。它安全地待在 `feature/acorn-cake` branch。

```bash
git switch feature/acorn-cake
```

現在內容又回來了。

### 步驟 4：合併回 main

合併時，先切到「要接收改動」的 branch，再指定「要帶進來」的 branch：

```bash
git switch main
git merge feature/acorn-cake
```

查看歷史：

```bash
git log --oneline --graph --decorate --all
```

這次很可能顯示 `fast-forward`。因為 `main` 沒有分岔，Git 只需要把 branch 指標往前移。

### 步驟 5：刪除已合併 branch

確認內容已經進入 `main` 後：

```bash
git branch -d feature/acorn-cake
git branch
```

### 第 03 關驗收

- [ ] `git branch` 顯示目前位於 `main`
- [ ] `menu.md` 有橡實造型蛋糕
- [ ] `git log` 包含 `Add seasonal acorn cake`
- [ ] 能說明為什麼切換 branch 時內容會改變

[回到目錄](#課程目錄)

---

## 第 04 關：衝突大對決

**劇情：** 你和店長都改了首頁標語。Git 不知道哪一個才是團隊真正想要的版本，必須請你做決定。

> 這一關會刻意製造 conflict。開始前請確認目前位於 `playground` 的 `main`，而且工作區乾淨。

```bash
git switch main
git status
```

### 任務 A：建立你的版本

```bash
git switch -c feature/new-slogan
```

把 `index.html` 中的 `<h1>` 改成：

```html
<h1>土撥鼠咖啡館：每一口都是冒險</h1>
```

提交：

```bash
git add index.html
git commit -m "Write adventurous cafe slogan"
```

### 任務 B：建立店長的版本

切回 `main`：

```bash
git switch main
```

把同一行 `<h1>` 改成：

```html
<h1>土撥鼠咖啡館：城市裡的森林角落</h1>
```

提交：

```bash
git add index.html
git commit -m "Update slogan for cozy brand"
```

現在兩個 branch 都修改了同一行，而且內容不同。

### 任務 C：讓兩條時間線相遇

```bash
git merge feature/new-slogan
```

你應該會看到 `CONFLICT`。這不是 Git 壞掉，而是 Git 拒絕猜測人類的意圖。

先確認狀態：

```bash
git status
```

打開 `index.html`，找到類似內容：

```text
    <<<<<<< HEAD
    main 目前的內容
    =======
    feature/new-slogan 帶來的內容
    >>>>>>> feature/new-slogan
```

三個區塊的意思：

- `<<<<<<< HEAD` 下方：目前所在 branch 的內容
- `=======`：兩個版本的分隔線
- `>>>>>>> feature/new-slogan` 上方：準備合併進來的內容

### 任務 D：做出內容決策

自行決定最後標語。你可以選擇其中一邊，也可以融合成更好的句子。

例如：

```html
<h1>土撥鼠咖啡館：城市裡的每一口冒險</h1>
```

重要的是：

1. 留下團隊真正想要的內容。
2. 把 `<<<<<<<`、`=======`、`>>>>>>>` 全部移除。
3. 確認剩下的是合法 HTML。

完成後：

```bash
git add index.html
git status
git commit -m "Resolve homepage slogan conflict"
```

查看合併歷史：

```bash
git log --oneline --graph --decorate --all
```

### 如果想取消整次合併

在衝突尚未完成 commit 前，可以執行：

```bash
git merge --abort
```

這會回到 merge 開始前的狀態。若要繼續練習，再重新執行：

```bash
git merge feature/new-slogan
```

### 第 04 關驗收

```bash
git status
grep -nE '<<<<<<<|=======|>>>>>>>' index.html
```

- [ ] working tree 乾淨
- [ ] `grep` 沒有輸出任何衝突標記
- [ ] `index.html` 只留下最後決定的標語
- [ ] 首頁仍能正常開啟
- [ ] 能說明 conflict 是內容決策，而不是 Git 故障

[回到目錄](#課程目錄)

---

## 第 05 關：前進 GitHub

**劇情：** 本機版本已經很棒，但隊友仍然看不到。現在要把工作分享到 GitHub。

### 重要：playground 和教材 fork 是不同歷史

`playground` 是獨立建立的 repository，不能直接推進教材 fork 的現有歷史。

接下來的 GitHub 練習，請使用以下其中一種方式：

1. **推薦：** Fork 本教材，再 clone 你的 fork。
2. 在 GitHub 建立一個新的空白練習 repository。

以下步驟使用第一種方式。

### 步驟 1：Fork 教材

1. 前往 `https://github.com/ntumarmot/git-tutorial`。
2. 點右上角 **Fork**。
3. 建立你自己帳號下的副本。
4. 複製你的 fork URL。

### 步驟 2：Clone 你的 fork

離開目前的 `playground` 與教材目錄：

```bash
cd ../..
```

Clone 你的 fork。請把 `<你的帳號>` 換成 GitHub 帳號：

```bash
git clone https://github.com/<你的帳號>/git-tutorial.git my-git-tutorial
cd my-git-tutorial
```

確認 remote：

```bash
git remote -v
```

`origin` 應該指向你自己的 fork，而不是 `ntumarmot/git-tutorial`。

### 步驟 3：建立要分享的 branch

```bash
git switch -c docs/my-learning-note
```

建立 `notes` 資料夾，並新增 `notes/<你的帳號>.md`。

內容可以是：

```markdown
# 我的 Git 冒險筆記

- 今天最意外的觀念：
- 我成功解掉的問題：
- 下次工作時會使用的指令：
```

填入自己的心得後：

```bash
git status
git add notes/<你的帳號>.md
git diff --staged
git commit -m "Add my Git learning notes"
```

### 步驟 4：推送 branch

```bash
git push -u origin docs/my-learning-note
```

`-u` 會建立本機 branch 與遠端 branch 的追蹤關係。之後在這個 branch 可以直接執行：

```bash
git push
```

### 步驟 5：認識 fetch 與 pull

```bash
git fetch origin
git branch --all
```

`fetch` 只更新你對遠端狀態的認識，不會修改工作區。

`pull` 大致相當於 fetch 後，再把遠端內容整合到目前 branch。同步共同主線可以使用：

```bash
git switch main
git pull --ff-only
```

`--ff-only` 只允許安全的 fast-forward。遇到分岔時會停止，讓你自己決定如何處理，而不是意外產生 merge commit。

切回剛才的工作 branch：

```bash
git switch docs/my-learning-note
```

### 第 05 關驗收

- [ ] `git remote -v` 的 `origin` 指向你有權限推送的位置
- [ ] GitHub 網頁上能看到 `docs/my-learning-note` branch
- [ ] `git status` 顯示 branch 正在追蹤對應的 `origin/...`
- [ ] 能說明 commit 與 push 的差異
- [ ] 能說明 fetch 與 pull 的差異

[回到目錄](#課程目錄)

---

## 第 06 關：Issue 與 Pull Request

**劇情：** 你的筆記已經推到 GitHub，但正式合併前，團隊需要知道「為什麼改、改了什麼、如何確認」。

### 步驟 1：建立 Issue

在你的 fork 或練習 repository：

1. 開啟 **Issues**。
2. 點 **New issue**。
3. 選擇 `✨ 功能任務` 範本。如果沒顯示範本，也可以建立空白 Issue。
4. 說明為什麼需要這項改變。
5. 列出可以客觀確認的完成條件。
6. 寫下預計修改的檔案或作法。
7. 建立 Issue，記住編號，例如 `#3`。

好的 Issue 不是只寫「不能動」或「新增筆記」，而是讓沒有參與先前討論的人也能理解與接手。

### 步驟 2：建立 Pull Request

回到 GitHub repository 首頁。剛推送 branch 時，通常會看到 **Compare & pull request**。

建立 PR 時確認：

- Base branch：`main`
- Compare branch：`docs/my-learning-note`
- 標題能清楚說明成果
- 描述說明動機、修改內容與驗證方式
- 加入 `Closes #<Issue 編號>`

例如：

```text
Closes #3
```

合併 PR 時，GitHub 就會自動關閉對應 Issue。

還沒完成時，可以先建立 **Draft Pull Request**；準備好以後再標示 **Ready for review**。

### 步驟 3：Review Pull Request

兩人一組時，交換 PR：

1. 打開對方的 PR。
2. 先閱讀 PR 說明。
3. 進入 **Files changed**，查看實際差異。
4. 確認沒有無關檔案、密碼、token 或個人敏感資料。
5. 留下一則具體建議。

好的 Review 留言例如：

```text
這段能否補上一個實際使用 git restore 的例子？
```

只有 `LGTM` 或「看起來很好」通常無法幫助作者改善內容。

### 步驟 4：根據 Review 更新 PR

作者不需要關閉 PR 或重新建立 branch。直接在原 branch 修改：

```bash
# 修改檔案後
git status
git diff
git add notes/<你的帳號>.md
git commit -m "Clarify restore example in learning notes"
git push
```

PR 會自動加入新的 commit。

Reviewer 確認建議已處理後，可以選擇 **Approve**。

### 步驟 5：合併 PR

確認以下事項：

- 修改範圍符合 Issue
- 自動檢查通過
- Review 問題已處理
- PR 沒有敏感資料

然後合併 PR，並在 GitHub 刪除遠端功能 branch。

### 步驟 6：同步本機

PR 在 GitHub 合併後，本機 `main` 還不知道遠端已更新：

```bash
git switch main
git pull --ff-only
```

刪除已經合併的本機 branch：

```bash
git branch -d docs/my-learning-note
```

查看結果：

```bash
git log --oneline --graph --decorate -8
git status
```

### 第 06 關驗收

- [ ] Issue 能獨立說明需求與完成條件
- [ ] PR 有連結 Issue
- [ ] PR 描述包含驗證方式
- [ ] `Files changed` 沒有無關檔案或敏感資料
- [ ] 至少完成一則具體 Review
- [ ] Review 完成後才 merge
- [ ] 本機 `main` 已同步最新結果
- [ ] 已刪除完成任務的 branch

[回到目錄](#課程目錄)

---

## 第 07 關：咖啡館正式開幕

最後一關不再逐行提供指令。請使用前面學到的完整流程，自主完成一項改善。

### 任選一張任務卡

#### A. 無障礙改善

替首頁確認 `lang="zh-Hant"`，檢查標題層級，並讓 footer 文字更容易閱讀。

#### B. 新增套餐

在 `menu.md` 新增一組「工程師續命套餐」，包含飲品、甜點與價格，同時更新首頁的一句介紹。

#### C. 修復營業資訊

讓 `about.md` 與首頁顯示一致的營業時間，並在 commit 訊息說明哪一份是正確來源。

#### D. 自訂任務

找一個你真的想改善的地方。先寫出完成條件，避免任務一路擴大。

### 必須完成的流程

1. 建立 Issue，寫出動機與完成條件。
2. 確認本機 `main` 是最新版本。
3. 從 `main` 建立命名清楚的 branch。
4. 修改內容。
5. 使用 `status` 與 `diff` 檢查。
6. 至少建立一個範圍單純、訊息清楚的 commit。
7. 推送 branch。
8. 建立 Pull Request，連結 Issue。
9. 查看完整 diff。
10. 執行教材驗收腳本：

    ```bash
    ./scripts/check.sh
    ```

11. 請隊友 Review，或依下方清單自行 Review。
12. 自動檢查與 Review 都通過後再合併。
13. 同步本機 `main`。
14. 刪除遠端與本機的已合併 branch。

### 自我 Review 清單

- [ ] `git status` 沒有忘記的檔案
- [ ] `git diff main...HEAD` 只出現任務相關改動
- [ ] 沒有 `<<<<<<<`、`=======`、`>>>>>>>` 等衝突標記
- [ ] 沒有密碼、token 或個人敏感資料
- [ ] 網頁能開啟，文字與連結正常
- [ ] `./scripts/check.sh` 通過
- [ ] Commit 一次只處理一個清楚目的
- [ ] PR 描述如何驗證，並連結 Issue

### 通關回顧

試著不看小抄，回答：

1. `git add` 和 `git commit` 差在哪裡？
2. Branch 解決什麼問題？
3. Push 前後，哪些人看得到你的 commit？
4. Conflict 時，Git 為什麼需要人類？
5. Issue、commit、PR 各自記錄哪一層資訊？

參考答案：

- `add` 把指定變更放入暫存區；`commit` 保存暫存區的快照。
- Branch 隔離未完成工作，讓功能可以平行開發。
- Commit 預設只存在本機；push 後，有遠端權限的人才看得到。
- Git 能比較文字差異，但無法判斷團隊真正想留下的意思。
- Issue 記錄需求與原因；commit 記錄實作步驟；PR 記錄整體變更、討論與 Review 決策。

如果你能用自己的例子回答，就已經具備參與一般 GitHub 團隊專案的核心能力。

[回到目錄](#課程目錄)

---

## 每日工作流程

開始新任務時：

```bash
git switch main
git pull --ff-only
git switch -c feature/清楚的任務名稱
```

工作過程中反覆進行：

```bash
git status
git diff
git add <這次要提交的檔案>
git diff --staged
git commit -m "清楚說明這個版本完成什麼"
```

準備分享時：

```bash
git push -u origin feature/清楚的任務名稱
```

接著在 GitHub：

```text
Issue → Branch → 小步 Commit → Push → Pull Request → Review → Merge → 刪除 Branch
```

PR 合併後回到本機：

```bash
git switch main
git pull --ff-only
git branch -d feature/清楚的任務名稱
```

[回到目錄](#課程目錄)

---

## Git 指令小抄

### 查看狀態與歷史

```bash
git status
git diff
git diff --staged
git log --oneline --graph --decorate --all
git show HEAD
```

### 建立版本

```bash
git add <file>
git commit -m "訊息"
```

### Branch

```bash
git branch
git switch -c feature/name
git switch main
git merge feature/name
git branch -d feature/name
```

### Remote

```bash
git remote -v
git fetch origin
git pull --ff-only
git push -u origin feature/name
git push
```

### 安全復原

```bash
git restore <file>             # 丟棄尚未 add 的修改
git restore --staged <file>    # 取消 add，保留工作區內容
git commit --amend             # 修改尚未分享的上一個 commit
git revert <commit-id>         # 用新 commit 反轉已分享的 commit
git merge --abort              # 取消尚未完成的 merge
```

> `restore` 可能丟掉尚未保存的內容，執行前先用 `git diff`。已推送的共同歷史優先用 `revert`，不要任意 force push。

### Commit 訊息範例

清楚：

```text
Add seasonal latte to menu
Fix typo in opening hours
Update contribution guide
```

不清楚：

```text
update
fix
final final
```

[回到目錄](#課程目錄)

---

## 常見問題

### Commit 顯示身分未設定

```bash
git config --global user.name "你的名字"
git config --global user.email "你的 Email"
```

### 不確定自己在哪一個資料夾

```bash
pwd
git status
```

先確認是在教材、`playground`，還是你的 fork clone。

### 不確定目前在哪個 branch

```bash
git branch
git status
```

`git branch` 中有 `*` 的項目，就是目前 branch。

### Add 了錯誤檔案

```bash
git restore --staged <file>
```

檔案內容會保留，只是移出暫存區。

### Merge conflict 想重新開始

```bash
git merge --abort
```

### 合併時沒有產生 conflict

通常是兩個 branch 沒有修改到同一行。請確認 `feature/new-slogan` 與 `main` 都各自修改並 commit 了 `index.html` 的同一個 `<h1>`。

### 無法 push

先確認：

```bash
git remote -v
git status
```

檢查項目：

- `origin` 是否指向你自己的 fork 或有權限的 repository
- 是否已登入 GitHub
- branch 是否有本機 commit
- 第一次推送是否使用 `git push -u origin <branch-name>`

### 終端機進入 Vim，不知道怎麼離開

按 `Esc`，輸入：

```text
:wq
```

再按 Enter。

也可以把 VS Code 設成預設編輯器：

```bash
git config --global core.editor "code --wait"
```

### 不小心把密碼或 token commit 了

1. 立刻到服務提供者撤銷該密碼或 token。
2. 建立新的憑證。
3. 把敏感檔案加入 `.gitignore`。
4. 通知 repository 維護者協助清理歷史。

只從最新版本刪除秘密並不代表它已從 Git 歷史消失。

---

## 課程完成

你已經走完：

```text
修改 → 暫存 → Commit → Branch → Merge → 解衝突
     → Push → Issue → Pull Request → Review → Merge
```

下一步可以研究 `rebase`、`cherry-pick`、protected branches 與 GitHub Actions。但先把這套小步協作流程用熟，比多背十個指令更重要。

[回到目錄](#課程目錄)
