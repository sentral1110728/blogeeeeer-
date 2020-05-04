require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  # let(:admin_user) { create(:admin_user) }
  # let(:authority) { create(:authority) }
  describe 'GET #index' do
    it '未ログイン者がリクエストするとtopページへリダイレクトすること' do
      get categories_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    before do
      sign_in user
      # sign_in admin_user
    end
    it '一般ログイン者がリクエストするとtopページへリダイレクトすること' do
      get categories_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    # it '管理者がリクエストすると成功すること' do
    #   get categories_path
    #   expect(response.status).to eq 200
    # end
  end

  describe 'GET #new' do
    it '未ログイン者がリクエストするとtopページへリダイレクトすること' do
      get new_category_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    before do
      sign_in user
    end
    it '一般ログイン者がリクエストするとtopページへリダイレクトすること' do
      get new_category_path
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end
  end

  describe 'GET #edit' do
    it '未ログイン者がリクエストするとtopページへリダイレクトすること' do
      get edit_category_path(category.id)
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end

    before do
      sign_in user
    end
    it '一般ログイン者がリクエストするとtopページへリダイレクトすること' do
      get edit_category_path(category.id)
      expect(response).to redirect_to(root_path)
      expect(response.status).to eq 302
    end
  end
end
