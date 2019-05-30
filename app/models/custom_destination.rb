class CustomDestination < ApplicationRecord
  has_many :visits
  has_many :custom_visits
  has_many :users, through: :visits
  has_many :users, through: :custom_visits
end
