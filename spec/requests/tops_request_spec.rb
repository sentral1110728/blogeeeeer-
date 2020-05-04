require 'rails_helper'

RSpec.describe "Tops", type: :request do
  describe 'GET #index' do
    it 'リクエストが成功すること' do
      get tops_url
      expect(response.status).to eq 200
    end
  end
end
