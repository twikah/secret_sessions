class Session < ApplicationRecord
  validates :movie, presence: true
  validates :description, presence: true, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
  validates :neighborhood, presence: true
  validates :date, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
end
