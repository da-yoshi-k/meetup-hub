require 'rails_helper'

RSpec.describe Event, type: :model do
  let!(:event) { create(:event) }

  describe 'バリデーション' do
    it 'titleが50文字以上ならバリデーションが通らない' do
      event.title = 'a' * 51
      expect(event).not_to be_valid
    end

    it 'purposeが50文字以上ならバリデーションが通らない' do
      event.purpose = 'a' * 51
      expect(event).not_to be_valid
    end

    it 'descriptionが200文字以上ならバリデーションが通らない' do
      event.description = 'a' * 201
      expect(event).not_to be_valid
    end

    it 'locationが50文字以上ならバリデーションが通らない' do
      event.location = 'a' * 51
      expect(event).not_to be_valid
    end

    it 'max_participantsが1ならバリデーションが通らない' do
      event.max_participants = 1
      expect(event).not_to be_valid
    end

    it 'max_participantsが2ならバリデーションが通る' do
      event.max_participants = 2
      expect(event).to be_valid
    end

    it 'max_participantsが8ならバリデーションが通る' do
      event.max_participants = 8
      expect(event).to be_valid
    end

    it 'max_participantsが9ならバリデーションが通らない' do
      event.max_participants = 9
      expect(event).not_to be_valid
    end

    it 'priority_conditionが50文字以上ならバリデーションが通らない' do
      event.priority_condition = 'a' * 51
      expect(event).not_to be_valid
    end
  end
end
