class Session < ApplicationRecord
  has_many :users, through: :bookings
  has_many :bookings
  belongs_to :user

  geocoded_by :neighborhood
  after_validation :geocode, if: :will_save_change_to_neighborhood?

  validates :movie, presence: true
  validates :description, presence: true, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }
  validates :neighborhood, presence: true
  validates :date, presence: true
  validates :capacity, presence: true
  validates :price, presence: true

end
