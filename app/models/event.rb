class Event < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, length: { maximum: 500, minimum: 10 }
  validates :event_date, presence: true
end
