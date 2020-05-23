require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:article) { create(:article) }
  describe 'GET #index,new,edit,show 未ログイン' do
    it 'リクエストが成功すること(index)' do
      get articles_path, params: { category_id: category.id }
      expect(response.status).to eq 200
    end

    it '未ログイン者が記事の作成画面へ遷移しようとしたらtopページへリダイレクトすること' do
      get new_article_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    it '未ログイン者が記事の編集画面へ遷移しようとしたらtopページへリダイレクトすること' do
      get edit_article_path(article)
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    it '記事詳細画面へのリクエストが成功すること' do
      get article_path(article.id)
      expect(response.status).to eq 200
    end
  end

  describe 'GET #index,new,edit,show 一般ログイン' do
    before do
      sign_in user
    end
    # it 'リクエストが成功すること(index)' do
    #   get articles_path, params: { category_id: category.id }
    #   expect(response.status).to eq 200
    # end

    it '記事の作成画面へ遷移しようとしたらroot_pathへリダイレクトすること' do
      get new_article_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    it '記事の編集画面へ遷移しようとしたらroot_pathへリダイレクトすること' do
      get edit_article_path(article)
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    # it 'リクエストが成功すること(show)' do
    #   get article_path(article.id)
    #   expect(response.status).to eq 200
    # end
  end
end
