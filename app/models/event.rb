class Event < ApplicationRecord
  validates :title, presence: true
  validates :purpose, presence: true
  validates :max_participants, presence: true, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 8 }
  validates :priority_condition, presence: true
  validates :status, presence: true

  enum status: { open: 0, closed: 1 }

  has_many :event_participants, dependent: :destroy
  belongs_to :user
end
