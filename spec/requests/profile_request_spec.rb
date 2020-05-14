require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  let(:profile) { create(:profile) }

  describe 'GET #edit 未ログイン' do
    it '未ログイン者がリクエストするとtopページへリダイレクトすること' do
      get edit_user_profile_path(profile.user_id, profile.id)
      expect(response).to redirect_to(new_user_session_path)
      expect(response.status).to eq 302
    end
  end

  describe 'GET #show 未ログイン' do
    before do
      sign_in profile.user
    end
    it 'ログイン者がリクエストに成功すること' do
      get user_profile_path(profile.user_id, profile.id)
      expect(response.status).to eq 200
    end
    it 'ユーザー名が表示されていること' do
      get user_profile_path(profile.user_id, profile.id)
      expect(response.body).to include profile.user.nickname.to_s
    end
    it '自己紹介が表示されていること' do
      get user_profile_path(profile.user_id, profile.id)
      expect(response.body).to include profile.appeal.to_s
    end
    it 'プロフィール画像が表示されていること' do
      get user_profile_path(profile.user_id, profile.id)
      expect(response.body).to include profile.user_image.to_s
    end
  end

  describe 'GET #show 一般ログイン' do
    before do
      sign_in profile.user
    end
    it 'ログイン者がリクエストに成功すること' do
      get user_profile_path(profile.user_id, profile.id)
      expect(response.status).to eq 200
    end
    it 'ユーザー名が表示されていること' do
      get user_profile_path(profile.user_id, profile.id)
      expect(response.body).to include profile.user.nickname.to_s
    end
    it '自己紹介が表示されていること' do
      get user_profile_path(profile.user_id, profile.id)
      expect(response.body).to include profile.appeal.to_s
    end
    it 'プロフィール画像が表示されていること' do
      get user_profile_path(profile.user_id, profile.id)
      expect(response.body).to include profile.user_image.to_s
    end
  end

  describe 'GET #edit 一般ログイン' do
    before do
      sign_in profile.user
    end
    it 'ログイン者がリクエストに成功すること' do
      get edit_user_profile_path(profile.user_id, profile.id)
      expect(response.status).to eq 200
    end
    it 'ユーザー名が表示されていること' do
      get edit_user_profile_path(profile.user_id, profile.id)
      expect(response.body).to include profile.user.nickname.to_s
    end
    it '自己紹介が表示されていること' do
      get edit_user_profile_path(profile.user_id, profile.id)
      expect(response.body).to include profile.appeal.to_s
    end
    it 'プロフィール画像が表示されていること' do
      get edit_user_profile_path(profile.user_id, profile.id)
      expect(response.body).to include profile.user_image.to_s
    end
  end
end
