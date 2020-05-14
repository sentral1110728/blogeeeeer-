require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  describe 'GET #index,new,edit 未ログイン' do
    it '未ログイン者がリクエストするとtopページへリダイレクトすること' do
      get categories_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    it '未ログイン者がリクエストするとtopページへリダイレクトすること' do
      get new_category_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    it '未ログイン者がリクエストするとtopページへリダイレクトすること' do
      get edit_category_path(category.id)
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end
  end

  describe 'GET #index,new,edit 一般ログイン' do
    before do
      sign_in user
    end
    it '一般ログイン者がリクエストするとtopページへリダイレクトすること' do
      get categories_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    it '一般ログイン者がリクエストするとtopページへリダイレクトすること' do
      get new_category_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    it '一般ログイン者がリクエストするとtopページへリダイレクトすること' do
      get edit_category_path(category.id)
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end
  end
end
