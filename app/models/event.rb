class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :purpose, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }
  validates :location, length: { maximum: 50 }
  validates :max_participants, presence: true, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 8 }
  validates :priority_condition, presence: true, length: { maximum: 50 }
  validates :status, presence: true

  enum status: { open: 0, waiting: 1, created: 2, decided: 3 }

  has_many :event_participants, dependent: :destroy
  belongs_to :user
end
