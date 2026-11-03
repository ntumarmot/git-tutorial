# 開始冒險

歡迎加入「土撥鼠咖啡館」網站團隊。今天的目標不是把 Git 指令背熟，而是安全地把一個想法送進團隊的正式版本。

## 1. 建立你的練習場

在本教材根目錄執行：

```bash
./scripts/new-playground.sh
cd playground
```

若 `playground` 已存在，腳本會停止，不會覆蓋你的作品。你可以指定別的名稱：

```bash
./scripts/new-playground.sh my-second-try
cd my-second-try
```

## 2. 確認起點

```bash
git status
git log --oneline
```

你應該看到位於 `main`、工作區乾淨，而且已有一個 `Initial cafe website` commit。

用瀏覽器開啟 `index.html`，你會看到一間剛開張、菜單還很陽春的咖啡館。

## 3. 選擇路線

- 第一次使用 Git：從 [00 準備出發](lessons/00-setup.md) 依序前進。
- 已會 commit，但不熟分支：從 [03 新品秘密開發](lessons/03-branches.md) 開始。
- 已會本機 Git：直接挑戰 [05 前進 GitHub](lessons/05-github.md)。
- 只有 30 分鐘：做第 01、03、04 關。

## 冒險規則

1. 每輸入一個指令，先猜會發生什麼，再按 Enter。
2. 常用 `git status`；它不是報錯畫面，而是 Git 給你的導航。
3. 不要複製自己不懂的復原指令。先確認它會影響工作區、暫存區，還是 commit 歷史。
4. 卡關是教材的一部分。Git 幾乎都有安全的復原路徑。

準備好了就進入 [第 00 關](lessons/00-setup.md)。
