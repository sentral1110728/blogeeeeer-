require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:user) { create(:user) }
  describe 'GET #index,new,edit,show 未ログイン' do
    it 'リクエストが成功すること(index)' do
      @category = create(:category)
      get articles_path, params: { category_id: @category.id }
      expect(response.status).to eq 200
    end

    it '未ログイン者が記事の作成画面へ遷移しようとしたらindexへリダイレクトすること' do
      get new_article_path
      expect(response).to redirect_to(new_user_session_path)
      expect(response.status).to eq 302
    end

    it '未ログイン者が記事の編集画面へ遷移しようとしたらindexへリダイレクトすること' do
      @article = create(:article)
      get edit_article_path(@article)
      expect(response).to redirect_to(new_user_session_path)
      expect(response.status).to eq 302
    end

    it '記事詳細画面へのリクエストが成功すること' do
      @article = create(:article)
      get article_path(@article.id)
      expect(response.status).to eq 200
    end
  end

  describe 'GET #index,new,edit,show 一般ログイン' do
    before do
      sign_in user
    end
    it 'リクエストが成功すること(index)' do
      @category = create(:category)
      get articles_path, params: { category_id: @category.id }
      expect(response.status).to eq 200
    end

    it '一般ログイン者が記事の作成画面へ遷移しようとしたらroot_pathへリダイレクトすること' do
      get new_article_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    it 'リクエストが成功すること(edit)' do
      @article = create(:article)
      get edit_article_path(@article)
      expect(response.status).to eq 200
    end

    it '記事詳細画面へのリクエストが成功すること' do
      @article = create(:article)
      get article_path(@article.id)
      expect(response.status).to eq 200
    end
  end


end
