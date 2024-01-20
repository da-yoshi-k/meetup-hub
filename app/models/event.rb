class Event < ApplicationRecord
  validates :title, presence: true
  validates :max_participants, presence: true
  validates :priority_condition, presence: true
  validates :status, presence: true

  enum status: { open: 0, closed: 1 }
end
