class Booking < ApplicationRecord
  belongs_to :session
  belongs_to :user

  validates :quantity, presence: true
end
