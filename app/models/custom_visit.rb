class CustomVisit < ApplicationRecord
  belongs_to :user
  belongs_to :custom_destination
end
