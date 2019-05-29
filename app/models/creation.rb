class Creation < ApplicationRecord
  belongs_to :creator
  belongs_to :destination
end
