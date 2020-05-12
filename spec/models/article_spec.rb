require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe '#create #update' do
    it "titleが空では登録できないこと" do
      article = build(:article, title: "")
      article.valid?
      expect(article.errors[:title]).to include("が入力されていません。")
    end
    it "titleが40文字以上では登録できないこと" do
      length_41_title = "こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこ"
      article = build(:article, title: length_41_title)
      article.valid?
      expect(article.errors[:title]).to include("は40文字以下に設定して下さい。")
    end
    it "contentが空では登録できないこと" do
      article = build(:article, content: "")
      article.valid?
      expect(article.errors[:content]).to include("が入力されていません。")
    end
    it "title,contentが存在すれば登録できること" do
      article = build(:article)
      article.valid?
      expect(article).to be_valid
    end
  end
end
