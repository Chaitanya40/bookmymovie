class Screening < ApplicationRecord
  belongs_to :movie
  belongs_to :auditorium
  belongs_to :cinema, through: :auditorium
end
