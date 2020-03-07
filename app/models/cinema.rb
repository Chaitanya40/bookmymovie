class Cinema < ApplicationRecord
  has_many :auditoria
  has_many :screenings, through: :auditoria
end
