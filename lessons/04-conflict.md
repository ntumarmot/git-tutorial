# 第 04 關：衝突大對決

**劇情：** 你和店長都改了首頁標語。Git 不知道哪個才是團隊真正想要的版本，必須請你決定。

> 這一關刻意製造衝突。請在 `playground` 且工作區乾淨時開始。

## 任務 A：你的版本

```bash
git switch -c feature/new-slogan
```

把 `index.html` 中 `<h1>` 那行改成：

```html
<h1>土撥鼠咖啡館：每一口都是冒險</h1>
```

然後提交：

```bash
git add index.html
git commit -m "Write adventurous cafe slogan"
```

## 任務 B：店長的版本

回到 `main`：

```bash
git switch main
```

把同一行改成：

```html
<h1>土撥鼠咖啡館：城市裡的森林角落</h1>
```

提交：

```bash
git add index.html
git commit -m "Update slogan for cozy brand"
```

## 任務 C：讓兩條線相遇

```bash
git merge feature/new-slogan
```

你會看到 `CONFLICT`。這不是 Git 壞掉，而是它拒絕猜測人類的意圖。

```bash
git status
```

打開 `index.html`，找到：

```text
    <<<<<<< HEAD
    main 目前的內容
    =======
    feature/new-slogan 帶來的內容
    >>>>>>> feature/new-slogan
```

自行決定最後標語。你可以選一邊，也可以融合成更好的句子。重要的是把三種標記全部移除，留下合法 HTML。

完成後：

```bash
git add index.html
git status
git commit -m "Resolve homepage slogan conflict"
git log --oneline --graph --decorate --all
```

## Bonus：我想先退出

衝突尚未解完時，可以讓整次 merge 回到開始前：

```bash
git merge --abort
```

如果你想體驗這條路，可 abort 後再執行一次 merge。

## 驗收

```bash
git status
grep -nE '<<<<<<<|=======|>>>>>>>' index.html
```

- working tree 乾淨。
- `grep` 不應輸出任何衝突標記。
- 首頁仍能正常開啟。

下一關：[第 05 關：前進 GitHub](05-github.md)。
