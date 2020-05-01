# Blogeeeeer!(アプリ名)
- 文書管理システム
- GitHub</br>
https://github.com/sentral1110728/blogeeeeer-
- アプリURL</br>
http://13.230.224.20

# Test Account(テストアカウント)
- Email・・・admin@example.cam
- password・・・11111111

# Overview(概要)
前職で書類保管による業務の非効率性があったので、改善するアプリを作成しました。</br>
毎日レポートを紙で作成しているので、大量の書類で場所を取る上に過去履歴を見るのに</br>
時間がかかるという問題がありました。また勤務表も手書きをしており、時間がかかっていました。</br>
そんな問題をこのアプリが解決をしてくれます。

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

# technology(使用技術)
- Ruby 2.5.3
- Rails 5.2.3
- javaScritp
- jQuery
- MySQL
- git(github)
- AWS(EC2,S3)

# point (こだわりポイント)
- 社員が部署に所属しており、投稿レポートが部署と紐づいている事。
- 出社ボタンと退社ボタンで時間を取得出来て、勤務表にも反映される事。
- 5日分の天気情報を取得したので、素早く天気を確認する事が出来る。

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
