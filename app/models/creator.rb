class Creator < ApplicationRecord
  has_many :creations
  has_many :destinations, through: :creations
end
