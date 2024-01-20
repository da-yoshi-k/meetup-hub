require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /new' do
    it 'HTTPステータスが200であること' do
      get new_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post users_path, params: { user: attributes_for(:user) }
        expect(response.status).to eq 302
      end

      it 'ユーザーが登録されること' do
        expect do
          post users_path, params: { user: attributes_for(:user) }
        end.to change(User, :count).by(1)
      end

      it 'リダイレクトすること' do
        post users_path, params: { user: attributes_for(:user) }
        expect(response).to redirect_to login_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが失敗すること' do
        post users_path, params: { user: attributes_for(:user, email: '') }
        expect(response.status).to eq 422
      end

      it 'ユーザーが登録されないこと' do
        expect do
          post users_path, params: { user: attributes_for(:user, email: '') }
        end.to_not change(User, :count)
      end
    end
  end
end
