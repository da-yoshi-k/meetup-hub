require 'rails_helper'

RSpec.describe EventParticipant, type: :model do
  let!(:event_participant) { create(:event_participant) }

  describe 'バリデーション' do
    it 'event_idがnilならバリデーションが通らない' do
      event_participant.event_id = nil
      expect(event_participant).not_to be_valid
    end

    it 'user_idがnilならバリデーションが通らない' do
      event_participant.user_id = nil
      expect(event_participant).not_to be_valid
    end
  end
end
