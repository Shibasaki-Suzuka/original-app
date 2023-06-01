# アプリケーション名
Dream Note

# アプリケーション概要
夢を投稿し、達成時のコメントや写真を投稿することができる。

# URL
https://original-app-39101.onrender.com/

# テスト用アカウント
- Basic認証ID：履歴書参照
- Basic認証パスワード：履歴書参照
- メールアドレス：sample@test.com
- パスワード：12345x

# 利用方法
## 夢の投稿
1. トップページのヘッダーからユーザー新規登録を行う
2. トップページ（一覧ページ）で夢の新規投稿ボタン「ゆめができた」から夢（内容、金額、期限、メモ）を入力し投稿する。

## 達成時の投稿
1. トップページ（一覧ページ）で夢の左の編集ボタンから夢の投稿詳細を閲覧できる。
2. 達成時は叶えたボタンから達成時の投稿（日付、コメント、写真）ができる。

# アプリケーションを作成した背景
以前読んだ自己啓発本に「人生で達成したい夢を100個リストアップし目標を常に持つことが大切だ」と記載があり、実際に友人とリストの作成を行いました。当時は紙に書いていましたが、いつでもリストを見ることができ夢を叶えた時の気持ちや写真を残せたらより良いものになると考え、夢リストのアプリケーション版を作成したいと考えました。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1YP5fdy9IiunYOUuESmDaxk0vB5Q_7Ksikz-9dyf6luA/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
# 実装予定の機能
- フレンド登録機能：フレンドを登録し、登録したフレンド同士はお互いの夢リストを閲覧することができる
- いいね機能：フレンドのいいと思った夢に対し「いいね」ができる
- 並び替え機能：達成した順、金額順など、夢リストの並び替えや絞りができる

# データベース設計
## ER図
[![Image from Gyazo](https://i.gyazo.com/d553d9838eb8a38656f2c7a380238f06.png)](https://gyazo.com/d553d9838eb8a38656f2c7a380238f06)

## users table

| Column              | Type          | Options                   |
|---------------------|---------------|---------------------------|
| nickname            | string        | null: false, unique: true |
| email               | string        | null: false, unique: true |
| encrypted_password  | string        | null: false               |
| last_name           | string        | null: false               |
| first_name          | string        | null: false               |
| last_name_hiragana  | string        | null: false               |
| first_name_hiragana | string        | null: false               |
| birthday            | date          | null: false               |

### Association

* has_many :dreams
* has_many :friends

## dreams table

| Column        | Type            | Options                       |
|---------------|-----------------|-------------------------------|
| dream_list    | string          | null: false                   |
| cost          | string          |                               |
| due           | string          |                               |
| memo          | text            |                               |
| user          | references      | null: false, foreign_key: true|

### Association

* belongs_to :user
* belongs_to :favorite
* has_one :achieve 

## achieves table

| Column        | Type            | Options                       |
|---------------|-----------------|-------------------------------|
| comment       | text            |                               |
| success_day   | text            | null: false                   |
| dream         | references      | null: false, foreign_key: true|

### Association

* belongs_to :dream

## favorites table

| Column        | Type            | Options                       |
|---------------|-----------------|-------------------------------|
| dream         | references      | null: false, foreign_key: true|

### Association

* belongs_to :dream

## friend table

| Column        | Type            | Options                       |
|---------------|-----------------|-------------------------------|
| user          | references      | null: false, foreign_key: true|

### Association

* belongs_to :user

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/6d655e3362f5fb1c7e52398a360fdd8c.png)](https://gyazo.com/6d655e3362f5fb1c7e52398a360fdd8c)

# 開発環境
- HTML/CSS
- Ruby
- Ruby on rails
- mySQL

# 工夫したポイント
- アプリケーションのページ内の配色を工夫しました。
  - 夢というイメージカラーが虹色で、かわいい配色で楽しく使ってほしいと考えたので青空をイメージする水色を基調カラーとして使用し、強調したい箇所は補色関係にあり、夕焼けをイメージするピンク色にしました。
- 登録情報に「名前」の他に「ニックネーム」を設けることで、匿名性のあるサービスにしました。
  - 将来的な使用方法として、友人や他人などの不特定多数の人からもお互いの夢リストを閲覧し合えるようにするので、ユーザーのプライバシーを保護する意味で「ニックネーム」を設けています。
