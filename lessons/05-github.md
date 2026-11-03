# 第 05 關：前進 GitHub

**劇情：** 本機版本已經很棒，但隊友看不到。現在要把它放到 GitHub。

## Git 與 GitHub 不一樣

- **Git** 是你電腦上的版本控制工具；離線也能 commit、branch、merge。
- **GitHub** 是遠端 repository 與協作平台，提供 Issue、Pull Request、Review、Actions 等功能。

## 任務 A：Fork 教材

1. 前往本教材的 GitHub 頁面。
2. 點右上角 **Fork**，建立你帳號下的副本。
3. 複製 fork 的 HTTPS 或 SSH URL。

> 你的 `playground` 是獨立 repo，不能直接把它推進教材 fork 的現有歷史。以下練習請在 fork clone 中進行，或在 GitHub 建立一個空白練習 repo。

推薦作法：把 fork clone 到教材目錄之外：

```bash
cd ..
git clone https://github.com/<你的帳號>/git-tutorial.git my-git-tutorial
cd my-git-tutorial
git remote -v
```

## 任務 B：建立可分享的分支

```bash
git switch -c docs/my-learning-note
```

新增 `notes/<你的帳號>.md`，寫下：

```markdown
# 我的 Git 冒險筆記

- 今天最意外的觀念：
- 我成功解掉的問題：
- 下次工作時會使用的指令：
```

接著：

```bash
git add notes/<你的帳號>.md
git commit -m "Add my Git learning notes"
git push -u origin docs/my-learning-note
```

`-u` 會建立本機 branch 與遠端 branch 的追蹤關係，之後可以直接 `git push`。

## 任務 C：看懂 fetch 與 pull

```bash
git fetch origin
git branch --all
```

`fetch` 只更新你對遠端狀態的認識，不會動工作區。`pull` 大致相當於 fetch 後再整合到目前分支。共同主線可使用：

```bash
git switch main
git pull --ff-only
```

`--ff-only` 避免意外產生 merge commit；遇到分岔時會停下來讓你決定。

## 驗收

- `git remote -v` 的 `origin` 指向你有權限推送的位置。
- GitHub 網頁上能看到 `docs/my-learning-note` branch。
- `git status` 顯示 branch 正在追蹤對應的 `origin/...`。

下一關：[第 06 關：Issue 與 Pull Request](06-pull-request.md)。
