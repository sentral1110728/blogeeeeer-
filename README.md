# Blogeeeeer!(アプリ名)
- 記事投稿アプリ
- GitHub</br>
https://github.com/sentral1110728/blogeeeeer-
- アプリURL</br>
https://blogeeeeer.com

# Test Account(テストアカウント)
- Email・・・admin@example.jp
- password・・・11111111

# Overview(概要)
このアプリは某番組(鉄腕DASHのDASH村)をネット上で運営するならどうするかを考え作成しました。</br>
日々活動した内容をカテゴリー別に記事にでき、ユーザーはコメントやいいねをすることができます。</br>
カテゴリー管理画面では、それぞれのカテゴリーに紐付くデータ(記事数、コメント数、いいね数、最新記事の日付など)を確認することができます。

# Features(機能)
- ユーザーとユーザーに紐づくプロフィール作成機能。
- プロフィールの編集機能。
- カテゴリー作成・編集・削除機能。
- 記事作成・編集・削除機能。
- 記事のページング機能
- 記事に対してのコメント作成機能(非同期)。
- 記事に対してのいいね機能(非同期)。
- 記事の検索機能。
- twitterでログイン(APIの利用)
- RSpec を使った単体テスト
- rubocopによる静的コード解析
- capistrano による AWS EC2 への自動デプロイ 
- AWS S3 の利用
- サイトの常時SSL化

## トップページ
[![Image from Gyazo](https://i.gyazo.com/dfe6eb977e0d2bc826ede247a1a6f7d2.jpg)](https://gyazo.com/dfe6eb977e0d2bc826ede247a1a6f7d2)

## カテゴリー管理ページ
[![Image from Gyazo](https://i.gyazo.com/5e21244e1e3041744149059e610c9a5c.jpg)](https://gyazo.com/5e21244e1e3041744149059e610c9a5c)

## 記事一覧ページ
[![Image from Gyazo](https://i.gyazo.com/32c357de77b4aad8f39330f7d9e6aa02.jpg)](https://gyazo.com/32c357de77b4aad8f39330f7d9e6aa02)

## 記事詳細ページ
[![Image from Gyazo](https://i.gyazo.com/4e92b7d2a7b652c91cca4a72a3e7f4ce.png)](https://gyazo.com/4e92b7d2a7b652c91cca4a72a3e7f4ce)

# technology(使用技術)
- Ruby 2.5.3
- Rails 5.2.3
- javaScritp
- jQuery
- MySQL
- git(github)
- AWS(EC2,S3,route53)

# point (こだわりポイント)
- blogeeeeerサイト内は常時https化している。
- カテゴリー管理のページで各々のカテゴリーの状況(最新記事の日付、コメント数、いいね数など)が確認できる。
- いいねやコメントを非同期で表示させている。

# Future Implementation(今後の実装予定)
### 優先度(高)
- Cookieにsecure属性をつける(他のセキュリティ関係も)
### 優先度(低)
- アカウント作成時メールもしくはsmsにてユーザー確認を行う
- Facebookでログイン(APIの利用)
- 商品の登録機能
- 商品購入(カート・クレジット・ポイント機能)
- Googleカレンダーの利用(API)
- イベント情報をカレンダーに表示(googleCalenderAPI)詳細、編集、削除、登録機能
- イベント予約機能・予約者一覧機能
- 会員ユーザーの一覧・権限の変更・最終ログイン日時の表示
- 削除は基本的に論理削除にする
- コメントの編集・削除機能
- 新着記事アイコン表示
- モバイル対応
- CI/CDツールの利用
- AWS ECSの利用
- Dockerの利用

### 反省点
- 一機能ずつテストしていなかった為、一通りの機能を実装し終わったところで、バグが次々と見つかった。

## authoritiesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
- has_many :users

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|authority_id|integer|null: false, foreign_key: true|
|nickname|string|null: false|
### Association
- has_many :articles
- has_many :comments
- has_one :profile
- belongs_to :authority
- has_many :likes, dependent: :destroy
- accepts_nested_attributes_for :profile

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true|
|appeal|text||
|user_image|string||
### Association
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|image|string|null: false|
### Association
- has_many :articles

## articlesテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|
|title|string|null: false|
|content|text|null: false|
### Association
- has_many :likes, dependent: :destroy
- belongs_to :user
- has_many :comments
- belongs_to :category

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|article_id|integer|null: false, foreign_key: true|
|comment|text||
### Association
- belongs_to :user
- belongs_to :article

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|article_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|
### Association
- belongs_to :article
- belongs_to :user
