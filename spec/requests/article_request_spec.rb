require 'rails_helper'

RSpec.describe "Articles", type: :request do

  describe 'GET #index' do
    it 'リクエストが成功すること' do
      @category = create(:category)
      get articles_path, params: { category_id: @category.id }
      expect(response.status).to eq 200
    end
  end

  describe 'GET #new' do
    it '未ログイン者が記事の作成画面へ遷移しようとしたらindexへリダイレクトすること' do
      @category = create(:category)
      get new_article_path
      expect(response).to redirect_to(new_user_session_path)
      expect(response.status).to eq 302
    end
  end

  describe 'GET #edit' do
    it '未ログイン者が記事の編集画面へ遷移しようとしたらindexへリダイレクトすること' do
      @article = create(:article)
      get edit_article_path(@article)
      expect(response).to redirect_to(new_user_session_path)
      expect(response.status).to eq 302
    end
  end

  describe 'GET #show' do
    it '記事詳細画面へのリクエストが成功すること' do
      @article = create(:article)
      get article_path(@article.id)
      expect(response.status).to eq 200
    end
  end
end
