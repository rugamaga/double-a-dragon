# double-a-dragon

![double-a-dragon](https://github.com/rugamaga/double-a-dragon/blob/master/docs/screenshot.png)

## これは何？

.choさん [@ten_chou](https://twitter.com/ten_chou) の #ダブルあドラゴン [@nnn_fo](https://twitter.com/nnn_fo) を紹介する
Euchaetaさん [@euchaeta](https://twitter.com/euchaeta) の blog記事( https://note.com/euchaeta/n/n06a4dc5bfb8c ) を見て
面白そうだと思った [@rugamaga](https://twitter.com/rugamaga) がパッとたくさん #ダブルあドラゴン しようと思って作ったスクリプトです。

## 使い方

1. GCPでGoogleTranslateAPIを有効にしてください
2. GoogleTranslateAPIを利用できるサービスアカウントを発行し、キーをjsonなどでダウンロードします
3. 以下のようなコマンドを実行します

```
GOOGLE_APPLICATION_CREDENTIALS=<サービスアカウントキーへのパス> ruby double-a-dragon.rb
```
