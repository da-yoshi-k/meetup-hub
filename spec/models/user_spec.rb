require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it 'email, password, password_confirmationがあれば有効な状態であること' do
      user = User.new(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end
  end
end
