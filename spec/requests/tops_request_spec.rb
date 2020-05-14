require 'rails_helper'

RSpec.describe 'Tops', type: :request do
  let(:profile) { create(:profile) }
  describe 'GET #index 未ログイン' do
    it 'リクエストが成功すること' do
      get tops_url
      expect(response.status).to eq 200
    end
    it 'headerにユーザー名が表示されていないこと' do
      get tops_url
      expect(response.body).not_to include profile.user.nickname.to_s
    end
    it 'headerにログアウトが表示されていないこと' do
      get tops_url
      expect(response.body).not_to include 'ログアウト'
    end
    it 'headerに記事を検索が表示されていること' do
      get tops_url
      expect(response.body).to include '記事を検索'
    end
    it 'headerにアプリ名が表示されていること' do
      get tops_url
      expect(response.body).to include 'blogeeeeer!'
    end
    it 'headerにメニューが表示されていないこと' do
      get tops_url
      expect(response.body).not_to include 'メニュー'
    end
    it '活動記録が表示されていること' do
      get tops_url
      expect(response.body).to include '活動記録'
    end
  end

  describe 'GET #index 一般ログイン' do
    before do
      sign_in profile.user
    end
    it 'リクエストが成功すること' do
      get tops_url
      expect(response.status).to eq 200
    end
    it 'headerにユーザー名が表示されていること' do
      get tops_url
      expect(response.body).to include profile.user.nickname.to_s
    end
    it 'headerにログアウトが表示されていること' do
      get tops_url
      expect(response.body).to include 'ログアウト'
    end
    it 'headerに記事を検索が表示されていること' do
      get tops_url
      expect(response.body).to include '記事を検索'
    end
    it 'headerにアプリ名が表示されていること' do
      get tops_url
      expect(response.body).to include 'blogeeeeer!'
    end
    it 'headerにメニューが表示されていないこと' do
      get tops_url
      expect(response.body).not_to include 'メニュー'
    end
    it '活動記録が表示されていること' do
      get tops_url
      expect(response.body).to include '活動記録'
    end
  end
end
