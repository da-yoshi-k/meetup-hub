require 'rails_helper'

RSpec.describe 'UserSessions', type: :request do
  let!(:user) { create(:user) }
  describe 'GET /new' do
    it 'HTTPステータスが200であること' do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post login_path, params: { email: user.email, password: user.password }
        expect(response.status).to eq 200
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post login_path, params: { email: '', password: '' }
        expect(response.status).to eq 200
      end
    end
  end

  describe 'DELETE /destroy' do
    before do
      login_user(user, user.password, login_path)
    end

    it 'リクエストが成功すること' do
      delete logout_path
      expect(response.status).to eq 303
    end
  end
end
