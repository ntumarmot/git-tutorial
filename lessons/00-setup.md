# 第 00 關：準備出發

**劇情：** 店長把咖啡館網站交給你，但在動工前，要先讓 Git 知道你是誰。

## 任務 A：環境健檢

回到教材根目錄執行：

```bash
./scripts/doctor.sh
```

若還沒設定姓名與 email，請使用你自己的資料：

```bash
git config --global user.name "你的名字"
git config --global user.email "你在 GitHub 使用的 Email"
```

若希望 GitHub 正確連結你的 commit，可使用 GitHub 帳號中的 email，或 GitHub 提供的 `noreply` email。

## 任務 B：認識三個區域

進入練習場：

```bash
cd playground
git status
```

Git 的本機流程有三站：

```text
工作區 --git add--> 暫存區 --git commit--> 版本庫
```

- **工作區：** 你正在看到、編輯的檔案。
- **暫存區：** 精選「下一個 commit」要收錄的內容。
- **版本庫：** 已提交、可以回看的歷史。

再執行：

```bash
git log --oneline
```

前方那串短代碼是 commit ID；同一份內容與歷史會得到可辨識的雜湊值。

## 驗收

- `git --version` 能顯示版本。
- `git config user.name` 與 `git config user.email` 都有輸出。
- 你位於 `playground`，`git status` 顯示 `On branch main`。

完成後進入 [第 01 關](01-first-commit.md)。
