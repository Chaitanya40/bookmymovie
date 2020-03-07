class Seat < ApplicationRecord
  belongs_to :screening
  belongs_to :seating_category
end
