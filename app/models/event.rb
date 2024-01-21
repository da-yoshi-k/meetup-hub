class Event < ApplicationRecord
  validates :title, presence: true
  validates :purpose, presence: true
  validates :max_participants, presence: true
  validates :priority_condition, presence: true
  validates :status, presence: true

  enum status: { open: 0, closed: 1 }

  has_many :event_participants, dependent: :destroy
  belongs_to :user
end
