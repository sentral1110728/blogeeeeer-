require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:profile) { create(:profile) }
  describe 'GET #edit' do
    before do
      sign_in profile.user
    end
    it 'ログイン者がリクエストに成功すること' do
      get edit_user_profile_path(profile.user_id, profile.id)
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit 未ログイン' do
    it '未ログイン者がリクエストするとtopページへリダイレクトすること' do
      get edit_user_profile_path(profile.user_id, profile.id)
      expect(response).to redirect_to(new_user_session_path)
      expect(response.status).to eq 302
    end
  end
end
