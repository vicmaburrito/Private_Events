class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances
  validates :title, presence: true, length: { maximum: 15 }
  validates :body, presence: true, length: { minimum: 5 }
  validates :date, presence: true
  scope :past, -> { where('date < ?', DateTime.now) }
  scope :future, -> { where('date >= ?', DateTime.now) }
end
