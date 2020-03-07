class Booking < ApplicationRecord
  has_many :booking_items
  belongs_to :customer
  belongs_to :screening
end
