class Auditorium < ApplicationRecord
  belongs_to :cinema
  has_many :screenings
end
