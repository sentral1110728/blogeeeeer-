# Blogeeeeer!(アプリ名)
- 文書管理システム
- GitHub</br>
https://github.com/sentral1110728/blogeeeeer-
- アプリURL</br>
http://13.230.224.20

# Test Account(テストアカウント)
- Email・・・admin@example.jp
- password・・・11111111

# Overview(概要)
このアプリは某番組(鉄腕DASHのDASH村)をネット上で運営するならどうするかを考え作成しました。</br>
選定の理由としては多様な機能を実装する必要があるのでスキルアップにつながるのではないかと考えたからです。

# Features(機能)
- ユーザーとユーザーに紐づくプロフィール作成機能。
- カテゴリー作成・編集機能。
- 記事作成・編集・削除機能。
- 記事に対してのコメント作成機能。
- 記事に対してのいいね機能。
- 記事の検索機能。
- RSpec を使った単体テスト
- capistrano による AWS EC2 への自動デプロイ 
- AWS S3 の利用

![Uploading スクリーンショット 2020-05-02 10.52.55.png…]()

# technology(使用技術)
- Ruby 2.5.3
- Rails 5.2.3
- javaScritp
- jQuery
- MySQL
- git(github)
- AWS(EC2,S3)

# point (こだわりポイント)
- カテゴリーが３つ以上ある場合は改行され、２列に分けられる。
- カテゴリー管理のページで各々のカテゴリーの状況(最新記事の日付、コメント数、いいね数など)が確認できる。
- いいねを非同期で実装した。

# Future Implementation(今後の実装予定)
- アカウント作成時メールもしくはsmsにてユーザー確認を行う
- Facebookでログイン(APIの利用)
- twitterでログイン(APIの利用)
- 商品の登録機能
- 商品購入(カート・クレジット・ポイント機能)
- Googleカレンダーの利用(API)
- イベント情報をカレンダーに表示(googleCalenderAPI)詳細、編集、削除、登録機能
- イベント予約機能・予約者一覧機能
- 会員ユーザーの一覧・権限の変更・最終ログイン日時の表示
- 削除は基本的に論理削除にする
- コメントの編集・削除機能
- カテゴリーの削除機能
- 新着記事アイコン表示
- レイアウトの改修
- モバイル対応
- Dockerの利用
- CI/CDツールの利用
- AWS ECSの利用
- 常時SSL化(セキュリティ関係)

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
|image|string||
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
